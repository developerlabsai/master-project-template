# Tech Stack Decision - Frontend Projects

**Last Updated:** 2025-11-16
**Status:** Standardized
**Applies To:** All new frontend projects

---

## Purpose

This document establishes the **standardized frontend tech stack** for all new projects. By standardizing on a proven combination of tools, we ensure:

- **Consistency** across projects
- **Easier team onboarding**
- **Shared knowledge and patterns**
- **Reusable components and utilities**
- **Faster project setup**
- **Lower maintenance burden**

---

## Standardized Stack

### Core Framework

**Next.js 14 (App Router)**

**Why:**
- Industry-leading React framework
- Built-in routing, SSR, SSG, ISR
- Excellent performance optimization
- Strong TypeScript support
- Active community and ecosystem
- Vercel backing and support
- File-based routing
- Server Components by default

**Alternatives Considered:**
- ❌ Create React App - Deprecated, no SSR
- ❌ Remix - Smaller ecosystem, less mature
- ❌ Gatsby - Too opinionated for content sites only
- ❌ Vite + React Router - More manual setup required

**Decision:** Next.js 14 with App Router is the standard.

---

### Language

**TypeScript**

**Why:**
- Type safety reduces bugs
- Better IDE autocomplete
- Easier refactoring
- Self-documenting code
- Industry standard
- Required for large teams

**Decision:** TypeScript is required for all projects.

---

### Styling

**Tailwind CSS**

**Why:**
- Utility-first approach
- Rapid development
- Consistent design system
- Excellent DX with autocomplete
- Small bundle size (purges unused)
- Active community
- Easy customization

**Alternatives Considered:**
- ❌ CSS Modules - More verbose, harder to maintain
- ❌ Styled Components - Runtime cost, larger bundle
- ❌ Emotion - Similar to Styled Components
- ❌ Vanilla CSS - Scales poorly, no constraints

**Configuration:**
```typescript
// tailwind.config.ts
{
  darkMode: ["class"],
  content: ["./src/**/*.{ts,tsx}"],
  theme: {
    extend: {
      // Custom colors, spacing, etc.
    }
  },
  plugins: [require("tailwindcss-animate")]
}
```

**Decision:** Tailwind CSS is the standard styling solution.

---

### Component Library

**shadcn/ui**

**Why:**
- Not a dependency - copy components into project
- Built on Radix UI primitives
- Fully customizable
- Excellent accessibility
- Beautiful default styling
- Tailwind-based
- Active development
- Growing ecosystem

**What it includes:**
- 50+ pre-built components
- Dark mode support
- Accessible by default
- Customizable with Tailwind

**Alternatives Considered:**
- ❌ Material UI - Heavy, opinionated styling
- ❌ Chakra UI - Runtime CSS-in-JS overhead
- ❌ Ant Design - Chinese design language, large bundle
- ❌ Mantine - Good but less adoption than shadcn/ui

**Decision:** shadcn/ui is the standard component library.

---

### Package Manager

**pnpm**

**Why:**
- Faster than npm/yarn
- Disk space efficient (content-addressable storage)
- Strict dependency resolution
- Monorepo support
- Growing adoption

**Alternatives Considered:**
- ❌ npm - Slower, larger node_modules
- ❌ yarn - Better than npm but slower than pnpm
- ✅ pnpm - Best performance and efficiency

**Decision:** pnpm is the standard package manager.

---

## Supporting Libraries

### State Management

**Zustand** (Primary) or **Jotai** (Alternative)

**Zustand - For most projects:**
```typescript
import { create } from 'zustand'

interface UserStore {
  user: User | null
  setUser: (user: User) => void
}

export const useUserStore = create<UserStore>((set) => ({
  user: null,
  setUser: (user) => set({ user }),
}))
```

**Why Zustand:**
- Simple API
- No boilerplate
- Excellent TypeScript support
- Small bundle size (~1KB)
- No Context Provider needed
- DevTools support

**Jotai - For atomic state needs:**
```typescript
import { atom, useAtom } from 'jotai'

const userAtom = atom<User | null>(null)
```

**Why Jotai:**
- Atomic state management
- Better for derived state
- More granular updates
- Smaller re-renders

