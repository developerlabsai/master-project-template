# Deployment Configuration Guide

**Project:** [PROJECT_NAME]
**Stack:** Next.js 14 + Tailwind CSS + shadcn/ui
**Last Updated:** [DATE]

---

## Purpose

This guide covers deploying Next.js applications to production environments including Vercel, AWS Amplify, AWS S3+CloudFront, and other platforms.

---

## Deployment Options Overview

| Platform | Pros | Cons | Cost | Best For |
|----------|------|------|------|----------|
| **Vercel** | Zero config, automatic HTTPS, instant deploys, preview URLs | Vendor lock-in, pricing tiers | Free tier → $20/mo+ | Quick deploys, edge functions |
| **AWS Amplify** | AWS integration, CI/CD, custom domains | More complex setup | $0.01/build min + hosting | AWS ecosystem projects |
| **AWS S3 + CloudFront** | Low cost, high performance, full control | Manual setup, no server functions | ~$1-5/mo | Static sites, full control |
| **Railway** | Simple setup, database included | Limited free tier | Free → $5/mo+ | Full-stack apps |
| **Netlify** | Easy setup, good DX | Edge function limitations | Free tier → $19/mo+ | Jamstack sites |

---

## Option 1: Vercel (Recommended)

### Why Vercel?

- Built by Next.js creators
- Zero configuration
- Automatic HTTPS/SSL
- Global edge network
- Preview deployments
- Built-in analytics
- Excellent DX

### Setup

#### 1. Install Vercel CLI

```bash
pnpm add -g vercel
```

#### 2. Login to Vercel

```bash
vercel login
```

#### 3. Deploy

```bash
# Deploy to preview
vercel

# Deploy to production
vercel --prod
```

#### 4. Configure Project

Create `vercel.json`:

```json
{
  "buildCommand": "pnpm build",
  "devCommand": "pnpm dev",
  "installCommand": "pnpm install",
  "framework": "nextjs",
  "regions": ["iad1"],
  "env": {
    "NEXT_PUBLIC_APP_URL": "https://yourdomain.com"
  }
}
```

### Environment Variables

Add in Vercel Dashboard:
1. Go to Project Settings → Environment Variables
2. Add variables for Production, Preview, Development

```bash
NEXT_PUBLIC_APP_URL=https://yourdomain.com
NEXT_PUBLIC_SUPABASE_URL=your-url
NEXT_PUBLIC_SUPABASE_ANON_KEY=your-key
DATABASE_URL=your-db-url
```

### Custom Domain

1. Go to Project Settings → Domains
2. Add your domain: `yourdomain.com`
3. Configure DNS:
   - Type: `A`, Name: `@`, Value: `76.76.21.21`
   - Type: `CNAME`, Name: `www`, Value: `cname.vercel-dns.com`

### Automatic Deployments

**Via GitHub:**
1. Connect GitHub repository in Vercel dashboard
2. Configure branch: `main` for production, others for preview
3. Push to GitHub → automatic deploy

**Via Git Hook:**
```bash
# .git/hooks/post-commit
#!/bin/bash
vercel --prod --yes
```

### Cost

- **Free Tier:**
  - 100GB bandwidth/month
  - Unlimited deployments
  - Custom domains
  - HTTPS

- **Pro ($20/mo):**
  - 1TB bandwidth
  - Advanced analytics
  - Password protection
  - Team collaboration

---

## Option 2: AWS Amplify

### Why AWS Amplify?

- Deep AWS integration
- Full CI/CD pipeline
- Automatic SSL
- Environment branches
- Cost-effective at scale

### Setup

#### 1. Install AWS Amplify CLI

```bash
npm install -g @aws-amplify/cli
amplify configure
```

#### 2. Initialize Amplify

```bash
amplify init
```

Configuration:
```
? Enter a name for the project: [project-name]
? Enter a name for the environment: production
? Choose your default editor: Visual Studio Code
? Choose the type of app: javascript
? What javascript framework: react
? Source Directory Path: src
? Distribution Directory Path: .next
? Build Command: npm run build
? Start Command: npm run start
```

#### 3. Add Hosting

```bash
amplify add hosting
```

Choose:
```
? Select the plugin module to execute: Hosting with Amplify Console
? Choose a type: Manual deployment
```

#### 4. Deploy

```bash
amplify publish
```

### Continuous Deployment

**Via GitHub:**

1. Go to AWS Amplify Console
2. Connect repository (GitHub, GitLab, Bitbucket)
3. Select branch: `main`
4. Configure build settings:

```yaml
version: 1
frontend:
  phases:
    preBuild:
      commands:
        - npm ci
    build:
      commands:
        - npm run build
  artifacts:
    baseDirectory: .next
    files:
      - '**/*'
  cache:
    paths:
      - node_modules/**/*
```

