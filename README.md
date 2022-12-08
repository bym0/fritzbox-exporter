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

## usage
```bash
docker run
  -d
  -e TZ="Europe/Berlin"
  -e 'USERNAME'='<FRITZ_USER>'
  -e 'PASSWORD'='<FRITZ_PASS>'
  -e 'GATEWAY_URL'='http://<FRITZ_IP>:49000'
  -e 'LISTEN_ADDRESS'='0.0.0.0:9042'
  -e 'GATEWAY_LORA_URL'='http://<FRITZ_IP>'
  -p '9042:9042/tcp' 
  'ghcr.io/bym0/fritzbox-exporter:latest'
```