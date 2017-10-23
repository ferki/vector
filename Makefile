
#
# NOCACHE = --no-cache
#

include include/defines.mk
include include/docker/macros.mk

#
# Builds the Docker containers for this project.
#

all: run

run: rebuild
	mkdir -pv tmp
	env | grep ^OS_ | sort -n | tee tmp/env.txt
	docker run -it --rm --detach=false \
		--env-file tmp/env.txt \
			$(CONTAINER):latest $(DEBUG)

developer: fullrebuild

fullrebuild:
	export NOCACHE=--no-cache; make rebuild

rebuild: build tag push

push: tag
	@$(call publish,base)
	@$(call publish,pip)
	@$(call publish,)

tag: build
	@$(call spraypaint,base)
	@$(call spraypaint,pip)
	@$(call spraypaint,)

build: base pip $(PROJECT)

base:
	@$(call forklift,alpine:latest,$(@),)

pip:
	@$(call forklift,$(CONTAINER)base:$(VERSION),$(@),)

$(PROJECT):
	@$(call forklift,$(CONTAINER)pip:$(VERSION),,--no-cache)

distclean:
	@docker ps -a -q | $(XARGS) docker rm -f
	@docker images -q | $(XARGS) docker rmi -f

