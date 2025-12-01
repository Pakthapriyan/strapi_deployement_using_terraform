# Strapi CMS Terraform Deployment

Minimal Terraform project that deploys Strapi (headless CMS) on a single Ubuntu EC2 instance using Docker.

## Overview

This repository provisions a VPC, public subnet, security group, and one Ubuntu 22.04 LTS EC2 instance. On first boot, the instance installs Docker and starts Strapi in a container with a persistent Docker volume.

## Architecture

- VPC with public subnet and internet gateway
- Security Group allowing SSH (22) and Strapi (1337)
- EC2 t3.micro (Ubuntu 22.04 LTS)
- Strapi via Docker + Docker Compose
- SQLite (default) with Docker volume persistence

## Clarification

Deployed on Ubuntu EC2 using Docker. In the youtube video, I say deployed using Docker Compose. Docker Compose was only used as a simple wrapper to run the container, and the instance may be stopped for security reasons, when reviewed. Thank you