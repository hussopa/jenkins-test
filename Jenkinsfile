pipeline {
    agent none
    stages {
        stage('SCM') {
            parallel {
                stage('Clone to Linux') {
                    agent {
                        label "linux"
                    }
                    steps {
                        checkout([
                        $class: 'GitSCM', 
                        branches: [[name: '*/master']],
                        doGenerateSubmoduleConfigurations: false,
                        extensions: [],
                        submoduleCfg: [], 
                        userRemoteConfigs: [[
                        url: 'https://github.com/hussopa/jenkins-test']]])

                    }
                }

                stage('Clone to Windows') {
                    agent {
                        label "windows"
                    }
                    steps {
                        checkout([
                        $class: 'GitSCM', 
                        branches: [[name: '*/master']],
                        doGenerateSubmoduleConfigurations: false,
                        extensions: [],
                        submoduleCfg: [], 
                        userRemoteConfigs: [[
                        url: 'https://github.com/hussopa/jenkins-test']]])

                    }
                }  
            }
        }

        stage('Run Tests') {
            parallel {
                stage('Test On Windows -> Chrome') {
                    agent {
                        label "windows && chrome"
                    }
                    steps {
                        sh "echo bat run-tests-chrome.bat" 
                        sh "python3 -m robot tests/chrome.robot"

                    }
                }
                
                stage('Test On Linux -> Chrome') {
                    agent {
                        label "linux && chrome"
                    }
                    steps {
                        sh "echo sh run-tests-chrome.sh"
                        sh "python3 -m robot tests/chrome.robot"
                    }
                }

                stage('Test On Windows -> Firefox') {
                    when {branch 'master'
                        //expression { return env.JOB_NAME.contains('master') }
                    }
                    agent {
                        label "windows && firefox"
                    }
                    steps {
                        sh "echo bat run-tests-firefox.bat" 
                        sh "python3 -m robot tests/firefox.robot"
                    }
                }

                stage('Test On Linux & Firefox') {
                    when {branch 'master'
                        //expression { return env.JOB_NAME.contains('master') }
                    }
                    agent {
                        label "linux && firefox"
                    }
                    steps {
                        sh "echo sh run-tests-firefox.sh"
                        sh "python3 -m robot tests/firefox.robot"
                    }
                }
            }
        }
    }
}
