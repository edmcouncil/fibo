#!/usr/bin/env groovy

//
// Return a stage object that will get executed in the appropriate ontology-publisher container
//
def runInOntologyPublisherContainer(Map config, Closure body) {

  assert config.shortStageName != null
  assert config.longStageName != null
  assert body != null
  assert gitScript != null
  assert slackScript != null

  return {
    stage(config.longStageName) {

      echo "runInOntologyPublisherContainer shortStageName:${config.shortStageName}, longStageName:${config.longStageName}"

      def containerName = "ontology-publisher-${env.BUILD_NUMBER}-${config.shortStageName}"

      node('docker') {
        echo "Running in stage \"${config.longStageName}\" now"
        gitScript.checkOutGitRepos()
        if (config.unstashOutputDirs) {
          config.unstashOutputDirs.each { outputDir ->
            unstash "output-${outputDir}"
          }
        }
        echo "Launching docker container ${containerName}:"
        try {
          def dockerImage = docker.image(env.ONTPUB_IMAGE)
          dockerImage.pull()
          dockerImage.inside("\
          --network none \
          --name ${containerName} \
        ") {
            echo "Running in docker container ${containerName}"
            //
            // Now execute whatever you had in the closure
            //
            body()
          }
        } catch (e) {
          currentBuild.result = "FAILURE"
          echo "Failed stage \"${config.longStageName}\": ${e}"
          gitScript.pullRequestStatus(config.longStageName + " failed")
          throw e
        } finally {
          echo "Tasks in docker container ${containerName} executed successfully"
          if (config.archiveArtifacts == true) {
            archiveArtifacts artifacts: "output/fibo/${config.shortStageName}/**/*.log", fingerprint: true
          }
          gitScript.pullRequestStatus(config.longStageName + " was successful")
          slackScript.notifyStage()
        }
      }
    }
  }
}
