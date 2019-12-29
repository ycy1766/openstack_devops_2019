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
stage('Build_image', {
  node('', {
    sh 'packer build packer/packer.json '
  })
})

stage('example3', {
  node('', {
    sh 'pwd'
  })
})