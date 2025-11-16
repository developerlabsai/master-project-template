# Package Inventory - Frontend Projects

**Project:** [PROJECT_NAME]
**Stack:** Next.js 14 + Tailwind CSS + shadcn/ui
**Last Updated:** [DATE]

---

## Purpose

This document tracks all npm packages used in frontend projects. Keep this updated as you add or remove dependencies.

---

## Core Dependencies

### Framework & Runtime

| Package | Version | Purpose | Bundle Impact | Required |
|---------|---------|---------|---------------|----------|
| `next` | ^14.0.0 | React framework | Large | ✅ Yes |
| `react` | ^18.0.0 | UI library | Large | ✅ Yes |
| `react-dom` | ^18.0.0 | React DOM bindings | Large | ✅ Yes |
| `typescript` | ^5.0.0 | Type safety | Dev only | ✅ Yes |

**Total Size:** ~500KB (gzipped)

---

## Styling & UI

### Styling Framework

| Package | Version | Purpose | Bundle Impact | Required |
|---------|---------|---------|---------------|----------|
| `tailwindcss` | ^3.4.0 | Utility CSS framework | Small (purged) | ✅ Yes |
| `autoprefixer` | ^10.4.0 | CSS vendor prefixes | Dev only | ✅ Yes |
| `postcss` | ^8.4.0 | CSS processor | Dev only | ✅ Yes |
| `tailwindcss-animate` | ^1.0.7 | Tailwind animations | ~2KB | ✅ Yes |

**Total Size:** ~10-20KB (purged CSS only)

### Component Library (shadcn/ui)

**Note:** shadcn/ui components are copied into your project, not installed as dependencies.

**Dependencies shadcn/ui adds:**

| Package | Version | Purpose | Bundle Impact | Required |
|---------|---------|---------|---------------|----------|
| `@radix-ui/react-*` | Various | Accessible primitives | ~5-10KB per component | ✅ Yes |
| `class-variance-authority` | ^0.7.0 | Component variants | ~1KB | ✅ Yes |
| `clsx` | ^2.0.0 | Conditional classes | ~1KB | ✅ Yes |
| `tailwind-merge` | ^2.0.0 | Merge Tailwind classes | ~5KB | ✅ Yes |
| `lucide-react` | ^0.294.0 | Icon library | ~2KB per icon | ✅ Yes |

**Example Radix UI packages (added as you use components):**
- `@radix-ui/react-dialog`
- `@radix-ui/react-dropdown-menu`
- `@radix-ui/react-label`
- `@radix-ui/react-slot`
- `@radix-ui/react-toast`
- `@radix-ui/react-tooltip`
- `@radix-ui/react-popover`

**Total Size:** ~20-50KB (depends on components used)

---

## State Management

### Zustand (Primary)

| Package | Version | Purpose | Bundle Impact | Required |
|---------|---------|---------|---------------|----------|
| `zustand` | ^4.4.0 | Global state management | ~1KB | 🟡 Recommended |

**When to use:**
- Authentication state
- User preferences
- Shopping cart
- Global UI state (modals, sidebar)

**Installation:**
```bash
pnpm add zustand
```

**Total Size:** ~1KB

### Jotai (Alternative)

| Package | Version | Purpose | Bundle Impact | Required |
|---------|---------|---------|---------------|----------|
| `jotai` | ^2.6.0 | Atomic state management | ~3KB | 🟡 Optional |

**When to use instead of Zustand:**
- Need atomic state pattern
- Lots of derived state
- More granular re-renders

**Installation:**
```bash
pnpm add jotai
```

**Total Size:** ~3KB

---

## Data Fetching

| Package | Version | Purpose | Bundle Impact | Required |
|---------|---------|---------|---------------|----------|
| `@tanstack/react-query` | ^5.0.0 | Data fetching/caching | ~15KB | ✅ Yes |
| `@tanstack/react-query-devtools` | ^5.0.0 | Dev tools | Dev only | 🟡 Dev only |

**Installation:**
```bash
pnpm add @tanstack/react-query
pnpm add -D @tanstack/react-query-devtools
```

**Total Size:** ~15KB

---

## Forms & Validation

