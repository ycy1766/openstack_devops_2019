node('', {
  stage('example1', {
    sh ' terraform --version'
  })
})

stage('Checkout') {
    // Get some code from a Git repository
    checkout scm
}
stage('example2', {
  node('', {
    sh 'pwd'
  })
})