### Environment Variables

Add in Amplify Console → Environment Variables:

```
NEXT_PUBLIC_APP_URL=https://yourdomain.com
NEXT_PUBLIC_SUPABASE_URL=your-url
NEXT_PUBLIC_SUPABASE_ANON_KEY=your-key
```

### Custom Domain

1. Go to App Settings → Domain Management
2. Add domain
3. Amplify auto-configures DNS (if using Route 53)
4. Manual DNS configuration:
   - Get CNAME from Amplify
   - Add CNAME record to your DNS provider

### Cost

- **Build:** $0.01 per build minute
- **Hosting:** $0.15 per GB served
- **Storage:** $0.023 per GB/month
- **Estimate:** ~$5-20/month for small apps

---

## Option 3: AWS S3 + CloudFront (Static Export)

### Why S3 + CloudFront?

- Lowest cost
- Maximum control
- Global CDN
- Perfect for static sites
- High performance

### Prerequisites

**Note:** This approach works best with static export. For server features (API routes, ISR), use Amplify or Vercel.

#### 1. Configure Static Export

Update `next.config.js`:

```javascript
/** @type {import('next').NextConfig} */
const nextConfig = {
  output: 'export',
  images: {
    unoptimized: true, // Required for static export
  },
  trailingSlash: true,
}

module.exports = nextConfig
```

#### 2. Build Static Site

```bash
pnpm build
```

This creates `out/` directory.

### AWS Setup

#### 1. Create S3 Bucket

```bash
aws s3 mb s3://your-app-name --region us-east-1
```

#### 2. Configure S3 for Static Hosting

```bash
aws s3 website s3://your-app-name \
  --index-document index.html \
  --error-document 404.html
```

#### 3. Set Bucket Policy

Create `bucket-policy.json`:

```json
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "PublicReadGetObject",
      "Effect": "Allow",
      "Principal": "*",
      "Action": "s3:GetObject",
      "Resource": "arn:aws:s3:::your-app-name/*"
    }
  ]
}
```

Apply:
```bash
aws s3api put-bucket-policy \
  --bucket your-app-name \
  --policy file://bucket-policy.json
```

#### 4. Upload Files

```bash
aws s3 sync out/ s3://your-app-name --delete
```

#### 5. Create CloudFront Distribution

```bash
aws cloudfront create-distribution \
  --origin-domain-name your-app-name.s3-website-us-east-1.amazonaws.com \
  --default-root-object index.html
```

Or via AWS Console:
1. Go to CloudFront → Create Distribution
2. Origin Domain: `your-app-name.s3-website-us-east-1.amazonaws.com`
3. Viewer Protocol Policy: Redirect HTTP to HTTPS
4. Default Root Object: `index.html`
5. Custom Error Responses:
   - 403 → /404.html (404 status)
   - 404 → /404.html (404 status)

#### 6. Configure SSL Certificate

**Option A: Use CloudFront Default Certificate**
- Free
- Domain: `d123456789.cloudfront.net`

**Option B: Custom Domain with ACM**
1. Request certificate in ACM (us-east-1 region)
2. Validate domain ownership
3. Attach to CloudFront distribution
4. Add custom domain in CloudFront settings

#### 7. Configure DNS

Add CNAME record:
```
Type: CNAME
Name: www
Value: d123456789.cloudfront.net
```

For apex domain (example.com), use:
```
Type: A (Alias)
Name: @
Value: CloudFront distribution
```

### Deployment Script

Create `scripts/deploy-aws.sh`:

```bash
#!/bin/bash

# Build static site
pnpm build

# Sync to S3
aws s3 sync out/ s3://your-app-name \
  --delete \
  --cache-control max-age=31536000,public \
  --exclude "*.html"

# Upload HTML with shorter cache
aws s3 sync out/ s3://your-app-name \
  --delete \
  --cache-control max-age=0,no-cache,no-store,must-revalidate \
  --exclude "*" \
  --include "*.html"

# Invalidate CloudFront cache
aws cloudfront create-invalidation \
  --distribution-id E1234567890ABC \
  --paths "/*"

echo "Deployment complete!"
```

Make executable:
```bash
chmod +x scripts/deploy-aws.sh
```

Deploy:
```bash
./scripts/deploy-aws.sh
```

### Cost Estimate

- **S3 Storage:** $0.023/GB/month (~$0.50/month)
- **S3 Requests:** $0.0004 per 1,000 GET (~$0.10/month)
- **CloudFront:** $0.085/GB for first 10TB (~$1-5/month)
- **Total:** ~$2-10/month for typical app

