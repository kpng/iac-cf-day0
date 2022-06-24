# Parameter defnintions
ENV = dev
STACK = root
DELETE_STACK = $(ENV)-root
TEMPLATE_EXT = yaml
myTemplateS3Bucket = day0-kp


# DO NOT CHANGE ANYTHING BELOW
empty:
	@echo "Usage:\n make deploy\n make destroy\n "

upload:
	@aws s3 cp ./modules/. s3://${myTemplateS3Bucket} --recursive

deploy: upload $(STACK)

destroy: $(DELETE_STACK)

$(STACK):
	@aws cloudformation deploy --capabilities CAPABILITY_NAMED_IAM --template-file $@.$(TEMPLATE_EXT) --stack-name $(ENV)-$@

$(DELETE_STACK):
	@aws cloudformation delete-stack --stack-name $@

.PHONY: clean

clean:
