
stage('Checkout', {
  node('', {
    checkout scm
  })
})

// node('', {
//   stage('Openstack_auth', {
//     sh ' . /etc/admin-openrc.sh'
//   })
// })

// stage('example3', {
//   node('', {
//     sh '$ env | grep OS_'
//   })
// })

stage('Build_image', {
  node('', {
    sh 'packer build -color=false -debug  packer/packer.json '
  })
})
