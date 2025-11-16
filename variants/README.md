# Project Framework Variants

**Last Updated:** 2025-11-16

---

## Overview

The Project Initialization Framework provides **variants** for different types of projects. Each variant contains specialized templates, scripts, and documentation tailored to specific technology stacks and use cases.

---

## Available Variants

### 1. Backend/Infrastructure (Default)

**Location:** Main `templates/` folder

**Use for:**
- Backend services and APIs
- Infrastructure deployment
- DevOps projects
- Database installations
- Self-hosted services (Supabase, n8n, etc.)
- Docker Compose projects
- Cloud infrastructure

**Key Templates:**
- SECRETS_REFERENCE.template.md
- SHARED_RESOURCES.md
- PHASE_COMPLETION_REPORT.template.md
- COST_ANALYSIS.template.md
- DECISION_LOG.template.md

**Key Scripts:**
- infrastructure-snapshot.sh

**Documentation:**
- [templates/README.md](../templates/README.md)

---

### 2. Frontend - Next.js

**Location:** `variants/frontend-nextjs/`

**Use for:**
- Next.js web applications
- React frontends
- Full-stack Next.js apps
- Landing pages
- Dashboard UIs
- E-commerce sites
- SaaS products

**Stack:**
- Next.js 14 (App Router)
- TypeScript
- Tailwind CSS
- shadcn/ui
- Zustand (state management)
- TanStack Query (data fetching)
- React Hook Form + Zod (forms)

**Key Templates:**
- FRONTEND_SETUP.md - Complete setup guide
- COMPONENT_ARCHITECTURE.md - Component patterns and structure
- DEPLOYMENT_CONFIG.md - Vercel, AWS, and other deployment options
- TECH_STACK_DECISION.md - Standardized stack documentation
- PACKAGE_INVENTORY.md - Dependency tracking

**Key Scripts:**
- component-generator.sh - Generate React components with boilerplate
- frontend-snapshot.sh - Capture frontend project state

**Documentation:**
- Full setup guide with standardized stack
- Component architecture patterns
- Deployment strategies (Vercel + AWS)
- Package management best practices

---

## How to Choose a Variant

### Backend/Infrastructure Projects

**Choose backend templates if:**
- ✅ Deploying to servers (EC2, VPS, bare metal)
- ✅ Installing self-hosted services
- ✅ Setting up Docker Compose stacks
- ✅ Configuring databases
- ✅ Managing infrastructure
- ✅ DevOps and CI/CD
- ✅ Setting up reverse proxies, SSL, etc.

**Examples:**
- Installing Supabase on EC2
- Setting up n8n automation server
- Deploying PostgreSQL cluster
- Configuring Nginx reverse proxy
- AWS infrastructure projects

---

### Frontend - Next.js Projects

**Choose frontend-nextjs variant if:**
- ✅ Building React web applications
- ✅ Creating Next.js sites
- ✅ Developing SaaS products
- ✅ Building dashboards or admin panels
- ✅ E-commerce frontends
- ✅ Marketing websites with React
- ✅ Full-stack Next.js apps

**Examples:**
- SaaS dashboard
- E-commerce store
- Company website
- Blog with Next.js
- Admin panel
- Customer portal

---

## Quick Start Guides

### Starting a Backend Project

```bash
# 1. Create project folder
mkdir my-backend-project && cd my-backend-project

# 2. Initialize git
git init

# 3. Create standard folders
mkdir -p {config,docs,scripts,templates,backups}

# 4. Copy backend templates
cp ~/Projects/00\ -\ MASTER\ PROJECT\ TEMPLATE/templates/SECRETS_REFERENCE.template.md config/SECRETS_REFERENCE.md
cp ~/Projects/00\ -\ MASTER\ PROJECT\ TEMPLATE/templates/DECISION_LOG.template.md DECISION_LOG.md

# 5. Copy infrastructure snapshot script
cp ~/Projects/00\ -\ MASTER\ PROJECT\ TEMPLATE/scripts/infrastructure-snapshot.sh scripts/

# 6. Update .gitignore
echo "config/SECRETS_REFERENCE.md" >> .gitignore

# 7. Start documenting
# Edit PROJECT_OVERVIEW.md, ROADMAP.md, etc.
```

---

### Starting a Frontend Project

```bash
# 1. Create Next.js project with standardized setup
pnpm create next-app@latest my-app \
  --typescript \
  --tailwind \
  --app \
  --src-dir

cd my-app

# 2. Initialize shadcn/ui
pnpm dlx shadcn-ui@latest init

# 3. Install standard dependencies
pnpm add zustand @tanstack/react-query react-hook-form zod @hookform/resolvers
pnpm add lucide-react date-fns clsx tailwind-merge class-variance-authority
pnpm add next-themes

# 4. Install dev dependencies
pnpm add -D @tanstack/react-query-devtools prettier prettier-plugin-tailwindcss

# 5. Copy frontend templates to docs/
mkdir -p docs
cp ~/Projects/00\ -\ MASTER\ PROJECT\ TEMPLATE/variants/frontend-nextjs/*.md docs/

# 6. Copy frontend scripts
mkdir -p scripts
cp ~/Projects/00\ -\ MASTER\ PROJECT\ TEMPLATE/variants/frontend-nextjs/scripts/*.sh scripts/
chmod +x scripts/*.sh

# 7. Take initial snapshot
./scripts/frontend-snapshot.sh docs/

# 8. Start development
pnpm dev
```

---

## Template Usage Patterns

### Backend: Multi-Phase Infrastructure Project

