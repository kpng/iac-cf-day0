# Parameter defnintions
ENV = dev
STACK = day0
TEMPLATE_EXT = yaml
DELETE_STACK = $(ENV)-$(STACK)
myTemplateS3Bucket = $(STACK)-kp
myS3Bucket = ${myTemplateS3Bucket}-2022

# DO NOT CHANGE ANYTHING BELOW
empty:
	@echo "\nUsage:\n make deploy\n make destroy\n "

upload:
	@aws s3 cp ./modules/. s3://${myTemplateS3Bucket} --recursive

emptyS3:
	@aws s3 rm s3://${myS3Bucket} --recursive

deploy: upload $(STACK)

destroy: emptyS3 $(DELETE_STACK)

$(STACK):
	@aws cloudformation deploy --capabilities CAPABILITY_NAMED_IAM --template-file $@.$(TEMPLATE_EXT) --stack-name $(ENV)-$@

$(DELETE_STACK):
	@aws cloudformation delete-stack --stack-name $@

.PHONY: clean

clean:
