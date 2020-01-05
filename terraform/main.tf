# Configure the OpenStack Provider
provider "openstack" {
  user_name   = "admin"
  tenant_name = "admin"
  password    = "adminpassword"
  auth_url    = "http://10.10.10.100:35357/v3"
  region      = "RegionOne"
}

data "terraform_remote_state" "local_etcd" {
  backend = "etcdv3"
  config = {
    endpoints = ["10.10.10.11:2379"]
    lock      = true
    prefix    = "terraform-state/"
  }
}


variable "packer_image_name" {
  description = "packer_image_name"
}

resource "openstack_blockstorage_volume_v2" "test_vol" {
  region      = "RegionOne"
  name        = "test-vol"
  description = "test-cy"
  image_id    = "${var.packer_image_name}"
  size        = 9
}

resource "openstack_compute_instance_v2" "test-server" {
  name      = "my_instance-2"
  flavor_id = "2"
  key_pair  = "mykey"
  block_device {
    uuid                  = "${openstack_blockstorage_volume_v2.test_vol.id}"
    source_type           = "volume"
    volume_size           = 5
    boot_index            = 0
    destination_type      = "volume"
    delete_on_termination = true
  }
  network {
    uuid = "8c9b5765-db7a-4621-9391-3343ee7a286a"
    name = "private-net"
  }
}


resource "openstack_networking_floatingip_v2" "fip_1" {
  pool = "public1"
}


resource "openstack_compute_floatingip_associate_v2" "fip_1" {
  floating_ip = "${openstack_networking_floatingip_v2.fip_1.address}"
  instance_id = "${openstack_compute_instance_v2.test-server.id}"
}

