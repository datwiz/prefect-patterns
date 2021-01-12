#!/usr/bin/env python
#
# Packages a prefect flow into a container image
# skips image push to a registry or prefect server/cloud registration
# image name pattern: <REGISTRY_URL>/<flow_name>:<build_tag>


import os
from prefect.storage import Docker


#### CHANGE THESE TWO LINES FOR EACH FLOW TO BE PACKAGED ####
import hello_world_flow as flow_module
flow_name = 'hello_world'


# get arguments from environment variables
from_image_name = os.getenv('FROM_IMAGE_NAME', 'undefined')
from_image_tag = os.getenv('FROM_IMAGE_TAG', 'undefined')

registry_url = os.getenv('REGISTRY_URL', None)
build_tag = os.getenv('BUILD_TAG', '00000000-0000')

# flow image build steps
flow = flow_module.flow

build_kwargs = {
    'buildargs': {
        'FROM_IMAGE_NAME': from_image_name,
        'FROM_IMAGE_TAG': from_image_tag
    }
}

storage = Docker(
    registry_url=registry_url,
    dockerfile='./Dockerfile',
    image_name=flow_name,
    image_tag=build_tag,
    build_kwargs=build_kwargs
)

storage.add_flow(flow)

storage = storage.build(
    push=False
)
