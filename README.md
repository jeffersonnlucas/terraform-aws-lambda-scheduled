# Terraform AWS Lambda Scheduled

Terraform to create resource [AWS Lambda](https://www.terraform.io/docs/providers/aws/r/lambda_function.html) using Cloud Watch Events scheduling. IAM Role configuration using [PoLP VPC](https://www.cyberark.com/what-is/least-privilege/).

Following the Documentation [Cloud Watch Events](https://docs.aws.amazon.com/pt_br/lambda/latest/dg/services-cloudwatchevents.html).

In addition, this module supports:

- Configuration Secrets from [AWS Systems Manager Parameter Store](https://docs.aws.amazon.com/systems-manager/latest/userguide/systems-manager-paramstore.html) including decryption of [SecureString](https://docs.aws.amazon.com/kms/latest/developerguide/services-parameter-store.html) parameters

## Terraform version compatibility

| module | terraform |     branch      |
| :----: | :-------: | :-------------: |
| -  |  -   | - |
| -  |  -   | - |

## How do I use this module?

The module can be used for all [runtimes](https://docs.aws.amazon.com/lambda/latest/dg/lambda-runtimes.html) supported by AWS Lambda (defaults to `go1.x`).

### Examples
