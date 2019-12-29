
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


stage('Deploy_instance', {
  node('', {
    sh 'source  /etc/kolla/admin-openrc.sh  && export IMG_ID=`openstack image show packer-2 -c id -f value ` && cd  ./terraform && /usr/local/bin/terraform  init && /usr/local/bin/terraform apply -var packer_image_name=$IMG_ID -auto-approve  -lock=false '
    // sh 'source  /etc/kolla/admin-openrc.sh  && export IMG_ID=`openstack image show packer-2 -c id -f value` && cd  terraform && && terraform apply -var packer_image_name=$IMG_ID '
  })
})