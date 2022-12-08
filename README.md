# fritzbox-exporter
This exporter is based on work from [dotWee](https://github.com/dotWee/docker-fritzbox-prometheus-exporter) and [sberk42](https://github.com/sberk42/fritzbox_exporter).

I just added a little entrypoint script to fix the LUA URL Variable.

## build
Needed to build with platform set to amd64, because i built it on my arm64 Mac and using the Container on my Docker Host (amd64).
```bash
docker buildx build --platform=linux/amd64 --no-cache -t ghcr.io/bym0/fritzbox-exporter .
```

## push
```bash
docker push ghcr.io/bym0/fritzbox-exporter:latest
```