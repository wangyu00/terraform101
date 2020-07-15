## 安装Terraform

``` shell script
# 1. 安装tfenv
brew install tfenv

# 2. 查看terraform最新稳定版本
brew list-remote

# 3. 安装terraform
tfenv install 0.12.28

# 4. 设置使用的terraform版本(默认自动切换)
tfenv use 0.12.28
```

## 配置AWS认证

配置认证的目的是能够调用AWS API来对AWS资源进行操作。

1. Static credentials

   硬编码到terraform代码中，安全性差，不推荐的用法
   
   ```hcl-terraform
    provider "aws" {
      region     = "ap-southeast-1"
      access_key = "my-access-key"
      secret_key = "my-secret-key"
    }
   ```

2. Environment variables

    执行Terraform前将AWS认证设置到环境变量中。由于过程繁琐，也不推荐使用。
    
   ```shell script
    $ export AWS_ACCESS_KEY_ID="accesskey"
    $ export AWS_SECRET_ACCESS_KEY="secretkey"
    $ export AWS_DEFAULT_REGION="ap-southeast-1"
    $ terraform plan
   ```

3. Shared credentials file

   直接指定AWS认证文件。
   
   或者直接配置全局AWS认证。https://docs.aws.amazon.com/sdk-for-java/v1/developer-guide/setup-credentials.html
   
   ```hcl-terraform
    provider "aws" {
      region                  = "ap-southeast-1"
      shared_credentials_file = "/Users/tf_user/.aws/creds" # optional，可使用全局AWS认证配置替代
      profile                 = "terraform" # optional，默认为"default"
    }
   ```
   
4. Assume Role

   通过AWS AssumeRole的方式，间接的获取到执行AWS API的权限。

    ```hcl-terraform
    provider "aws" {
      assume_role {
        role_arn     = "arn:aws:iam::ACCOUNT_ID:role/ROLE_NAME"
        session_name = "SESSION_NAME" # optional
        external_id  = "EXTERNAL_ID" # optional
      }
    }
    ```

## 编写Terraform
略

## 执行Terraform代码生成AWS资源
```shell script
terraform init # 仅第一次执行需要先初始化
terraform plan
terraform apply
```

