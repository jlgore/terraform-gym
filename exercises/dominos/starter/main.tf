# Terraform Pizza Challenge 🍕
#
# Your task: Query the Dominos API to find menu items at a nearby store
#
# Documentation: https://registry.terraform.io/providers/MNThomson/dominos/latest/docs
#
# IMPORTANT: We are ONLY using data sources. No pizza will be ordered!

# TODO: Configure the required provider (MNThomson/dominos)
terraform {
  required_providers {
    # Your code here
  }
}

# TODO: Configure the Dominos provider
# You need: first_name, last_name, email_address, phone_number
# (These can be placeholder values for data sources)
provider "dominos" {
  # Your code here
}

# TODO: Create a dominos_address data source
# Fields needed: street, city, region (not state!), postal_code
# Use variables for the address fields


# TODO: Create a dominos_store data source
# This needs the address's url_object as input
# Check what attribute the address outputs!


# TODO: Create a dominos_menu_item data source
# This needs the store_id and a query_string (list of search terms)
