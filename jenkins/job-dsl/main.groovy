
repositories {
    jcenter()
    mavenCentral()
}

dependencies {
    compile 'org.ajoberstar:grgit:<version>'
}

def owner = 'edmcouncil'
def repo = 'fibo'
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