| Package | Version | Purpose | Bundle Impact | Required |
|---------|---------|---------|---------------|----------|
| `react-hook-form` | ^7.49.0 | Form management | ~9KB | ✅ Yes |
| `zod` | ^3.22.0 | Schema validation | ~12KB | ✅ Yes |
| `@hookform/resolvers` | ^3.3.0 | Zod + RHF integration | ~2KB | ✅ Yes |

**Installation:**
```bash
pnpm add react-hook-form zod @hookform/resolvers
```

**Total Size:** ~23KB

---

## Utilities

| Package | Version | Purpose | Bundle Impact | Required |
|---------|---------|---------|---------------|----------|
| `date-fns` | ^3.0.0 | Date formatting | ~5-10KB (tree-shakeable) | 🟡 Recommended |

**Installation:**
```bash
pnpm add date-fns
```

**Total Size:** ~5-10KB (only imported functions)

---

## Theme & Dark Mode

| Package | Version | Purpose | Bundle Impact | Required |
|---------|---------|---------|---------------|----------|
| `next-themes` | ^0.2.1 | Theme switching | ~2KB | ✅ Yes |

**Installation:**
```bash
pnpm add next-themes
```

**Total Size:** ~2KB

---

## Development Dependencies

### TypeScript

| Package | Version | Purpose | Required |
|---------|---------|---------|----------|
| `typescript` | ^5.0.0 | Type checking | ✅ Yes |
| `@types/node` | ^20.0.0 | Node.js types | ✅ Yes |
| `@types/react` | ^18.0.0 | React types | ✅ Yes |
| `@types/react-dom` | ^18.0.0 | React DOM types | ✅ Yes |

### Linting & Formatting

| Package | Version | Purpose | Required |
|---------|---------|---------|----------|
| `eslint` | ^8.0.0 | Code linting | ✅ Yes |
| `eslint-config-next` | ^14.0.0 | Next.js ESLint config | ✅ Yes |
| `prettier` | ^3.0.0 | Code formatting | ✅ Yes |
| `prettier-plugin-tailwindcss` | ^0.5.0 | Sort Tailwind classes | ✅ Yes |

**Installation:**
```bash
pnpm add -D prettier prettier-plugin-tailwindcss
```

---

## Optional Packages

### Testing

| Package | Version | Purpose | Bundle Impact | When to Add |
|---------|---------|---------|---------------|-------------|
| `vitest` | ^1.0.0 | Unit test runner | Dev only | Need unit tests |
| `@testing-library/react` | ^14.0.0 | React testing | Dev only | Need component tests |
| `@testing-library/jest-dom` | ^6.0.0 | DOM matchers | Dev only | Need component tests |
| `@vitejs/plugin-react` | ^4.0.0 | Vitest React plugin | Dev only | Need unit tests |
| `playwright` | ^1.40.0 | E2E testing | Dev only | Need E2E tests |

**Installation:**
```bash
# Unit testing
pnpm add -D vitest @testing-library/react @testing-library/jest-dom @vitejs/plugin-react

# E2E testing
pnpm create playwright
```

### Backend Integration

| Package | Version | Purpose | Bundle Impact | When to Add |
|---------|---------|---------|---------------|-------------|
| `@supabase/supabase-js` | ^2.38.0 | Supabase client | ~50KB | Using Supabase |
| `next-auth` | ^4.24.0 | Authentication | ~30KB | Self-hosted auth |
| `@clerk/nextjs` | ^4.29.0 | Authentication | ~50KB | Using Clerk |

**Supabase:**
```bash
pnpm add @supabase/supabase-js
```

**NextAuth:**
```bash
pnpm add next-auth
```

### Database (if needed)

| Package | Version | Purpose | Bundle Impact | When to Add |
|---------|---------|---------|---------------|-------------|
| `prisma` | ^5.7.0 | Database ORM | Dev only | Using Prisma |
| `@prisma/client` | ^5.7.0 | Prisma client | ~300KB | Using Prisma |
| `drizzle-orm` | ^0.29.0 | Lightweight ORM | ~20KB | Alternative to Prisma |

### Payments

| Package | Version | Purpose | Bundle Impact | When to Add |
|---------|---------|---------|---------------|-------------|
| `@stripe/stripe-js` | ^2.0.0 | Stripe client | ~50KB | Stripe payments |
| `stripe` | ^14.0.0 | Stripe server | Server only | Stripe backend |

**Installation:**
```bash
pnpm add @stripe/stripe-js stripe
```

