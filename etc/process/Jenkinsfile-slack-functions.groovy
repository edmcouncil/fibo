#!/usr/bin/env groovy

import groovy.transform.Field
@Field private mainSlackMessageObject = null

def init() {
  echo "Initialising slack functions"

  mainSlackMessageObject = slackSend(
    color: "good",
    message: "Started build <${env.BUILD_URL}|Build #${env.BUILD_NUMBER}> on branch ${env.JOB_NAME}",
    botUser: true,
    baseUrl: null,
    teamDomain: 'fibo-edmc'
  )

  if (mainSlackMessageObject == null) {
    echo "ERROR: Could not initialise slack connection"
  } else {
    println ("mainSlackMessageObject: " + mainSlackMessageObject.dump())
  }
}

def send(String color, String message) {

  if (mainSlackMessageObject == null) {
    init()
    if (mainSlackMessageObject == null) {
      slackSend color: color, message: "${message} (no main message)"
      return
    }
  }

  slackSend color: color, message: message, channel: mainSlackMessageObject.threadId, botUser: true
}

def notifyStage(String stage, String buildResult) {

  def message="Stage \"${stage}\" finished with status ${buildResult} in <${env.BUILD_URL}|Build #${env.BUILD_NUMBER}> on branch ${env.JOB_NAME}"

  if (buildResult == "SUCCESS") {
    echo "${message}"
    send("good", message)
  }
  else if (buildResult == "FAILURE") {
    echo "ERROR: ${message}"
    send("danger", message)
  }
  else if (buildResult == "UNSTABLE") {
    echo "WARNING: ${message}"
    send("warning", message)
  }
  else {
    echo "ERROR: ${message}"
    send("danger", message)
  }
}

return this;