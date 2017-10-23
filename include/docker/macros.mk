
#
# argv1: parent container, including version tag
# argv2: suffix (can be empty)
# argv3: build arguments
#
define forklift
	time docker build $(3) $(NOCACHE) \
		--build-arg PARENT_CONTAINER=$(1) \
		-t $(CONTAINER)$(2):$(VERSION) \
			-f docker/$(@)/Dockerfile . && echo "OK"
endef

define spraypaint
	docker tag $(CONTAINER)$(1):$(VERSION) $(CONTAINER)$(1):latest
endef

define publish
	docker push $(CONTAINER)$(1):$(VERSION)
	docker push $(CONTAINER)$(1):latest
endef

