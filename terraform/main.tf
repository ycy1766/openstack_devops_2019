# Configure the OpenStack Provider
provider "openstack" {
  user_name   = "admin"
  tenant_name = "admin"
  password    = "adminpassword"
  auth_url    = "http://10.10.10.100:35357/v3"
  region      = "RegionOne"
}

variable "packer_image_name" {
  description = "packer_image_name"
}

resource "openstack_blockstorage_volume_v2" "test_vol" {
  region      = "RegionOne"
  name        = "cirros_vol"
  description = "test-cy"
  image_id    = "${var.packer_image_name}"
  size        = 3
}

resource "openstack_compute_instance_v2" "test-server" {
  name      = "my_instance-2"
  flavor_id = "1"
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
    uuid = "b0dd18e6-b0e0-4e62-9805-d7da190aa24d"
    name = "private"
  }
}