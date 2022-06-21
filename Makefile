# Parameter defnintions
ENV = dev
STACK = network compute storage
DELETE_STACK = $(ENV)-network $(ENV)-compute $(ENV)-storage
TEMPLATE_EXT = yaml


# DO NOT CHANGE ANYTHING BELOW
empty:
	@echo "Usage:\n make deploy\n make destroy\n "


deploy: $(STACK)


destroy: $(DELETE_STACK)


$(STACK):
	@aws cloudformation deploy --template-file $@.$(TEMPLATE_EXT) --stack-name $(ENV)-$@


$(DELETE_STACK):
	@aws cloudformation delete-stack --stack-name $@


.PHONY: clean


clean:
