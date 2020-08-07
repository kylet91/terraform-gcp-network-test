# Terraform - All GCP Regions
This Terraform script creates two GCE VMs in every region in GCP.

One VM will be named <region>-premium and another will be <region>-standard.

VMs are created in zone B in each region, as some regions don't have a zone A, and according to this page (https://cloud.google.com/compute/docs/regions-zones) all regions have a zone B (and C).
  

You _may_ get an error on "asia-northeast2" because this region doesn't support standard networking, so running ```terraform apply``` will only create 47 VMs.
