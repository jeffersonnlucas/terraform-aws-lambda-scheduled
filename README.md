# Terraform AWS Lambda Scheduled

Terraform Module to create resource [AWS Lambda](https://www.terraform.io/docs/providers/aws/r/lambda_function.html) using AWS Eventbridge scheduling. IAM Role configuration using [PoLP VPC](https://www.cyberark.com/what-is/least-privilege/).

In addition, this module supports:

- Configuration Secrets from [AWS Systems Manager Parameter Store](https://docs.aws.amazon.com/systems-manager/latest/userguide/systems-manager-paramstore.html) including decryption of [SecureString](https://docs.aws.amazon.com/kms/latest/developerguide/services-parameter-store.html) parameters

## Terraform version compatibility

| module | terraform |     branch      |
| :----: | :-------: | :-------------: |
| 1.0.0  |  >= 0.15  |       main      |

## How do I use this module?

The module can be used for all [runtimes](https://docs.aws.amazon.com/lambda/latest/dg/lambda-runtimes.html) supported by AWS Lambda.

### Examples

[Example using python](https://github.com/jeffersonnlucas/terraform-aws-lambda-scheduled/tree/main/examples/lambda-scheduled)

```console
foo@bar:~$ cd examples/lambda-scheduled/infra
foo@bar:~$ terraform init
foo@bar:~$ terraform plan
foo@bar:~$ terraform apply
```

