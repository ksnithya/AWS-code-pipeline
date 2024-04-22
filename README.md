# AWS-code-pipeline
Aws codepipeline code
While creating EC2 instance role. Need to add below policies to it.
1. AmazonEC2RoleforAWSCodeDeploy
2. AmazonSSMManagedInstanceCore
3. AmazonEC2ContainerRegistryFullAccess

While creating CodeDeploy role. Add below policy
1. Choose use case as "CodeDepoly"
2. Policy "AWSCodeDeployRole" by default it will be added.

Need to add below environment variable in codebuild stage.
$AWS_REGION = ************
$ECR_ID = *****************
$REPO_IMAGE = *********
$TAG = ***********
