
<a name="readme-top"></a>

<div align="center">

<h3 align="center">gotemplate-docker</h3>

  <p align="center">
    gotemplate is a powerful templating language, and this tool allows you to use it easily on the command line
    <br />
    <br />
    <a href="https://github.com/rorylshanks/gotemplate-docker/issues">Report Bug</a>
    ·
    <a href="https://github.com/rorylshanks/gotemplate-docker/issues">Request Feature</a>
  </p>
</div>

<!-- ABOUT THE PROJECT -->
## About The Project

This repository hosts the Dockerized build setup for gotemplate, a versatile templating tool. Our aim is to provide an automated build process that supports multiple architectures, ensuring easy and efficient deployment of gotemplate across various systems. 

## Features

- **Multi-Architecture Support:** Our Docker images are built to support multiple architectures, including ARM64 and AMD64, making them suitable for a wide range of hardware platforms.

- **Automated Builds:** The build process is fully automated, leveraging the latest versions of gotemplate. This ensures that you always have access to the most recent features and bug fixes.

- **Dockerized for Convenience:** By containerizing gotemplate, we encapsulate its dependencies and environment, ensuring a consistent and isolated execution environment that is easy to set up and use.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- GETTING STARTED -->
## Getting Started

### Using `gotemplate` Directly in Docker

You can run the `gotemplate` templating engine directly in a Docker container. This method is straightforward and doesn't require you to install `gotemplate` on your host system. Here's how you can do it:

1. **Pull the Docker Image**: First, pull the latest `gotemplate` image from the Docker repository.
```bash
docker pull rorylshanks/gotemplate:latest
```

2. **Run the Container**: You can then run `gotemplate` in a Docker container. For instance, if you have a template file on your host system that you want to process with `gotemplate`, you can mount the file into the container and run the templating engine on it.
```bash
docker run --rm -v $(pwd):/data rorylshanks/gotemplate:latest gotemplate /data/your-template-file
```
   Replace `your-template-file` with the path to your template file.

### Using `gotemplate` in Docker Builds with `COPY --from`

Alternatively, you can use `gotemplate` in your Docker build process. This is particularly useful when you need to template configuration files or other resources as part of building a Docker image. Here's how to do it:

1. **Create a Dockerfile**: In your Dockerfile, use `COPY --from` to copy the `gotemplate` binary from the Docker image into your own image.
```Dockerfile
# Use a multi-stage build
# First stage: get the gotemplate binary
FROM rorylshanks/gotemplate:latest as gotemplate

# Second stage: build your own image
FROM your-base-image

# Copy the gotemplate binary from the first stage
COPY --from=gotemplate /gotemplate /usr/local/bin/gotemplate

# Rest of your Dockerfile...
```

By using `gotemplate` in these ways, you can benefit from the flexibility and power of templating directly in Docker environments, either interactively or as part of a Docker build process, without needing to manage the installation and dependencies of `gotemplate` on your own systems.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- CONTRIBUTING -->
## Contributing

We welcome contributions to this project! If you have suggestions or improvements, please feel free to submit a pull request or open an issue.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- LICENSE -->
## License

This project is open-sourced under [MIT License](LICENSE).

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## Acknowledgments
This project is based on gotemplate by Coveo. Visit their GitHub repository for more information about the tool: [coveooss/gotemplate](https://github.com/coveooss/gotemplate).

<p align="right">(<a href="#readme-top">back to top</a>)</p>