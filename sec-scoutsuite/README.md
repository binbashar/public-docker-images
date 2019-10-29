# sec-scoutsuite

<div align="left">
  <img src="https://raw.githubusercontent.com/binbashar/public-docker-images/master/sec-scoutsuite/figures/scoutsuite-logo.png" alt="leverage-circleci" width="130"/>
</div>

#### Scout Suite is an open source multi-cloud security-auditing tool, which enables security posture assessment of cloud environments.

Using the APIs exposed by cloud providers, Scout Suite gathers configuration data for manual inspection and highlights risk areas. Rather than going through dozens of pages on the web consoles, Scout Suite presents a clear view of the attack surface automatically.

Scout Suite was designed by security consultants/auditors. It is meant to provide a point-in-time security-oriented view of the cloud account it was run in. Once the data has been gathered, all usage may be performed offline.

**Official Doc Links:**

- **Overview:** https://github.com/nccgroup/ScoutSuite/wiki
- **Installation** https://github.com/nccgroup/ScoutSuite/wiki/Setup
- **AWS Audit** https://github.com/nccgroup/ScoutSuite/wiki/Amazon-Web-Services

<div align="left">
  <img src="https://raw.githubusercontent.com/binbashar/public-docker-images/master/sec-scoutsuite/figures/scoutsuite-dashboard.jpg" alt="leverage-circleci" width="800"/>
</div>

## Docker Usage

Build the docker image using provided Dockerfile or directly download it from the public `binbash/sec-scoutsuite` docker hub repo.

```bash
docker run -it --rm \
--name sec-scoutsuite \
-v ~/.aws:/root/.aws \
-v ~/scoutsuite-report:/report/scoutsuite-report \
-e "AWS_DEFAULT_REGION=us-east-1" \
binbash/sec-scoutsuite:5.4.0 \
aws --force --regions us-east-1 --profile aws-iam-profile-name-here
```

**NOTE:** Check docker image tags which will correspond with the proper scoutsuite version you're currently running:
- DOCKER_TAG = `5.4.0`

### Test Execution

**NOTE1:** For the `Makefile` automated examples we're mounting a local host volume inside our scoutsuite container in order to get
the HTML resulting report, in our case `-v ~/scoutsuite-report:/report/scoutsuite-report`

