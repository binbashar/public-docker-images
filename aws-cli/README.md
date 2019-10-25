# aws-cli

<div align="left">
  <img src="https://raw.githubusercontent.com/binbashar/public-docker-images/master/aws-cli/figures/awscli-logo.png" alt="leverage-circleci" width="230"/>
</div>

#### The AWS Command Line Interface (CLI) is a unified tool to manage your AWS services.

With just one tool to download and configure, you can control multiple AWS services from the command line and automate them through scripts.

The AWS CLI introduces a new set of simple file commands for efficient file transfers to and from Amazon S3.

**Official Doc Links:**

- **Overview:** https://aws.amazon.com/cli/
- **User guide** https://docs.aws.amazon.com/cli/latest/userguide/cli-chap-welcome.html
- **CLI reference** https://docs.aws.amazon.com/cli/latest/reference/

## Docker Usage

Build the docker image using provided Dockerfile or directly download it from the public `binbash/aws-cli` docker hub repo.

```bash
docker run -it --rm \
--name aws-cli \
-v ~/.aws:/root/.aws \
-e "AWS_DEFAULT_REGION=us-east-1" \
binbash/aws-cli:latest
ec2 describe-instances --profile your-iam-profile-name-here
```

**NOTE:** Check docker image tags which will correspond with the proper scoutsuite version you're currently running:
- DOCKER_TAG = `latest`
- DOCKER_TAG = `1.16.265`

### Test Execution

**NOTE:** We're using the `.aws/credentials` and `.aws/config` auth files via docker mounted volume.

1. Bash `awscli` check
```bash
╭─delivery at delivery-I7567 in ~/Binbash/repos/BB-Leverage/docker/public-docker-images/aws-cli on master✘✘✘ using ‹› 19-10-24 - 13:01:01
╰─○ make test-run-awscli-bash
docker run -it --rm --name aws-cli -v ~/.aws:/root/.aws -e "AWS_DEFAULT_REGION=us-east-1" --entrypoint=bash binbash/aws-cli:1.16.265
root@9c420acc94f2:/# aws --version
aws-cli/1.16.265 Python/3.8.0 Linux/4.15.0-65-generic botocore/1.13.1
```

2. Full awscli docker based test
```bash
╭─delivery at delivery-I7567 in ~/Binbash/repos/BB-Leverage/docker/public-docker-images/aws-cli on master✘✘✘ using ‹› 19-10-24 - 13:01:25
╰─○ make test-run-awscli
docker run -it --rm --name aws-cli -v ~/.aws:/root/.aws -e "AWS_DEFAULT_REGION=us-east-1" binbash/aws-cli:1.16.265 --version
aws-cli/1.16.265 Python/3.8.0 Linux/4.15.0-65-generic botocore/1.13.1
docker run -it --rm --name aws-cli -v ~/.aws:/root/.aws -e "AWS_DEFAULT_REGION=us-east-1" binbash/aws-cli:1.16.265 ec2 describe-instances --region us-east-1 --profile bb-dev-devops
{
    "Reservations": []
}
```
