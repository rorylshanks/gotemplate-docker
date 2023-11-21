# Base image
FROM alpine AS downloader

# Set the known location for extraction
WORKDIR /

# Define the version as a build argument
ARG GOTEMPLATE_VERSION

# Install curl and unzip
RUN apk add --no-cache curl unzip

# Download and extract the correct file based on architecture and version
RUN set -x; if [ "$(uname -m)" = "aarch64" ]; then \
        curl -L https://github.com/coveooss/gotemplate/releases/download/v${GOTEMPLATE_VERSION}/gotemplate_${GOTEMPLATE_VERSION}_linux_arm64.zip -o gotemplate.zip; \
    elif [ "$(uname -m)" = "x86_64" ]; then \
        curl -L https://github.com/coveooss/gotemplate/releases/download/v${GOTEMPLATE_VERSION}/gotemplate_${GOTEMPLATE_VERSION}_linux_64-bits.zip -o gotemplate.zip; \
    fi && \
    unzip gotemplate.zip && \
    rm gotemplate.zip

FROM busybox

COPY --from=downloader /gotemplate /gotemplate

ENTRYPOINT [ "/gotemplate" ]