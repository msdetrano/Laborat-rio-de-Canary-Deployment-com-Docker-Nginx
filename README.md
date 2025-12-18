🐤 Laboratório de Canary Deployment com Docker & Nginx
Este projeto demonstra a implementação de uma estratégia de Canary Deployment. O objetivo é validar uma nova versão da aplicação enviando apenas uma pequena parcela do tráfego real para ela, reduzindo o risco de falhas em produção.

🚀 Como Funciona
Utilizamos o Nginx como Load Balancer para distribuir as requisições entre duas versões de uma API Python (Flask):

V1 (Estável): Recebe 80% do tráfego.

V2 (Canary): Recebe 20% do tráfego para testes.

🛠️ Tecnologias Utilizadas
Python / Flask: Aplicação base.

Docker & Docker Compose: Containerização e orquestração local.

Nginx: Proxy reverso e gerenciamento de tráfego.

📂 Estrutura do Projeto
app.py: Código da aplicação que identifica a versão via variável de ambiente.

nginx.conf: Configuração de upstream com weight para divisão de carga.

docker-compose.yml: Definição dos serviços e rede.

🏁 Como Executar
Clone o repositório:

Bash

git clone https://github.com/seu-usuario/canary-deploy-lab.git
cd canary-deploy-lab
Suba o ambiente:

Bash

docker-compose up -d --build
Teste a distribuição de tráfego: Execute o script abaixo no terminal para ver os contadores em funcionamento:

Bash

v1=0; v2=0; for i in {1..50}; do 
  resp=$(curl -s http://localhost:8080)
  if [[ "$resp" == *"V1-ESTAVEL"* ]]; then ((v1++)); else ((v2++)); fi
done; echo -e "\n📊 RESULTADO:\nEstável (V1): $v1\nCanary (V2): $v2"
🛡️ Solução de Problemas (Proxy Corporativo)
Se estiver atrás de um proxy/VPN e enfrentar erros de SSL no pip install, o projeto já está configurado no Dockerfile para confiar nos domínios oficiais:

Dockerfile

RUN pip install --trusted-host pypi.org --trusted-host files.pythonhosted.org flask
📈 Conclusão
Este lab prova que o Canary Deployment permite:

Testar em Produção: Validar a V2 com tráfego real.

Rollback Rápido: Se a V2 falhar, basta remover seu peso no Nginx.

Isolamento de Erro: Apenas 20% dos usuários seriam impactados em caso de bug.

Desenvolvido para fins de estudo sobre DevOps e SRE.
