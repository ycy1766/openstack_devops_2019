
stage('Checkout', {
  node('', {
    checkout scm
  })
})


stage('Build_image', {
  node('', {
    sh 'source  /etc/kolla/admin-openrc.sh  && /usr/local/bin/packer  build -color=false packer/packer.json '
  })
})