**Alternatives Considered:**
- ❌ Redux - Too much boilerplate
- ❌ Redux Toolkit - Still complex for most needs
- ❌ MobX - Different paradigm, less popular
- ❌ Recoil - Meta/Facebook, uncertain future

**Decision:** Use **Zustand** by default. Use **Jotai** for atomic state patterns.

---

### Data Fetching

**TanStack Query (React Query)**

**Why:**
- Industry standard for server state
- Built-in caching
- Background refetching
- Optimistic updates
- Error handling
- Loading states
- DevTools

```typescript
import { useQuery } from '@tanstack/react-query'

function useUser(id: string) {
  return useQuery({
    queryKey: ['user', id],
    queryFn: () => fetchUser(id),
  })
}
```

**Alternatives Considered:**
- ❌ SWR - Good but less feature-rich than React Query
- ❌ Apollo Client - GraphQL only, heavy
- ❌ Custom hooks - Reinventing the wheel

**Decision:** TanStack Query is the standard for data fetching.

---

### Form Handling

**React Hook Form + Zod**

**React Hook Form - Form management:**
```typescript
import { useForm } from 'react-hook-form'

const form = useForm<FormValues>({
  defaultValues: { email: '' },
})
```

**Why:**
- Excellent performance (uncontrolled inputs)
- Great DX
- Small bundle size
- TypeScript support

**Zod - Schema validation:**
```typescript
import { z } from 'zod'

const schema = z.object({
  email: z.string().email(),
  password: z.string().min(8),
})
```

**Why:**
- Type-safe validation
- Excellent error messages
- Composable schemas
- Works with React Hook Form

**Alternatives Considered:**
- ❌ Formik - Larger bundle, slower performance
- ❌ Yup - Less type-safe than Zod
- ❌ Built-in validation - Not standardized

**Decision:** React Hook Form + Zod is the standard.

---

### Icons

**Lucide React**

**Why:**
- Beautiful, consistent icons
- Tree-shakeable (import only what you use)
- TypeScript support
- Active development
- 1000+ icons

```typescript
import { Home, User, Settings } from 'lucide-react'

<Home className="h-4 w-4" />
```

**Alternatives Considered:**
- ❌ React Icons - Large bundle if not careful
- ❌ Heroicons - Limited icon set
- ❌ Font Awesome - Not tree-shakeable

**Decision:** Lucide React is the standard icon library.

---

### Date Handling

**date-fns**

**Why:**
- Modular (import only needed functions)
- Immutable
- TypeScript support
- Smaller than Moment.js
- Pure functions

```typescript
import { format, addDays } from 'date-fns'

format(new Date(), 'yyyy-MM-dd')
```

**Alternatives Considered:**
- ❌ Moment.js - Large, mutable, deprecated
- ❌ Day.js - Good but smaller ecosystem
- ❌ Luxon - Good but less popular

**Decision:** date-fns is the standard for date manipulation.

---

### Styling Utilities

**class-variance-authority (CVA)**

**Why:**
- Create component variants
- Type-safe
- Works perfectly with Tailwind
- Used by shadcn/ui

```typescript
const buttonVariants = cva(
  "rounded font-medium",
  {
    variants: {
      variant: {
        primary: "bg-blue-500 text-white",
        secondary: "bg-gray-500 text-white",
      },
      size: {
        sm: "px-2 py-1 text-sm",
        md: "px-4 py-2",
      }
    }
  }
)
```

**Additional Utilities:**
- **clsx** - Conditional classnames
- **tailwind-merge** - Merge Tailwind classes

**Decision:** CVA + clsx + tailwind-merge for styling utilities.

---

## Optional Libraries

### When Needed

**Authentication:**
- NextAuth.js (if self-hosted auth)
- Supabase Auth (if using Supabase)
- Clerk (if using managed auth)

**Database/Backend:**
- Supabase (BaaS)
- Prisma (ORM)
- Drizzle ORM (lighter alternative)

**Payments:**
- Stripe (via @stripe/stripe-js)

**Analytics:**
- Vercel Analytics
- Google Analytics (via next/script)
- Plausible

**Testing:**
- Vitest (unit tests)
- Playwright (E2E tests)
- Testing Library (component tests)

