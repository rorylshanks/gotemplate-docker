# Base image
FROM golang AS builder

# Set directory to known value
WORKDIR /app
# Define the version as a build argument
ARG GOTEMPLATE_VERSION

# Git clone the repo for gotemplate, checkout the desired tag, and build the executable
RUN git clone https://github.com/coveooss/gotemplate.git . && \
    git checkout v${GOTEMPLATE_VERSION} && \
    CGO_ENABLED=0 go build

FROM busybox

COPY --from=builder /app/gotemplate /gotemplate

ENTRYPOINT [ "/gotemplate" ]