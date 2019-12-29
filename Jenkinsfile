
stage('Checkout', {
  node('', {
    checkout scm
  })
})

stage('test', {
  node('', {
    sh 'ls packer'
  })
})


stage('Build_image', {
  node('', {
    sh 'packer build -color=false -debug  packer/packer.json '
  })
})
