#!/bin/bash

for i in "$@"
do
case $i in
    -c|--code)
    CODE_BUCKET="$2"
    shift 2 # past argument=value
    ;;
    -s|--stack)
    STACK_NAME="$2"
    shift 2
    ;;
esac
done

if [ -z $STACK_NAME ]; then
    STACK_NAME=eks-practice
fi

if [ -z $CODE_BUCKET ]; then
    #CODE_BUCKET="$STACK_NAME-kb-code";
    CODE_BUCKET="rezgar-eks-practice-code"; # reusing between deployments, as only needed at deployment stage
fi

echo "Stack: $STACK_NAME"
echo "Code S3: $CODE_BUCKET"

aws2 s3api head-bucket --bucket $CODE_BUCKET || aws2 s3api create-bucket --bucket $CODE_BUCKET

aws2 cloudformation package --template-file ./cf-generated.yaml --s3-bucket $CODE_BUCKET --output-template-file ./cf-generated.yaml
aws2 cloudformation deploy --template ./cf-generated.yaml --stack-name $STACK_NAME --capabilities CAPABILITY_IAM CAPABILITY_NAMED_IAM
