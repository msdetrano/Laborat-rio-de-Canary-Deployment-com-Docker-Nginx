FROM python:3.9-slim
# Adicionamos os parâmetros --trusted-host para ignorar o erro de SSL do Proxy/VPN
RUN pip install --trusted-host pypi.org --trusted-host files.pythonhosted.org flask
WORKDIR /app
COPY app.py .
CMD ["python", "app.py"]