---

## Development Tools

### Required

**ESLint**
- Next.js ESLint config
- TypeScript ESLint
- Prettier integration

**Prettier**
- Code formatting
- Tailwind plugin for class sorting

**TypeScript**
- Type checking
- Path aliases (@/components)

### Recommended VS Code Extensions

```json
{
  "recommendations": [
    "bradlc.vscode-tailwindcss",
    "esbenp.prettier-vscode",
    "dbaeumer.vscode-eslint",
    "ms-vscode.vscode-typescript-next"
  ]
}
```

---

## Deployment Platform

### Primary: Vercel

**Why:**
- Built by Next.js creators
- Zero configuration
- Automatic HTTPS
- Preview deployments
- Edge functions
- Excellent DX

### Alternative: AWS Amplify

**When to use:**
- Deep AWS integration needed
- Cost optimization at scale
- Existing AWS infrastructure

### Alternative: S3 + CloudFront

**When to use:**
- Static export only
- Maximum cost optimization
- Full control needed

**Decision:** Vercel is primary. AWS for specific needs.

---

## Version Requirements

| Tool | Minimum Version | Recommended |
|------|----------------|-------------|
| Node.js | 18.17.0 | 20.x (LTS) |
| pnpm | 8.0.0 | Latest |
| Next.js | 14.0.0 | 14.x (latest) |
| React | 18.0.0 | 18.x (latest) |
| TypeScript | 5.0.0 | 5.x (latest) |

---

## Migration Path

### From Older Next.js (Pages Router)

1. Create new project with App Router
2. Migrate pages one by one
3. Use parallel routes during transition
4. Update data fetching patterns

### From Other Frameworks (CRA, Vite)

1. Create new Next.js project
2. Copy components to new structure
3. Update imports and routing
4. Refactor to Server Components where possible

---

## When to Deviate

**Allowed deviations:**
- Different state management if project has specific needs
- Alternative form library if justified
- Additional UI libraries for specific components

**Required approval for:**
- Different framework (not Next.js)
- Different styling approach (not Tailwind)
- Different language (not TypeScript)

**How to request deviation:**
1. Document reason in project DECISION_LOG.md
2. List alternatives considered
3. Justify why standard doesn't work
4. Get team approval

---

## Stack Updates

This stack is reviewed quarterly. Updates consider:
- New tool releases
- Community adoption
- Performance improvements
- Developer experience
- Breaking changes

**Next Review:** 2026-02-16

---

## Quick Start

```bash
# Create new project with standardized stack
pnpm create next-app@latest my-app \
  --typescript \
  --tailwind \
  --app \
  --src-dir

cd my-app

# Install shadcn/ui
pnpm dlx shadcn-ui@latest init

# Install standard dependencies
pnpm add zustand @tanstack/react-query react-hook-form zod
pnpm add lucide-react date-fns clsx tailwind-merge class-variance-authority

# Install dev dependencies
pnpm add -D @tanstack/react-query-devtools
pnpm add -D prettier prettier-plugin-tailwindcss

# Start development
pnpm dev
```

---

## Resources

- [Next.js Documentation](https://nextjs.org/docs)
- [Tailwind CSS](https://tailwindcss.com)
- [shadcn/ui](https://ui.shadcn.com)
- [Zustand](https://docs.pmnd.rs/zustand)
- [TanStack Query](https://tanstack.com/query)
- [React Hook Form](https://react-hook-form.com)
- [Zod](https://zod.dev)

---

## Summary

**Standardized Stack:**
- ✅ Next.js 14 (App Router)
- ✅ TypeScript
- ✅ Tailwind CSS
- ✅ shadcn/ui
- ✅ pnpm
- ✅ Zustand (state)
- ✅ TanStack Query (data fetching)
- ✅ React Hook Form + Zod (forms)
- ✅ Lucide React (icons)
- ✅ date-fns (dates)
- ✅ Vercel (deployment)

**Benefits:**
- Consistent developer experience
- Reusable patterns and components
- Easier onboarding
- Shared knowledge
- Faster project setup
- Lower maintenance

---

**Last Updated:** 2025-11-16
**Next Review:** 2026-02-16
**Status:** Active Standard
