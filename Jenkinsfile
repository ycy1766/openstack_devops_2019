node('', {
  stage('Openstack_auth', {
    sh ' . /etc/admin-openrc.sh'
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