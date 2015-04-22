def owner = 'edmcouncil'
def repoName = 'fibo'
def repo = "${owner}/${repoName}"
def forksApi = new URL("https://api.github.com/repos/${repo}/forks")
def forks = new groovy.json.JsonSlurper().parse(forksApi.newReader())

forks.each {
    def forkName = it.name
    def jobName = "${repoName}-${forkName}".replaceAll('/','-')
    job(jobName) {
        scm {
            git("https://github.com/${forkName}.git", "master")
        }        
    }
}
