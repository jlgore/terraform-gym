# Terraform Docker Challenge
# 
# Your task: Deploy nginx and redis containers on a shared network
#
# Documentation: https://registry.terraform.io/providers/kreuzwerker/docker/latest/docs

# TODO: Configure the required provider (kreuzwerker/docker)
terraform {
  required_providers {
    # Your code here
  }
}

# TODO: Configure the Docker provider
provider "docker" {
  # Your code here
}

# TODO: Create a Docker network named "challenge-net"


# TODO: Pull the nginx:alpine image


# TODO: Pull the redis:alpine image


# TODO: Create the nginx container
# - Use the variable for the name
# - Attach to the network
# - Expose the port using the variable


# TODO: Create the redis container
# - Use the variable for the name
# - Attach to the network
