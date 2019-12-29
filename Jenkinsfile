
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
    sh '/usr/local/bin/packer  build -color=false packer/packer.json '
  })
})
