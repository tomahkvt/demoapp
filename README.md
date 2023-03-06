# On-air with Uklon: DevOps Edition at 2023.02.08

[Youtube reference](https://www.youtube.com/watch?v=bd7ofOND6ZQ&ab_channel=Uklon%E2%80%93%D1%83%D0%BA%D1%80%D0%B0%D1%97%D0%BD%D1%81%D1%8C%D0%BA%D0%B8%D0%B9%D0%BE%D0%BD%D0%BB%D0%B0%D0%B9%D0%BD-%D1%81%D0%B5%D1%80%D0%B2%D1%96%D1%81%D0%B2%D0%B8%D0%BA%D0%BB%D0%B8%D0%BA%D1%83%D0%B0%D0%B2%D1%82%D0%BE)  

## Requiremetns

Ubuntu 20.04.4 LTS\
VM resources:\
CPU: 8\
Memory:16GB\
HDD:100GB

## Installation

Clone repository https://github.com/tomahkvt/demoapps

```bash
git clone https://github.com/tomahkvt/demoapp
cd demoapp
```

Install docker
```bash
./scripts/install_docker.sh
```
Finish terminal session and login again

Install minikube and ArgoCD
```bash
cd demoapp
./scripts/install_minikube.sh
```
The script returns ARGOCD_PASSWORD:\

Open Argocd https://argocd.demoonair.com\
login: admin\
password: $ARGOCD_PASSWORD

Install demo application
```bash
./scripts/install_demo_app.sh
```

Demo References:\
https://argocd.demoonair.com \
http://demoapp.demoonair.com/get_data \
http://kiali.demoonair.com \
http://grafana.demoonair.com \
http://jaeger.demoonair.com \
http://prometheus.demoonair.com
