node {
    currentBuild.result = "SUCCESS"

    try {

       stage('Checkout') {
            checkout scm
       }

       stage('Test') {
            env.NODE_ENV = "test"
            print "Environment will be : ${env.NODE_ENV}"
            sh 'bash testpub.sh'
       }

       stage('Deploy') {
            echo 'ssh to web server and tell it to pull new keys'
            sh 'ssh coopadmin@192.168.133.88 /usr/local/bin/keyPusher.sh'
       }
       stage('Cleanup') {
            echo 'prune and cleanup'
            sh 'echo clean'
       }
      }
    catch (err) {
        currentBuild.result = "FAILURE"
        throw err
    }
}
