FROM node:18.15.0-alpine

WORKDIR /app

COPY package*.json ./

RUN npm ci

COPY . .

RUN apk add --no-cache curl

ENV PORT=8000

EXPOSE 8000

RUN addgroup -S appgroup && adduser -S appuser -G appgroup
RUN chown -R appuser:appgroup /app

USER appuser

HEALTHCHECK --interval=30s --timeout=5s --start-period=10s --retries=3 \
  CMD curl -f http://localhost:8000/api/users || exit 1

CMD ["npm", "run", "start"]