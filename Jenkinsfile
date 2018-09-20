pipeline {
    agent none
    stages {
        stage('Run Tests') {
            parallel {
                stage('FMT') {
                    agent { label "terraform" }
                    steps {
                        sh 'terraform fmt --check --diff'
                    }
                }
                stage('Validate') {
                    agent { label "terraform" }
                    steps {
                        sh 'terraform init'
                        sh 'terraform validate -check-variables=false'
                    }
                }
                stage('Validate variable.tf descriptions') {
                    agent { label "tfdescsan" }
                    steps {
                        sh 'tfdescsan --test --tsv $(cat /usr/src/tfdescsan/dcos-terraform.mapping.url) --var variables.tf'
                    }
                }
                stage('Validate outputs.tf descriptions') {
                    agent { label "tfdescsan" }
                    steps {
                        sh 'tfdescsan --test --tsv $(cat /usr/src/tfdescsan/dcos-terraform.mapping.url) --var outputs.tf'
                    }
                }
            }
        }
    }
}
