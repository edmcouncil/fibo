defaultTasks 'libs'

repositories {
    jcenter()
}

configurations {
    libs
}

dependencies {
    libs 'org.kohsuke:github-api:1.50'
}

task clean(type: Delete) {
    delete 'lib'
}

task libs(type: Copy) {
    into 'lib'
    from configurations.libs
}

task wrapper(type: Wrapper) {
    gradleVersion = '2.2.1'
}
