# Secrets Reference

**Project:** [PROJECT_NAME]
**Created:** [DATE]
**Last Updated:** [DATE]

⚠️ **IMPORTANT:** This file is gitignored and should NEVER be committed to version control.

---

## Overview

This document contains all sensitive credentials, API keys, and secrets for this project. Keep this file secure and update it whenever credentials change.

---

## Database Credentials

### PostgreSQL/MySQL/MongoDB

```
Host: [hostname or IP]
Port: [port]
Database: [database_name]
User: [username]
Password: [password]

Connection String:
[postgres://user:password@host:port/database]
```

**Generated:** [DATE]
**Rotation Schedule:** [Every X months]

---

## API Keys & Tokens

### Service 1: [Service Name]

```
API Key (Public/Anon):
[key_value]

API Secret/Service Role Key (Private):
[secret_value]
```

**Purpose:** [What this key is used for]
**Permissions:** [Read/Write/Admin/etc]
**Expires:** [DATE or Never]

### Service 2: [Service Name]

```
Client ID: [client_id]
Client Secret: [client_secret]
API Token: [token]
```

**Purpose:** [What this is for]
**Scope:** [Permissions/scope]

---

## JWT Secrets

### JWT Secret

```
JWT_SECRET=[base64_encoded_secret]
```

**Algorithm:** HS256/RS256
**Generated:** [DATE]
**Used for:** Authentication tokens

### Refresh Token Secret

```
REFRESH_SECRET=[base64_encoded_secret]
```

---

## Encryption Keys

### Application Encryption

```
ENCRYPTION_KEY=[hex_key]
Key Size: [256-bit/etc]
```

**Purpose:** [Encrypt user data/files/etc]
**Algorithm:** AES256/etc

### Vault/Storage Encryption

```
VAULT_ENC_KEY=[hex_key_64_chars]
```

**Format:** 64-character hex (32 bytes)
**Purpose:** [Storage encryption/secrets management]

---

## Dashboard/Admin Access

### Main Dashboard

```
URL: [https://dashboard.domain.com]
Username: [username]
Password: [password]
```

**Role:** Admin/Superuser
**MFA:** [Enabled/Disabled]

### Alternative Access

```
URL: [https://alternative.domain.com]
Username: [username]
Password: [password]
```

---

## OAuth/Social Login

### Google OAuth

```
Client ID: [client_id]
Client Secret: [client_secret]
Redirect URI: [https://yourapp.com/auth/google/callback]
```

### GitHub OAuth

```
Client ID: [client_id]
Client Secret: [client_secret]
Callback URL: [https://yourapp.com/auth/github/callback]
```

---

## Email/SMTP

### SMTP Server

```
Host: [smtp.server.com]
Port: [587/465]
Username: [email or username]
Password: [password]
From Address: [noreply@yourdomain.com]
From Name: [Your App Name]
```

**TLS:** Enabled/Disabled
**Provider:** [SendGrid/Mailgun/AWS SES/etc]

### API-Based Email (e.g., SendGrid)

```
API Key: [api_key]
```

---

## Cloud Provider Credentials

### AWS

```
Access Key ID: [AKIA...]
Secret Access Key: [secret]
Region: [us-east-1]
Account ID: [123456789012]
```

**IAM User:** [username]
**Permissions:** [List of permissions/policies]

### GCP/Azure/Other

```
Project ID: [project-id]
Service Account Key: [path to JSON key file]
```

---

## CDN/Storage

### S3 Buckets

```
Bucket Name: [bucket-name]
Region: [region]
Access Key: [See AWS credentials above]
Public URL: [https://bucket-name.s3.amazonaws.com]
```

### CloudFlare

```
API Token: [token]
Zone ID: [zone_id]
Account ID: [account_id]
```

---

## Payment/Billing

### Stripe

```
Publishable Key (Public): [pk_live_...]
Secret Key (Private): [sk_live_...]
Webhook Secret: [whsec_...]
```

### PayPal

```
Client ID: [client_id]
Client Secret: [client_secret]
```

---

## Monitoring & Analytics

### Service (e.g., Sentry)

```
DSN: [https://key@sentry.io/project]
Auth Token: [token]
```

