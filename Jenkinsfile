node('', {
  stage('Openstack_auth', {
    sh './openstack.rc'
  })
})

stage('Checkout', {
  node('', {
    checkout scm
  })
})

// stage('example3', {
//   node('', {
//     sh '$ env | grep OS_'
//   })
// })

stage('Build_image', {
  node('', {
    sh 'packer build -color=false packer/packer.json '
  })
})
