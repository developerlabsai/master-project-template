# Shared Resources Configuration

**Purpose:** Document centralized credentials and resources shared across multiple projects.

**Last Updated:** [DATE]

---

## Overview

This document tracks shared resources that are centralized in standard locations to avoid duplication across projects.

## SSH Keys & Access

### Centralized Location
```
~/.ssh/
```

### Active Keys

| Key Name | Purpose | Projects Using | Created | Expires |
|----------|---------|----------------|---------|---------|
| [key-name].pem | EC2 instance access | Project A, Project B | YYYY-MM-DD | N/A |
| [key-name]-2.pem | Different instance | Project C | YYYY-MM-DD | N/A |

### SSH Config

**Location:** `~/.ssh/config`

**Example Entry:**
```
Host [alias]
  HostName [IP or domain]
  User [username]
  IdentityFile ~/.ssh/[key-name].pem
  StrictHostKeyChecking accept-new
  ServerAliveInterval 60
  ServerAliveCountMax 3
```

**Current Hosts:**
- `[alias]` → [IP/domain] - [Description]

---

## AWS Credentials

### Centralized Location
```
~/.aws/
```

### Profiles

| Profile Name | Account | Purpose | Projects Using |
|--------------|---------|---------|----------------|
| default | [Account ID] | Personal/main | All |
| [profile-name] | [Account ID] | [Purpose] | Project X, Project Y |

### Credentials File

**Location:** `~/.aws/credentials`

```ini
[default]
aws_access_key_id = [KEY]
aws_secret_access_key = [SECRET]

[profile-name]
aws_access_key_id = [KEY]
aws_secret_access_key = [SECRET]
```

### Config File

**Location:** `~/.aws/config`

```ini
[default]
region = us-east-1
output = json

[profile profile-name]
region = us-east-1
output = json
```

---

## MCP Server Configuration Pattern

### Cross-Project .mcp.json Template

```json
{
  "mcpServers": {
    "filesystem": {
      "command": "npx",
      "args": ["-y", "@modelcontextprotocol/server-filesystem", "/path/to/project"],
      "env": {}
    },
    "aws": {
      "command": "uvx",
      "args": ["awslabs.aws-api-mcp-server@latest"],
      "env": {
        "AWS_REGION": "us-east-1",
        "AWS_PROFILE": "profile-name"
      }
    }
  }
}
```

### Pattern for Shared Credentials

**In project .mcp.json:**
- Reference shared AWS profile (not duplicate credentials)
- Use centralized SSH keys via filesystem paths
- Keep project-specific paths only

---

## Environment Variables

### Shared Environment Variables

**Location:** `~/.bashrc` or `~/.zshrc`

```bash
# Shared exports
export AWS_DEFAULT_REGION=us-east-1
export EDITOR=vim
export [COMMON_VAR]=[VALUE]
```

### Project-Specific Variables

Keep in project `.env` files (not shared).

---

## API Keys & Service Accounts

### Shared Services

| Service | Key Location | Purpose | Projects Using |
|---------|--------------|---------|----------------|
| [Service Name] | `~/.[service]/credentials` | [Purpose] | Project A, B |

### Project-Specific Keys

Document in each project's `config/SECRETS_REFERENCE.md`.

---

## SSL Certificates

### Let's Encrypt

**Location:** `/etc/letsencrypt/` (on servers)

**Domains:**
- `[domain]` - [Server/Purpose]
- `[subdomain.domain]` - [Server/Purpose]

### Custom Certificates

**Location:** `~/certs/` or `/etc/ssl/private/`

| Certificate | Domain | Server | Expires |
|-------------|--------|--------|---------|
| [name].crt | [domain] | [server] | YYYY-MM-DD |

---

## Database Connections

### Shared Database Instances

| Instance | Host | Port | Projects Using | Connection String Location |
|----------|------|------|----------------|---------------------------|
| [DB Name] | [host] | [port] | Project A, B | `~/.db/[name].conf` |

### Connection Pattern

```bash
# Store connection strings in:
~/.db/[database-name].conf
```

**Example:**
```
postgres://user:pass@host:port/dbname
```

---

## Docker Registries

### Shared Registries

| Registry | Purpose | Auth Location | Projects Using |
|----------|---------|---------------|----------------|
| Docker Hub | Public images | `~/.docker/config.json` | All |
| [Private Registry] | Private images | `~/.docker/config.json` | Project X |

---

## Version Control

### Git Config

**Location:** `~/.gitconfig`

```ini
[user]
    name = [Your Name]
    email = [your.email@domain.com]
[core]
    editor = vim
[credential]
    helper = osxkeychain  # or appropriate for your OS
```

### SSH Keys for Git

**Location:** `~/.ssh/`

```
id_ed25519 - GitHub/GitLab
id_rsa - Older repos
```

---

## Project Reference Pattern

When starting a new project, reference shared resources:

1. **Check this document** for existing credentials
2. **Update .mcp.json** to point to shared AWS/SSH configs
3. **Document new shared resources** if created
4. **Avoid duplication** - use existing keys/credentials

### Example Project Setup

```bash
# In new project directory
mkdir -p config

# Create .mcp.json referencing shared resources
cat > .mcp.json <<'EOF'
{
  "mcpServers": {
    "aws": {
      "command": "uvx",
      "args": ["awslabs.aws-api-mcp-server@latest"],
      "env": {
        "AWS_PROFILE": "existing-profile"  # From ~/.aws/
      }
    }
  }
}
EOF

# Create project-specific secrets reference
cp ~/Projects/00\ -\ MASTER\ PROJECT\ TEMPLATE/templates/SECRETS_REFERENCE.template.md config/SECRETS_REFERENCE.md
```

---

## Security Best Practices

### ✅ Do's

- ✅ Keep credentials in standard locations (`~/.ssh/`, `~/.aws/`)
- ✅ Use SSH config for host aliases
- ✅ Reference shared credentials via profiles
- ✅ Document what shares what
- ✅ Set proper file permissions (600 for keys)

### ❌ Don'ts

- ❌ Duplicate SSH keys across project folders
- ❌ Hardcode credentials in project files
- ❌ Commit shared credentials to git
- ❌ Share keys via insecure channels
- ❌ Use overly permissive key permissions

---

## Maintenance

### Regular Tasks

- **Monthly:** Review and rotate API keys
- **Quarterly:** Audit SSH key usage
- **Yearly:** Review AWS access keys
- **As needed:** Update this document when adding shared resources

### Adding New Shared Resources

1. Add resource to appropriate section above
2. Update "Projects Using" column
3. Document location and access pattern
4. Update `.mcp.json` example if relevant
5. Commit this document to template repo

---

## Quick Reference Commands

### Check SSH Keys
```bash
ls -la ~/.ssh/
```

### Check AWS Profiles
```bash
cat ~/.aws/credentials
aws configure list-profiles
```

### Test SSH Connection
```bash
ssh -T git@github.com  # GitHub
ssh [host-alias]       # Server
```

### Verify AWS Credentials
```bash
aws sts get-caller-identity --profile [profile-name]
```

---

**Last Review:** [DATE]
**Next Review Due:** [DATE + 3 months]
