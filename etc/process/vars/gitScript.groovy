#!/usr/bin/env groovy

def gitCheckOut(String repoName, String url, String credentialsId, branches) {

  checkout([
          $class                           : 'GitSCM',
          branches                         : branches,
          doGenerateSubmoduleConfigurations: false,
          extensions                       : scm.extensions + [
                  [$class: 'LocalBranch', localBranch: '**'],
                  [$class: 'CheckoutOption', timeout: 1],
//                [$class: 'CloneOption', depth: 2, noTags: false, reference: "/var/lib/git/${repoName}", shallow: true, timeout: 1],
                  [$class: 'AuthorInChangelog'],
                  [$class: 'PruneStaleBranch'],
                  [$class: 'IgnoreNotifyCommit']
          ],
          submoduleCfg                     : [],
          userRemoteConfigs                : scm.userRemoteConfigs + [
                  [credentialsId: credentialsId, url: url]
          ]
  ])
}

def checkOutGitRepos() {

  final String gitCredentialsId = '50cac519-d41c-4765-8563-c43b7f55c877'
  final String gitRepoUrlFIBO   = 'https://github.com/edmcouncil/fibo.git'
  final String gitRepoUrlLCC    = 'https://github.com/edmcouncil/LCC.git'

  dir('input') {
    dir('fibo') {
      gitCheckOut('fibo', gitRepoUrlFIBO, gitCredentialsId, scm.branches)
    }
    dir('LCC') {
      gitCheckOut('LCC', gitRepoUrlLCC, gitCredentialsId, [[name: '*/master']])
    }
  }
}

def pullRequestStatus(String message) {

  try {
    echo "CHANGE_ID=${env.CHANGE_ID}"

    if (env.BRANCH_NAME.startsWith('PR')) {
      setGitHubPullRequestStatus state: currentBuild.currentResult, context: env.JOB_NAME, message: message
    }
  } catch(e) {
    echo "ERROR: some error occurred in gitScript.pullRequestStatus: ${e}"
  }
}

def setBuildStatus(String message, String state, String context, String sha) {
  step([
    $class: "GitHubCommitStatusSetter",
    reposSource: [$class: "ManuallyEnteredRepositorySource", url: "https://github.com/<yourRepoURL>"],
    contextSource: [$class: "ManuallyEnteredCommitContextSource", context: context],
    errorHandlers: [[$class: "ChangingBuildStatusErrorHandler", result: "UNSTABLE"]],
    commitShaSource: [$class: "ManuallyEnteredShaSource", sha: sha ],
    statusBackrefSource: [$class: "ManuallyEnteredBackrefSource", backref: "${BUILD_URL}flowGraphTable/"],
    statusResultSource: [$class: "ConditionalStatusResultSource", results: [[$class: "AnyBuildResult", message: message, state: state]] ]
  ]);
}


return this