---

## Option 4: Railway

### Why Railway?

- Simple deployment
- Databases included
- Automatic HTTPS
- Fair pricing
- Good for full-stack apps

### Setup

#### 1. Install Railway CLI

```bash
npm install -g @railway/cli
```

#### 2. Login

```bash
railway login
```

#### 3. Initialize Project

```bash
railway init
```

#### 4. Deploy

```bash
railway up
```

#### 5. Configure Domain

```bash
railway domain
```

### Environment Variables

```bash
railway variables set NEXT_PUBLIC_APP_URL=https://yourdomain.com
railway variables set DATABASE_URL=postgresql://...
```

### Cost

- **Free:** 500 hours/month, $5 credit
- **Developer ($5/mo):** More resources, priority support
- **Pay-as-you-go:** Based on usage

---

## Option 5: Self-Hosted (Docker + EC2)

### Why Self-Hosted?

- Full control
- Custom infrastructure
- Cost-effective at scale
- Use existing servers

### Docker Setup

#### 1. Create Dockerfile

```dockerfile
FROM node:18-alpine AS base

# Install dependencies only when needed
FROM base AS deps
RUN apk add --no-cache libc6-compat
WORKDIR /app

COPY package.json pnpm-lock.yaml ./
RUN corepack enable pnpm && pnpm install --frozen-lockfile

# Rebuild the source code only when needed
FROM base AS builder
WORKDIR /app
COPY --from=deps /app/node_modules ./node_modules
COPY . .

ENV NEXT_TELEMETRY_DISABLED 1

RUN corepack enable pnpm && pnpm build

# Production image, copy all the files and run next
FROM base AS runner
WORKDIR /app

ENV NODE_ENV production
ENV NEXT_TELEMETRY_DISABLED 1

RUN addgroup --system --gid 1001 nodejs
RUN adduser --system --uid 1001 nextjs

COPY --from=builder /app/public ./public

# Set the correct permission for prerender cache
RUN mkdir .next
RUN chown nextjs:nodejs .next

# Automatically leverage output traces to reduce image size
COPY --from=builder --chown=nextjs:nodejs /app/.next/standalone ./
COPY --from=builder --chown=nextjs:nodejs /app/.next/static ./.next/static

USER nextjs

EXPOSE 3000

ENV PORT 3000
ENV HOSTNAME "0.0.0.0"

CMD ["node", "server.js"]
```

#### 2. Update next.config.js

```javascript
/** @type {import('next').NextConfig} */
const nextConfig = {
  output: 'standalone',
}

module.exports = nextConfig
```

#### 3. Create docker-compose.yml

```yaml
version: '3.8'

services:
  nextjs:
    build:
      context: .
      dockerfile: Dockerfile
    ports:
      - "3000:3000"
    environment:
      - NEXT_PUBLIC_APP_URL=https://yourdomain.com
      - DATABASE_URL=postgresql://user:pass@db:5432/dbname
    restart: unless-stopped
    networks:
      - app-network

  nginx:
    image: nginx:alpine
    ports:
      - "80:80"
      - "443:443"
    volumes:
      - ./nginx.conf:/etc/nginx/nginx.conf
      - ./certs:/etc/nginx/certs
    depends_on:
      - nextjs
    restart: unless-stopped
    networks:
      - app-network

networks:
  app-network:
    driver: bridge
```

#### 4. Create nginx.conf

```nginx
events {
    worker_connections 1024;
}

http {
    upstream nextjs {
        server nextjs:3000;
    }

    server {
        listen 80;
        server_name yourdomain.com;

        location / {
            proxy_pass http://nextjs;
            proxy_http_version 1.1;
            proxy_set_header Upgrade $http_upgrade;
            proxy_set_header Connection 'upgrade';
            proxy_set_header Host $host;
            proxy_cache_bypass $http_upgrade;
        }
    }
}
```

#### 5. Deploy to EC2

```bash
# SSH into EC2
ssh -i your-key.pem ubuntu@your-ec2-ip

# Clone repository
git clone https://github.com/yourusername/your-repo.git
cd your-repo

# Build and run
docker-compose up -d

# View logs
docker-compose logs -f nextjs
```

---

## Pre-Deployment Checklist

### Code Preparation

- [ ] Environment variables configured
- [ ] API endpoints tested
- [ ] Error boundaries implemented
- [ ] Loading states added
- [ ] SEO metadata configured
- [ ] Images optimized
- [ ] Build successful locally
- [ ] No console errors/warnings

### Performance

- [ ] Lighthouse score > 90
- [ ] Core Web Vitals passing
- [ ] Images using next/image
- [ ] Fonts optimized
- [ ] Bundle size optimized
- [ ] API calls optimized
- [ ] Caching configured

