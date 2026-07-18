# Sử dụng image Node.js 22 chính thức
FROM node:22-bookworm

# Tạo thư mục làm việc trong container
WORKDIR /app

# Sao chép file cấu hình để cài dependencies
COPY package*.json ./
COPY pnpm-lock.yaml ./

# Cài đặt pnpm
RUN npm install -g pnpm

# Cài đặt dependencies
RUN pnpm install --frozen-lockfile

# Sao chép toàn bộ mã nguồn
COPY . .

# Build ứng dụng
RUN pnpm run build

# Mở cổng ứng dụng
EXPOSE 18789

# Lệnh chạy ứng dụng
CMD ["node", "openclaw.mjs", "gateway"]