### Analytics (e.g., Google Analytics)

```
Tracking ID: [UA-XXXXXXXXX-X or G-XXXXXXXXXX]
API Secret: [secret]
```

---

## CI/CD

### GitHub Actions Secrets

```
DOCKER_USERNAME: [username]
DOCKER_TOKEN: [token]
DEPLOY_KEY: [SSH key or token]
```

### Deployment Keys

```
SSH Key: [path to private key]
Known Hosts: [server fingerprint]
```

---

## SSL/TLS Certificates

### Let's Encrypt

**Location:** `/etc/letsencrypt/live/[domain]/`

```
Certificate: fullchain.pem
Private Key: privkey.pem
Expires: [DATE]
```

**Auto-Renewal:** Enabled via certbot

### Custom Certificates

```
Certificate File: [path.crt]
Key File: [path.key]
Issuer: [CA name]
Expires: [DATE]
```

---

## Third-Party Integrations

### Integration 1: [Service Name]

```
API Key: [key]
Webhook URL: [https://yourapp.com/webhooks/service]
Webhook Secret: [secret for verifying webhooks]
```

### Integration 2: [Service Name]

```
Token: [token]
Endpoint: [https://api.service.com]
```

---

## Development vs Production

### Development Secrets

```
[Same structure as above, but with dev values]
```

### Production Secrets

```
[Production values - keep especially secure]
```

---

## Secret Generation Commands

For reference when generating new secrets:

### Random Password (32 chars)
```bash
openssl rand -base64 32
```

### Hex Key (64 chars = 32 bytes)
```bash
openssl rand -hex 32
```

### UUID
```bash
uuidgen
```

### JWT Secret (256-bit)
```bash
openssl rand -base64 32
```

---

## Environment Variables (.env format)

Copy this to your `.env` file (also gitignored):

```bash
# Database
DATABASE_URL=[connection_string]
DB_HOST=[host]
DB_PORT=[port]
DB_NAME=[database]
DB_USER=[user]
DB_PASSWORD=[password]

# API Keys
API_KEY=[key]
API_SECRET=[secret]

# JWT
JWT_SECRET=[secret]

# Email
SMTP_HOST=[host]
SMTP_PORT=[port]
SMTP_USER=[user]
SMTP_PASS=[password]

# Cloud
AWS_ACCESS_KEY_ID=[key]
AWS_SECRET_ACCESS_KEY=[secret]
AWS_REGION=[region]

# Application
APP_SECRET=[secret]
ENCRYPTION_KEY=[key]
```

---

## Rotation Schedule

| Secret Type | Rotation Frequency | Last Rotated | Next Rotation |
|-------------|-------------------|--------------|---------------|
| Database Password | 90 days | [DATE] | [DATE] |
| API Keys | 180 days | [DATE] | [DATE] |
| JWT Secrets | Yearly | [DATE] | [DATE] |
| SSL Certificates | Auto (Let's Encrypt) | [DATE] | [DATE] |

---

## Access Control

**Who has access to these secrets:**
- [Name/Role] - Full access
- [Name/Role] - Limited access (specify which secrets)

**Emergency Access:**
- Secrets stored in: [LastPass/1Password/etc]
- Backup location: [Encrypted USB/etc]

---

## Security Notes

⚠️ **CRITICAL REMINDERS:**

1. **NEVER** commit this file to git (verify in .gitignore)
2. **NEVER** share secrets via email, Slack, or unencrypted channels
3. **ALWAYS** use environment variables in code (not hardcoded)
4. **ROTATE** secrets regularly per schedule above
5. **REVOKE** old secrets after rotation
6. **BACKUP** this file securely (encrypted)

---

## Backup Location

This file is backed up to:
- **Location 1:** [Encrypted backup location]
- **Location 2:** [Password manager vault]
- **Last Backup:** [DATE]

---

**Maintained by:** [Your Name/Team]
**Emergency Contact:** [Contact info for credential issues]

---

## Changelog

| Date | Change | Changed By |
|------|--------|------------|
| [DATE] | Initial creation | [Name] |
| [DATE] | Rotated database password | [Name] |
| [DATE] | Added new API integration | [Name] |
