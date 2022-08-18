## Copyright (c) 2022 Oracle and/or its affiliates.
## All rights reserved. The Universal Permissive License (UPL), Version 1.0 as shown at http://oss.oracle.com/licenses/upl

resource "tls_private_key" "temp_key" {
  count     = var.create_new_certificate_bundle == "" ? 1 : 0
  algorithm = var.certificate_certificate_config_key_algorithm
  rsa_bits  = var.certificate_certificate_config_rsa_bits
}

resource "tls_self_signed_cert" "temp_cert" {
  count           = var.create_new_certificate_bundle == "" ? 1 : 0
  private_key_pem = tls_private_key.temp_key[0].private_key_pem

  validity_period_hours = 26280
  early_renewal_hours   = 8760
  is_ca_certificate     = true
  allowed_uses          = ["cert_signing", "encipher_only", "key_agreement", "server_auth"]

  subject {
    common_name  = var.certificate_certificate_config_subject_common_name
    organization = var.certificate_certificate_config_subject_organization
  }
}

resource "oci_certificates_management_ca_bundle" "ca_bundle" {
  count = length(tls_self_signed_cert.temp_cert)

  #  ca_bundle_pem  = oci_certificates_management_certificate.test_certificate.certificate_pem

  ca_bundle_pem  = tls_self_signed_cert.temp_cert[0]
  compartment_id = var.compartment_ocid
  name           = "${var.certificate_name}-bundle-${local.random_id}"
  defined_tags   = local.defined_tags
  description    = "bundle for ${var.certificate_description}"
}