**NOTE2:** We're using the `.aws/credentials` and `.aws/config` auth files via docker mounted volume. If needed remember that scoutsuite
support passing as parameters or env vars -> AWS_ACCESS_KEY_ID, AWS_SECRET_ACCESS_KEY and AWS_SESSION_TOKEN (https://github.com/nccgroup/ScoutSuite/wiki/Amazon-Web-Services)

1. Bash `scout` check
```bash
╭─delivery at delivery-I7567 in ~/Binbash/repos/BB-Leverage/docker/public-docker-images/sec-scoutsuite on master✘✘✘ using ‹› 19-10-24 - 12:18:41
╰─○ make test-run-scoutsuite-bash
docker run -it --rm --name sec-scoutsuite -v ~/.aws:/root/.aws -e "AWS_DEFAULT_REGION=us-east-1" --entrypoint=bash binbash/sec-scoutsuite:5.4.0
bash-5.0# scout -v
Scout Suite 5.4.0
```

2. Full scoutsuite docker based test
```bash
╭─delivery at delivery-I7567 in ~/Binbash/repos/BB-Leverage/docker/public-docker-images/sec-scoutsuite on master✘✘✘ using ‹› 19-10-24 - 12:20:53
╰─○ make test-run-scoutsuite
docker run -it --rm --name sec-scoutsuite -v ~/.aws:/root/.aws -v ~/scoutsuite-report:/report/scoutsuite-report -e "AWS_DEFAULT_REGION=us-east-1" binbash/sec-scoutsuite:5.4.0 -v
Scout Suite 5.4.0
docker run -it --rm --name sec-scoutsuite -v ~/.aws:/root/.aws -v ~/scoutsuite-report:/report/scoutsuite-report -e "AWS_DEFAULT_REGION=us-east-1" binbash/sec-scoutsuite:5.4.0 aws --force --regions us-east-1 --profile flex-lmb
2019-10-24 15:21:01 8bfe1c92cd7a scout[1] INFO Launching Scout
2019-10-24 15:21:01 8bfe1c92cd7a scout[1] INFO Authenticating to cloud provider
2019-10-24 15:21:04 8bfe1c92cd7a scout[1] INFO Gathering data from APIs
2019-10-24 15:21:04 8bfe1c92cd7a scout[1] INFO Fetching resources for the Lambda service
2019-10-24 15:21:04 8bfe1c92cd7a scout[1] INFO Fetching resources for the CloudFormation service
2019-10-24 15:21:05 8bfe1c92cd7a scout[1] INFO Fetching resources for the CloudTrail service
2019-10-24 15:21:06 8bfe1c92cd7a scout[1] INFO Fetching resources for the CloudWatch service
2019-10-24 15:21:07 8bfe1c92cd7a scout[1] INFO Fetching resources for the Config service
2019-10-24 15:21:08 8bfe1c92cd7a scout[1] INFO Fetching resources for the Direct Connect service
2019-10-24 15:21:09 8bfe1c92cd7a scout[1] INFO Fetching resources for the EC2 service
x2019-10-24 15:21:10 8bfe1c92cd7a scout[1] INFO Fetching resources for the EFS service
2019-10-24 15:21:10 8bfe1c92cd7a scout[1] INFO Fetching resources for the ElastiCache service
2019-10-24 15:21:11 8bfe1c92cd7a scout[1] INFO Fetching resources for the ELB service
2019-10-24 15:21:12 8bfe1c92cd7a scout[1] INFO Fetching resources for the ELBv2 service
2019-10-24 15:21:13 8bfe1c92cd7a scout[1] INFO Fetching resources for the EMR service
2019-10-24 15:21:13 8bfe1c92cd7a scout[1] INFO Fetching resources for the IAM service
2019-10-24 15:21:13 8bfe1c92cd7a scout[1] INFO Fetching resources for the RDS service
2019-10-24 15:21:14 8bfe1c92cd7a scout[1] INFO Fetching resources for the RedShift service
2019-10-24 15:21:15 8bfe1c92cd7a scout[1] INFO Fetching resources for the Route53 service
2019-10-24 15:21:16 8bfe1c92cd7a scout[1] INFO Fetching resources for the S3 service
2019-10-24 15:21:17 8bfe1c92cd7a scout[1] INFO Fetching resources for the SES service
2019-10-24 15:21:17 8bfe1c92cd7a scout[1] INFO Fetching resources for the SNS service
2019-10-24 15:21:18 8bfe1c92cd7a scout[1] INFO Fetching resources for the SQS service
2019-10-24 15:21:19 8bfe1c92cd7a scout[1] INFO Fetching resources for the VPC service
2019-10-24 15:22:05 8bfe1c92cd7a scout[1] INFO Running rule engine
2019-10-24 15:22:16 8bfe1c92cd7a scout[1] INFO Applying display filters
2019-10-24 15:22:28 8bfe1c92cd7a scout[1] INFO Saving data to scoutsuite-report/scoutsuite-results/scoutsuite_results_aws-flex-lmb.js
2019-10-24 15:22:28 8bfe1c92cd7a scout[1] INFO Saving data to scoutsuite-report/scoutsuite-results/scoutsuite_exceptions_aws-flex-lmb.js
2019-10-24 15:22:28 8bfe1c92cd7a scout[1] INFO Creating scoutsuite-report/aws-flex-lmb.html
2019-10-24 15:22:28 8bfe1c92cd7a scout[1] INFO Opening the HTML report
sudo chown -R delivery:delivery ~/scoutsuite-report
```