### Analytics

| Package | Version | Purpose | Bundle Impact | When to Add |
|---------|---------|---------|---------------|-------------|
| `@vercel/analytics` | ^1.1.0 | Vercel Analytics | ~1KB | Deploying to Vercel |
| `@vercel/speed-insights` | ^1.0.0 | Speed Insights | ~2KB | Need performance tracking |

**Installation:**
```bash
pnpm add @vercel/analytics @vercel/speed-insights
```

### Email

| Package | Version | Purpose | Bundle Impact | When to Add |
|---------|---------|---------|---------------|-------------|
| `react-email` | ^1.10.0 | Email templates | Server only | Email features |
| `resend` | ^2.0.0 | Email sending | Server only | Using Resend |
| `nodemailer` | ^6.9.0 | Email sending | Server only | Self-hosted email |

### File Upload

| Package | Version | Purpose | Bundle Impact | When to Add |
|---------|---------|---------|---------------|-------------|
| `react-dropzone` | ^14.2.0 | Drag & drop upload | ~10KB | File uploads |
| `@uploadthing/react` | ^6.0.0 | UploadThing client | ~15KB | Using UploadThing |

### Rich Text

| Package | Version | Purpose | Bundle Impact | When to Add |
|---------|---------|---------|---------------|-------------|
| `@tiptap/react` | ^2.1.0 | Rich text editor | ~100KB | Rich text editing |
| `@tiptap/starter-kit` | ^2.1.0 | Editor extensions | Included | With Tiptap |

### Charts

| Package | Version | Purpose | Bundle Impact | When to Add |
|---------|---------|---------|---------------|-------------|
| `recharts` | ^2.10.0 | Chart library | ~100KB | Data visualization |
| `react-chartjs-2` | ^5.2.0 | Chart.js wrapper | ~150KB | Alternative charts |

### Tables

| Package | Version | Purpose | Bundle Impact | When to Add |
|---------|---------|---------|---------------|-------------|
| `@tanstack/react-table` | ^8.11.0 | Headless tables | ~30KB | Complex tables |

---

## Package Scripts

### Standard Scripts

```json
{
  "scripts": {
    "dev": "next dev",
    "build": "next build",
    "start": "next start",
    "lint": "next lint",
    "type-check": "tsc --noEmit",
    "format": "prettier --write \"**/*.{ts,tsx,md}\"",
    "format:check": "prettier --check \"**/*.{ts,tsx,md}\""
  }
}
```

### With Testing

```json
{
  "scripts": {
    "test": "vitest",
    "test:ui": "vitest --ui",
    "test:coverage": "vitest --coverage",
    "test:e2e": "playwright test",
    "test:e2e:ui": "playwright test --ui"
  }
}
```

---

## Bundle Size Tracking

### Analyze Bundle

```bash
# Install analyzer
pnpm add -D @next/bundle-analyzer

# Update next.config.js
const withBundleAnalyzer = require('@next/bundle-analyzer')({
  enabled: process.env.ANALYZE === 'true',
})

module.exports = withBundleAnalyzer(nextConfig)

# Run analysis
ANALYZE=true pnpm build
```

### Size Targets

| Bundle Type | Target | Warning | Maximum |
|-------------|--------|---------|---------|
| First Load JS | < 200KB | 200-300KB | 300KB |
| Per Route | < 100KB | 100-150KB | 150KB |

---

## Dependency Management

### Update Packages

```bash
# Check outdated packages
pnpm outdated

# Update all to latest (within semver)
pnpm update

# Update to latest (including major versions)
pnpm update --latest

# Update specific package
pnpm update next@latest
```

### Audit Security

```bash
# Check for vulnerabilities
pnpm audit

# Fix vulnerabilities
pnpm audit --fix
```

### Clean Install

```bash
# Remove node_modules and reinstall
rm -rf node_modules .pnpm-store pnpm-lock.yaml
pnpm install
```

---

## Recommended package.json

### Minimal Setup

