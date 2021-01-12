#!/usr/bin/env python

import os
from prefect.storage import Docker

import hello_world_flow as flow_module
flow_name = 'hello_world'


# deploy context
prefect_agent_label = os.getenv('PREFECT_AGENT_LABEL', None)
prefect_project_name = os.getenv('PREFECT_PROJECT_NAME', '')

registry_url = os.getenv('REGISTRY_URL', None)
build_tag = os.getenv('BUILD_TAG', '00000000-0000')


flow = flow_module.flow

storage = Docker(
    registry_url=registry_url,
    image_name=flow_name,
    image_tag=build_tag
)
storage.add_flow(flow)

flow.storage = storage

flow.register(
    build=False,
    project_name=prefect_project_name,
    labels=[prefect_agent_label],
    add_default_labels=False
)
