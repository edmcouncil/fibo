#!/usr/bin/env groovy

def checkOutGitRepos() {

  final String gitCredentialsId = '50cac519-d41c-4765-8563-c43b7f55c877'

  dir('input') {
    dir('fibo') {
      //
      // The fibo repo is the main repo which also has configuration in the global variable scm,
      // inherit those settings and add some more here.
      //
      checkout([
        $class                           : 'GitSCM',
        branches                         : scm.branches,
        doGenerateSubmoduleConfigurations: false,
        extensions                       : scm.extensions + [
          [$class: 'LocalBranch', localBranch: '**'],
          [$class: 'CheckoutOption', timeout: 1],
//          [$class: 'CloneOption', depth: 50, noTags: false, reference: '/var/lib/git/fibo', shallow: false, timeout: 1],
          [$class: 'AuthorInChangelog'],
          [$class: 'PruneStaleBranch'],
          [$class: 'IgnoreNotifyCommit']
        ],
        submoduleCfg                     : [],
        userRemoteConfigs                : scm.userRemoteConfigs + [
          [credentialsId: gitCredentialsId, url: 'https://github.com/edmcouncil/fibo.git']
        ]
      ])
    }
    dir('LCC') {
      //
      // The LCC repo is a secondary repo that we always use with its master branch. Do not inherit
      // from the scm settings here.
      //
      checkout([
        $class                           : 'GitSCM',
        branches                         : [[name: '*/master']],
        doGenerateSubmoduleConfigurations: false,
        extensions                       : [
          [$class: 'LocalBranch', localBranch: '**'],
          [$class: 'CheckoutOption', timeout: 1],
//          [$class: 'CloneOption', depth: 50, noTags: false, reference: '/var/lib/git/LCC', shallow: false, timeout: 1],
          [$class: 'AuthorInChangelog'],
          [$class: 'PruneStaleBranch'],
          [$class: 'IgnoreNotifyCommit']
        ],
        submoduleCfg                     : [],
        userRemoteConfigs                : [
          [credentialsId: gitCredentialsId, url: 'https://github.com/edmcouncil/LCC.git']
        ]
      ])
    }
  }
}

return this
