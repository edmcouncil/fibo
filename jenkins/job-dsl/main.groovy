
import org.kohsuke.github.GitHub

println "Executing main.groovy in Jenkins build ${BUILD_NUMBER}"

def owner = 'edmcouncil'
def repo = 'fibo'

//
// Another test, see if the kohsuke github library works
//
def gh = GitHub.connectAnonymously()
gh.getOrganization(owner).listRepositories().each { repoStructure ->
  println "Found repo ${repoStructure.fullName}"
}

//
// Use the Github API to retrieve all forks of the FIBO repo
// See https://developer.github.com/v3/repos/forks/
//
def forksApi = new URL("https://api.github.com/repos/${owner}/${repo}/forks")
def forks = new groovy.json.JsonSlurper().parse(forksApi.newReader())

forks.each {
    def fork = it.name
    def jobName = "${repo}-${fork}".replaceAll('/','-')
    job(jobName) {
        scm {
            git("https://github.com/${fork}.git", "master")
        }        
    }
}