```json
{
  "name": "my-app",
  "version": "0.1.0",
  "private": true,
  "scripts": {
    "dev": "next dev",
    "build": "next build",
    "start": "next start",
    "lint": "next lint"
  },
  "dependencies": {
    "next": "^14.0.0",
    "react": "^18.0.0",
    "react-dom": "^18.0.0",
    "@tanstack/react-query": "^5.0.0",
    "react-hook-form": "^7.49.0",
    "zod": "^3.22.0",
    "@hookform/resolvers": "^3.3.0",
    "zustand": "^4.4.0",
    "next-themes": "^0.2.1",
    "class-variance-authority": "^0.7.0",
    "clsx": "^2.0.0",
    "tailwind-merge": "^2.0.0",
    "lucide-react": "^0.294.0",
    "date-fns": "^3.0.0"
  },
  "devDependencies": {
    "typescript": "^5.0.0",
    "@types/node": "^20.0.0",
    "@types/react": "^18.0.0",
    "@types/react-dom": "^18.0.0",
    "tailwindcss": "^3.4.0",
    "postcss": "^8.4.0",
    "autoprefixer": "^10.4.0",
    "tailwindcss-animate": "^1.0.7",
    "eslint": "^8.0.0",
    "eslint-config-next": "^14.0.0",
    "prettier": "^3.0.0",
    "prettier-plugin-tailwindcss": "^0.5.0",
    "@tanstack/react-query-devtools": "^5.0.0"
  }
}
```

### Full Setup (with all optional packages)

```json
{
  "dependencies": {
    "next": "^14.0.0",
    "react": "^18.0.0",
    "react-dom": "^18.0.0",
    "@tanstack/react-query": "^5.0.0",
    "react-hook-form": "^7.49.0",
    "zod": "^3.22.0",
    "@hookform/resolvers": "^3.3.0",
    "zustand": "^4.4.0",
    "next-themes": "^0.2.1",
    "class-variance-authority": "^0.7.0",
    "clsx": "^2.0.0",
    "tailwind-merge": "^2.0.0",
    "lucide-react": "^0.294.0",
    "date-fns": "^3.0.0",
    "@supabase/supabase-js": "^2.38.0",
    "@vercel/analytics": "^1.1.0",
    "@vercel/speed-insights": "^1.0.0"
  },
  "devDependencies": {
    "typescript": "^5.0.0",
    "@types/node": "^20.0.0",
    "@types/react": "^18.0.0",
    "@types/react-dom": "^18.0.0",
    "tailwindcss": "^3.4.0",
    "postcss": "^8.4.0",
    "autoprefixer": "^10.4.0",
    "tailwindcss-animate": "^1.0.7",
    "eslint": "^8.0.0",
    "eslint-config-next": "^14.0.0",
    "prettier": "^3.0.0",
    "prettier-plugin-tailwindcss": "^0.5.0",
    "@tanstack/react-query-devtools": "^5.0.0",
    "vitest": "^1.0.0",
    "@testing-library/react": "^14.0.0",
    "@testing-library/jest-dom": "^6.0.0",
    "@vitejs/plugin-react": "^4.0.0"
  }
}
```

---

## Best Practices

### 1. Keep Dependencies Minimal

- Only add what you need
- Remove unused packages
- Use built-in Next.js features when possible

### 2. Pin Major Versions

```json
{
  "dependencies": {
    "next": "^14.0.0",  // ✅ Pin major version
    "react": "~18.2.0"  // ✅ Pin minor version for stability
  }
}
```

### 3. Regular Updates

- Update dependencies monthly
- Test after updates
- Read changelogs for breaking changes

### 4. Bundle Size Awareness

- Check bundle impact before adding packages
- Use tree-shakeable libraries
- Lazy load heavy components

```typescript
// Lazy load heavy component
const HeavyChart = dynamic(() => import('./heavy-chart'), {
  loading: () => <LoadingSpinner />,
})
```

### 5. Security

- Run `pnpm audit` regularly
- Keep packages up to date
- Remove deprecated packages

---

## Change Log

| Date | Package | Action | Reason |
|------|---------|--------|--------|
| 2025-11-16 | Initial setup | Added core packages | Project start |
| [DATE] | [package] | [added/removed/updated] | [reason] |

---

## Resources

- [pnpm Documentation](https://pnpm.io)
- [npm Trends](https://npmtrends.com) - Compare package popularity
- [Bundlephobia](https://bundlephobia.com) - Check bundle sizes
- [Can I Use](https://caniuse.com) - Browser compatibility

---

**Last Updated:** [DATE]
**Next Review:** [DATE + 1 month]
