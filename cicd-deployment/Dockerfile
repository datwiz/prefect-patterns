ARG FROM_IMAGE_NAME
ARG FROM_IMAGE_TAG
FROM ${FROM_IMAGE_NAME}:${FROM_IMAGE_TAG}

# some useful image metadata
ARG FROM_IMAGE_NAME
ARG FROM_IMAGE_TAG
ARG GIT_PROJECT_URL=undefined
ARG GIT_COMMIT_HASH=undefined
ARG CI_PIPELINE_URL=undefined
LABEL maintainer=nobody@example.com \
      com.example.base-image=${FROM_IMAGE_NAME}:${FROM_IMAGE_TAG} \
      com.example.git-url=${GIT_PROJECT_URL} \
      com.example.git-commit-hash=${GIT_COMMIT_HASH} \
      com.example.ci-pipeline-url=${CI_PIPELINE_URL}
