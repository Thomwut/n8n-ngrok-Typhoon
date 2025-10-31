# n8n Docker Setup

การตั้งค่า n8n สำหรับใช้งานกับ ngrok webhook

## การใช้งาน

1. **รันครั้งแรก**:
   ```bash
   docker-compose build 
   docker-compose up -d
   ```

2. **ตั้งค่า webhook URL**:
   - แก้ไข `NGROK_URL` ในไฟล์ `.env` 
   - เช่น: `NGROK_URL=https://abc123.ngrok-free.app`
   - รีสตาร์ท: `docker-compose restart n8n-ngrok-Typhoon`

3. **เปิดใช้งาน ngrok**
   - เปิด Terminal ใน Folder ที่ clone git ลงมา
   - run command "ngrok http --url=your-ngrok-url portXXXX" 

4. **เข้าใช้งาน**:
   - Local: http://localhost:5566
   - หรือใช้ ngrok URL ที่ตั้งค่าไว้

## คำสั่งที่ใช้บ่อย

```bash
# เริ่มใช้งาน
docker-compose build
docker-compose up -d

# รีสตาร์ทหลังเปลี่ยน webhook URL
docker-compose restart n8n-ngrok-Typhoon

# หยุดการทำงาน
docker-compose down

# ดู logs
docker-compose logs n8n-ngrok-Typhoon
```