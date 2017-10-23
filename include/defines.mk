
VERSION := $(shell date +%s)

PROJECT = vector

ifeq "" "$(CI_REGISTRY_IMAGE)"
CONTAINER = $(USER)/$(PROJECT)
else
CONTAINER = $(CI_REGISTRY_IMAGE)
endif

XARGS = xargs -n1 --no-run-if-empty

