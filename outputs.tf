## Copyright (c) 2022, Oracle and/or its affiliates.
## All rights reserved. The Universal Permissive License (UPL), Version 1.0 as shown at http://oss.oracle.com/licenses/upl

output "vault_id" {
  description = "OCID of the Vault created - if boolean set"
  value       = oci_kms_vault.test_vault
}

output "vault_key" {
  description = "OCID of the key used with the vault"
  value       = oci_kms_key.vault_key
}

output "cert_authority_id" {
  description = "The OCID of the certificate authority created"
  value       = oci_certificates_management_certificate_authority.test_certificate_authority[0].id
}

output "certificate_id" {
  description = "Test certificate using the certificate authority"
  value       = oci_certificates_management_certificate.test_certificate[0].id
}

output "certificate_bundle_id" {
  description = "OCID for a certificate bundle"
  value       = oci_certificates_management_ca_bundle.ca_bundle
}
