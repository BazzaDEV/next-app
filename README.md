# How to Build

## Build dependencies iamge

```bash
podman build -t next-app-deps -f Dockerfile.deps .
```

## Export and import

```bash
podman save -o images.tar -m docker.io/node:18-alpine localhost/next-app-deps:latest

# Now move this tar file to the on-premise env (without internet access)

podman load --input images.tar
```

## Build Next.js image

```bash
podman build -t next-app --build-arg TEST="Hello world! This means everything went smoothly :)" .
```

## Run Next.js container

```bash
podman run \
    -dt \
    -p 8080:3000 \
    --rm \
    next-app
```