FROM n8nio/n8n:latest

USER root

# Install Python และ packages ที่จำเป็น
RUN apk add --no-cache \
    python3 py3-pip \
    poppler-utils

# สร้าง virtual environment และติดตั้ง typhoon-ocr
RUN python3 -m venv /opt/venv && \
    /opt/venv/bin/pip install --upgrade pip && \
    /opt/venv/bin/pip install typhoon-ocr

# เพิ่ม virtual environment ลงใน PATH
ENV PATH="/opt/venv/bin:$PATH"

# ตั้งค่า Base URL ของ n8n ให้ตรงกับ ngrok
ENV N8N_WEBHOOK_URL=${N8N_WEBHOOK_URL}

# สร้าง directories และกำหนด permission
RUN mkdir -p /data /doc && \
    chown -R node:node /data /doc

USER node

# ทำงานในโฟลเดอร์ /home/node
WORKDIR /home/node