### Security

- [ ] Environment variables not in code
- [ ] API routes protected
- [ ] CORS configured
- [ ] Rate limiting added
- [ ] Input validation
- [ ] XSS protection
- [ ] SQL injection prevention
- [ ] HTTPS enforced

### SEO

- [ ] Meta tags added
- [ ] Open Graph tags
- [ ] Twitter cards
- [ ] robots.txt configured
- [ ] sitemap.xml generated
- [ ] Canonical URLs set
- [ ] Structured data added

---

## Environment-Specific Configuration

### Development

```env
NEXT_PUBLIC_APP_URL=http://localhost:3000
NEXT_PUBLIC_API_URL=http://localhost:3000/api
NEXT_PUBLIC_ENV=development
```

### Staging

```env
NEXT_PUBLIC_APP_URL=https://staging.yourdomain.com
NEXT_PUBLIC_API_URL=https://staging.yourdomain.com/api
NEXT_PUBLIC_ENV=staging
```

### Production

```env
NEXT_PUBLIC_APP_URL=https://yourdomain.com
NEXT_PUBLIC_API_URL=https://yourdomain.com/api
NEXT_PUBLIC_ENV=production
```

---

## CI/CD Pipeline

### GitHub Actions

Create `.github/workflows/deploy.yml`:

```yaml
name: Deploy to Production

on:
  push:
    branches:
      - main

jobs:
  deploy:
    runs-on: ubuntu-latest

    steps:
      - uses: actions/checkout@v3

      - name: Setup Node.js
        uses: actions/setup-node@v3
        with:
          node-version: '18'

      - name: Install pnpm
        run: npm install -g pnpm

      - name: Install dependencies
        run: pnpm install --frozen-lockfile

      - name: Run tests
        run: pnpm test

      - name: Build
        run: pnpm build
        env:
          NEXT_PUBLIC_APP_URL: ${{ secrets.NEXT_PUBLIC_APP_URL }}

      - name: Deploy to Vercel
        run: vercel --prod --token ${{ secrets.VERCEL_TOKEN }}
```

---

## Monitoring & Analytics

### Vercel Analytics

```typescript
// app/layout.tsx
import { Analytics } from '@vercel/analytics/react'

export default function RootLayout({ children }) {
  return (
    <html>
      <body>
        {children}
        <Analytics />
      </body>
    </html>
  )
}
```

### Google Analytics

```typescript
// lib/gtag.ts
export const GA_TRACKING_ID = process.env.NEXT_PUBLIC_GA_ID

export const pageview = (url: string) => {
  window.gtag('config', GA_TRACKING_ID, {
    page_path: url,
  })
}
```

---

## Rollback Procedures

### Vercel
```bash
# List deployments
vercel list

# Rollback to specific deployment
vercel rollback [deployment-url]
```

### AWS Amplify
1. Go to Amplify Console
2. Select deployment from history
3. Click "Redeploy this version"

### AWS S3 + CloudFront
```bash
# Restore previous version
aws s3 sync s3://your-app-name-backup/ s3://your-app-name/
aws cloudfront create-invalidation --distribution-id E123 --paths "/*"
```

---

## Cost Comparison

| Platform | Small App | Medium App | Large App |
|----------|-----------|------------|-----------|
| Vercel | Free | $20/mo | $100+/mo |
| AWS Amplify | $5-10/mo | $20-50/mo | $100+/mo |
| S3 + CloudFront | $2-5/mo | $10-20/mo | $50+/mo |
| Railway | Free-$5/mo | $10-20/mo | $50+/mo |
| Self-hosted | $5/mo (EC2) | $20/mo | $100+/mo |

---

## Recommended Deployment Strategy

**For Startups/MVPs:**
- **Vercel** - Fastest time to market, zero config

**For AWS Ecosystem:**
- **AWS Amplify** - Best AWS integration

**For Static Sites:**
- **S3 + CloudFront** - Lowest cost, great performance

**For Full Control:**
- **Self-hosted Docker** - Maximum flexibility

**For Full-Stack Apps:**
- **Railway** or **Vercel** - Easiest database integration

---

## Resources

- [Next.js Deployment Docs](https://nextjs.org/docs/deployment)
- [Vercel Documentation](https://vercel.com/docs)
- [AWS Amplify Docs](https://docs.amplify.aws)
- [AWS S3 Static Hosting](https://docs.aws.amazon.com/AmazonS3/latest/userguide/WebsiteHosting.html)
- [Railway Documentation](https://docs.railway.app)

---

**Last Updated:** 2025-11-16
**Next Review:** 2026-02-16
