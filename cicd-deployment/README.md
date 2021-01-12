# prefect CI/CD pipeline pattern
A pattern for managing prefect packaging and deployment using CI/CD pipelines.

## Objective
Seperate out the building of prefect flow artifacts from deployment activities.  This includes
pulling the flow management functions out of the flow definition python source files.
* packaging flows into immutable artifacts in an initial build step
* pushing flow images to a target image repository (non-prod)
* deploying flow images to prefect server/cloud in a non-production project environment
* promoting flow images to a released status
* deploying the released image to prefect server/cloud in a prodution project environment.

## Approach
In the build and deploy scripts, import the flow objects as python modules.  This does 
currently couple the deployment script to the actual name of the flow python file and flow
name.

## Files
* `Dockerfile` the Dockerfile used as the base for packaging in a given prefect flow
* `build_flow.sh` the script to build/package the flow into a container image
* `deploy_flow.sh` the script to deploy the flow into a target project environment
* `hello_world_flow.py` the example flow

## env var arguments
The following environment variables provide the packaging and deployment context
for use in CI/CD pipelines.

| Variable | Workflow | Description |
| --- | --- | --- |
| FROM_IMAGE_NAME | build | the base image name used for packaging the flow |
| FROM_IMAGE_TAG  | build | the base image tags used for packaging the flow |
| REGISTRY_URL    | build, deploy | the registry for storing flow images |
| BUILD_TAG       | build, deploy | the image tag to reference a specific version of the flow image |
| PREFECT_AGEBNT_LABEL | deploy | the agent label to apply during flow registration |
| PREFECT_PROJECT_NAME | deploy | the prefect project for registering the flow |
