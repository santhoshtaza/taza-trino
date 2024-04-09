# AWS Integration for Dockerized Trino

This project sets up a Trino server in Docker, configured to use AWS services like S3 and Glue with temporary credentials obtained via AWS STS, including handling MFA.

## Prerequisites

- Docker and Docker Compose installed
- AWS CLI installed
- `jq` installed for JSON parsing

## Setup

### 1. Install `jq`

Ensure `jq` is installed on your system. For installation instructions on various platforms, refer to the official [`jq` documentation](https://stedolan.github.io/jq/download/).

On Ubuntu/Debian-based Linux Distributions:

`sudo apt update`
`sudo apt install jq`

On macOS:

`brew install jq`

On Windows:

`choco install jq`

### 2. Configure AWS CLI

Ensure your AWS CLI is configured with access credentials that have permissions to execute `sts get-session-token` and access the necessary AWS services.

aws configure

### 3. Docker Compose and start trino

Fetch AWS Session Token

The fetch_aws_session_token.sh script is used to fetch temporary AWS credentials, including handling MFA. Before running Docker Compose, execute this script:

`./fetch_aws_session_token.sh`

### Running Docker Compose

With the .env file created, start your Dockerized Trino service with Docker Compose:

`docker-compose up -d`

### Accessing Trino

Access the Trino CLI within the Docker container:

`docker exec -it trino trino`

### Shutting Down

To stop and remove the Trino container and network created by Docker Compose:

`docker-compose down`
