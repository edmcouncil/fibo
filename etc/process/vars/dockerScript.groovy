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

      def containerName = "ontology-publisher-${env.EXECUTOR_NUMBER}-${config.shortStageName}"

      node('docker') {
        echo "Running in stage \"${config.longStageName}\" now"
        gitScript.checkOutGitRepos()
        if (config.unstashOutputDirs) {
          config.unstashOutputDirs.each { outputDir ->
            unstash "output-${outputDir}"
          }
        }
        //
        // Make sure that the output and tmp directories are there
        //
        sh "mkdir output tmp || true"
        echo "Launching docker container ${containerName}:"
        try {
          def dockerImage = docker.image(env.ONTPUB_IMAGE)
          dockerImage.pull()
          dockerImage.inside("""
            --read-only
            --name ${containerName}
            --mount type=bind,source=${env.WORKSPACE}/input,target=/input,readonly,consistency=cached
            --mount type=bind,source=${env.WORKSPACE}/output,target=/output,consistency=delegated
            --mount type=bind,source=${env.WORKSPACE}/tmp,target=/var/tmp,consistency=delegated
          """) {
            echo "Running in docker container ${containerName}"
            //
            // Now execute whatever you had in the closure
            //
            body()
          }
        } catch (e) {
          currentBuild.result = "FAILURE"
          echo "Failed stage \"${config.longStageName}\": ${e}"
          throw e
        } finally {
          echo "Tasks in docker container ${containerName} executed successfully"
          if (config.archiveArtifacts == true) {
            archiveArtifacts artifacts: "output/fibo/${config.shortStageName}/**/*.log", fingerprint: true
          }
          slackScript.notifyStage()
        }
      }
    }
  }
}