```bash
# Phase 1: Discovery
./scripts/infrastructure-snapshot.sh docs/

# Phase 2: Planning
cp templates/COST_ANALYSIS.template.md docs/COST_ANALYSIS.md
# Fill in cost analysis

# Phase 3: Implementation
cp templates/PHASE_COMPLETION_REPORT.template.md docs/PHASE1_COMPLETION.md
# Document as you go

# Phase 4: Documentation
cp templates/DECISION_LOG.template.md DECISION_LOG.md
# Record all major decisions
```

---

### Frontend: Component-Heavy Application

```bash
# Generate new feature component
./scripts/component-generator.sh feature user-profile --client

# Generate form with validation
./scripts/component-generator.sh form login-form

# Generate custom hook
./scripts/component-generator.sh hook use-auth

# Take snapshot before major changes
./scripts/frontend-snapshot.sh docs/
```

---

## Shared Resources

Both variants can use shared resources documented in:

**SHARED_RESOURCES.md** (keep in central location)
- SSH keys for server access
- AWS credentials and profiles
- MCP server configurations
- Environment variables
- Shared secrets

**Location:** `~/Projects/SHARED_RESOURCES.md`

```bash
# Create shared resources document (once)
cp templates/SHARED_RESOURCES.md ~/Projects/SHARED_RESOURCES.md
```

---

## Mixing Variants

### Full-Stack Projects

For projects with both backend and frontend:

**Recommended Approach:**

```
my-fullstack-project/
├── backend/                    # Backend templates
│   ├── config/
│   │   └── SECRETS_REFERENCE.md
│   ├── docker-compose.yml
│   └── ...
├── frontend/                   # Frontend variant
│   ├── src/
│   ├── docs/
│   │   ├── FRONTEND_SETUP.md
│   │   └── COMPONENT_ARCHITECTURE.md
│   └── scripts/
│       ├── component-generator.sh
│       └── frontend-snapshot.sh
├── DECISION_LOG.md            # Project-wide decisions
└── README.md                  # Project overview
```

**Example:**
- Backend: Supabase self-hosted (use backend templates)
- Frontend: Next.js dashboard (use frontend-nextjs variant)

---

## Creating Custom Variants

### When to Create a New Variant

Create a new variant when:
- You have multiple projects with the same stack
- The stack is significantly different from existing variants
- You want to standardize on a specific technology

### How to Create a Variant

```bash
# 1. Create variant directory
mkdir -p variants/my-variant

# 2. Add variant-specific templates
touch variants/my-variant/SETUP.md
touch variants/my-variant/ARCHITECTURE.md
touch variants/my-variant/DEPLOYMENT.md

# 3. Add variant-specific scripts
mkdir variants/my-variant/scripts
touch variants/my-variant/scripts/my-script.sh
chmod +x variants/my-variant/scripts/*.sh

# 4. Document the variant
touch variants/my-variant/README.md

# 5. Update this file
# Add your variant to the "Available Variants" section
```

**Variant Ideas:**
- Mobile (React Native)
- Backend (Express.js / NestJS)
- Python (FastAPI / Django)
- WordPress theme development
- Chrome Extension
- Electron App

---

## Variant Maintenance

### Keeping Variants Updated

**Quarterly Review:**
- Update package versions
- Review best practices
- Add new learnings from projects
- Remove deprecated patterns

**After Each Project:**
- Note what worked well
- Identify missing templates
- Update scripts based on usage
- Improve documentation

---

## Decision Log

Track variant-level decisions in each variant's documentation:

**Example:**
- Why Next.js 14 over 13?
- Why Zustand over Redux?
- Why Tailwind over styled-components?
- Why Vercel as primary deployment?

See `frontend-nextjs/TECH_STACK_DECISION.md` for example.

---

## Migration Between Variants

### Backend → Frontend

**Reusable:**
- ✅ DECISION_LOG.md structure
- ✅ Git workflow
- ✅ Documentation patterns

**Not Applicable:**
- ❌ Infrastructure scripts
- ❌ Docker configurations
- ❌ Server-specific templates

### Frontend → Backend

**Reusable:**
- ✅ DECISION_LOG.md
- ✅ Project organization
- ✅ Documentation approach

**Not Applicable:**
- ❌ Component patterns
- ❌ Frontend scripts
- ❌ Package management specific to npm

---

## Contributing to Variants

### Adding Improvements

1. Use the variant in a real project
2. Note what's missing or could be better
3. Update the variant templates/scripts
4. Document the improvement
5. Update FRAMEWORK_UPDATES.md

### Sharing Patterns

If you discover a great pattern:
1. Document it in the appropriate variant
2. Add example code
3. Explain why it works well
4. Note any trade-offs

---

## Resources

### Backend/Infrastructure
- [templates/README.md](../templates/README.md)
- [FRAMEWORK_UPDATES.md](../FRAMEWORK_UPDATES.md)

### Frontend - Next.js
- [variants/frontend-nextjs/FRONTEND_SETUP.md](frontend-nextjs/FRONTEND_SETUP.md)
- [variants/frontend-nextjs/TECH_STACK_DECISION.md](frontend-nextjs/TECH_STACK_DECISION.md)

---

## Summary

**Backend/Infrastructure Variant:**
- For servers, Docker, databases, DevOps
- Templates in main `templates/` folder
- Focus on deployment, infrastructure, secrets

**Frontend - Next.js Variant:**
- For Next.js + React applications
- Templates in `variants/frontend-nextjs/`
- Standardized on Next.js 14 + Tailwind + shadcn/ui
- Component generation and frontend-specific tools

**Choose the variant that matches your project type.**

**For full-stack projects, use both variants in separate folders.**

---

**Last Updated:** 2025-11-16
**Next Review:** 2026-02-16
