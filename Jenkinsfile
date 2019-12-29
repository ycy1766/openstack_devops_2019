node('', {
  stage('example1', {
    sh ' terraform --version'
  })
})

stage('Checkout', {
  node('', {
    checkout scm
  })
})
stage('example2', {
  node('', {
    sh 'ls'
  })
})

stage('example3', {
  node('', {
    sh 'pwd'
  })
})