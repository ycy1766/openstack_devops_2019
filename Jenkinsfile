
stage('Checkout', {
  node('', {
    checkout scm
  })
})

stage('test', {
  node('', {
    sh 'source  /etc/kolla/admin-openrc.sh '
  })
})


stage('Build_image', {
  node('', {
    sh '/usr/local/bin/packer  build -color=false packer/packer.json '
  })
})
