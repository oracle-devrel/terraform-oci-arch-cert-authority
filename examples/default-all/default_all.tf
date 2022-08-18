## Copyright (c) 2021, Oracle and/or its affiliates.
## All rights reserved. The Universal Permissive License (UPL), Version 1.0 as shown at http://oss.oracle.com/licenses/upl


module "default_all" {
  source = "./../../../terraform-oci-arch-cert-authority"
  #source = "github.com/oracle-devrel/terraform-oci-arch-cert-authority"

  tenancy_ocid                                       = var.tenancy_ocid
  compartment_ocid                                   = var.compartment_ocid
  user_ocid                                          = var.user_ocid
  fingerprint                                        = var.fingerprint
  private_key_path                                   = var.private_key_path
  region                                             = var.region
  release                                            = "1.0"
  tag_namespace                                      = "ca-cert-authority-and-cert-example"
  create_new_certificate_authority                   = true
  create_new_certificate                             = true
  create_new_certificate_bundle                      = true
  create_new_kms_vault                               = true
  certificate_certificate_config_subject_common_name = "Module-example using defaulted values"
}
