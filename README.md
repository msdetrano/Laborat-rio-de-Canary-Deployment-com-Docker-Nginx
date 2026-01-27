# 🐤 Laboratório de Canary Deployment com Docker & Nginx

Este projeto demonstra a implementação de uma estratégia de **Canary Deployment**. O objetivo é validar uma nova versão da aplicação enviando apenas uma pequena parcela do tráfego real para ela, reduzindo o risco de falhas em produção.

<img width="724" height="651" alt="image" src="https://github.com/user-attachments/assets/7af7ad9b-1066-4232-8198-c64ded2b46a7" />

## 🚀 Como Funciona
Utilizamos o **Nginx** como Load Balancer para distribuir as requisições entre duas versões de uma API Python (Flask):

* **V1 (Estável):** Recebe **80%** do tráfego.
* **V2 (Canary):** Recebe **20%** do tráfego para testes.

## 🛠️ Tecnologias Utilizadas
* **Python / Flask:** Aplicação base.
* **Docker & Docker Compose:** Containerização e orquestração local.
* **Nginx:** Proxy reverso e gerenciamento de tráfego.

## 📂 Estrutura do Projeto
* `app.py`: Código da aplicação que identifica a versão via variável de ambiente.
* `nginx.conf`: Configuração de `upstream` com `weight` para divisão de carga.
* `docker-compose.yml`: Definição dos serviços e rede.

## 🏁 Como Executar

1. **Clone o repositório:**
   ```bash
   git clone https://github.com/msdetrano/Laborat-rio-de-Canary-Deployment-com-Docker-Nginx.git
   cd canary-deploy-lab
2. **Como Rodar o Lab**
   ```bash
   docker-compose up -d --build
