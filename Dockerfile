FROM python:3.12-slim

# Install dependencies (ffmpeg + curl)
RUN apt-get update && \
    apt-get install -y ffmpeg curl && \
    rm -rf /var/lib/apt/lists/*

# App setup
WORKDIR /app
COPY . .

RUN pip install --no-cache-dir -r requirements.txt

# Install Deno
RUN curl -fsSL https://deno.land/install.sh | sh
ENV PATH="/root/.deno/bin:${PATH}"

CMD ["bash", "start"]
