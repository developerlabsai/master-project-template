# Frontend Setup Guide - Next.js + Tailwind + shadcn/ui

**Project:** [PROJECT_NAME]
**Created:** [DATE]
**Stack Version:** Next.js 14 + Tailwind CSS + shadcn/ui

---

## Purpose

This guide walks you through setting up a standardized Next.js frontend project with Tailwind CSS and shadcn/ui. Follow these steps to ensure consistency across all frontend projects.

---

## Prerequisites

- Node.js 18.17 or later
- pnpm (recommended) or npm
- Git
- Code editor (VS Code recommended)

---

## Stack Overview

### Core Framework
- **Next.js 14** - React framework with App Router
- **React 18** - UI library
- **TypeScript** - Type safety

### Styling
- **Tailwind CSS** - Utility-first CSS framework
- **shadcn/ui** - Re-usable component library built on Radix UI
- **class-variance-authority (CVA)** - Component variants
- **tailwind-merge** - Merge Tailwind classes

### Additional Tools
- **Zustand** or **Jotai** - State management
- **React Hook Form** - Form handling
- **Zod** - Schema validation
- **TanStack Query** - Data fetching
- **next-themes** - Dark mode support

---

## Initial Setup

### 1. Create Next.js Project

```bash
# Using pnpm (recommended)
pnpm create next-app@latest

# Using npm
npx create-next-app@latest
```

**Configuration options:**
```
✔ What is your project named? … [project-name]
✔ Would you like to use TypeScript? … Yes
✔ Would you like to use ESLint? … Yes
✔ Would you like to use Tailwind CSS? … Yes
✔ Would you like to use `src/` directory? … Yes
✔ Would you like to use App Router? … Yes
✔ Would you like to customize the default import alias (@/*)? … No
```

### 2. Navigate to Project

```bash
cd [project-name]
```

### 3. Install pnpm (if not already installed)

```bash
npm install -g pnpm
```

---

## shadcn/ui Setup

### 1. Initialize shadcn/ui

```bash
pnpm dlx shadcn-ui@latest init
```

**Configuration:**
```
✔ Would you like to use TypeScript (recommended)? … yes
✔ Which style would you like to use? › Default
✔ Which color would you like to use as base color? › Slate
✔ Where is your global CSS file? … src/app/globals.css
✔ Would you like to use CSS variables for colors? … yes
✔ Are you using a custom tailwind prefix? … no
✔ Where is your tailwind.config.js located? … tailwind.config.ts
✔ Configure the import alias for components: … @/components
✔ Configure the import alias for utils: … @/lib/utils
✔ Are you using React Server Components? … yes
```

### 2. Add Initial Components

```bash
# Add commonly used components
pnpm dlx shadcn-ui@latest add button
pnpm dlx shadcn-ui@latest add card
pnpm dlx shadcn-ui@latest add input
pnpm dlx shadcn-ui@latest add label
pnpm dlx shadcn-ui@latest add form
pnpm dlx shadcn-ui@latest add dialog
pnpm dlx shadcn-ui@latest add dropdown-menu
pnpm dlx shadcn-ui@latest add toast
pnpm dlx shadcn-ui@latest add avatar
pnpm dlx shadcn-ui@latest add badge
```

---

## Additional Dependencies

### 1. State Management (Choose One)

**Zustand (Recommended for most projects):**
```bash
pnpm add zustand
```

**Jotai (For atomic state management):**
```bash
pnpm add jotai
```

### 2. Form Handling

```bash
pnpm add react-hook-form zod @hookform/resolvers
```

### 3. Data Fetching

```bash
pnpm add @tanstack/react-query @tanstack/react-query-devtools
```

### 4. Dark Mode

```bash
pnpm add next-themes
```

### 5. Icons

```bash
pnpm add lucide-react
```

### 6. Date Handling

```bash
pnpm add date-fns
```

### 7. Utilities

```bash
pnpm add clsx tailwind-merge class-variance-authority
```

---

## Project Structure

```
[project-name]/
├── src/
│   ├── app/                    # Next.js App Router
│   │   ├── (auth)/            # Route groups
│   │   │   ├── login/
│   │   │   └── register/
│   │   ├── (dashboard)/
│   │   │   ├── layout.tsx
│   │   │   └── page.tsx
│   │   ├── api/               # API routes
│   │   ├── layout.tsx         # Root layout
│   │   ├── page.tsx           # Home page
│   │   └── globals.css        # Global styles
│   ├── components/            # React components
│   │   ├── ui/               # shadcn/ui components
│   │   ├── forms/            # Form components
│   │   ├── layout/           # Layout components
│   │   └── features/         # Feature-specific components
│   ├── lib/                   # Utility functions
│   │   ├── utils.ts          # General utilities
│   │   ├── api.ts            # API client
│   │   └── validations.ts    # Zod schemas
│   ├── hooks/                 # Custom React hooks
│   ├── store/                 # Zustand/Jotai stores
│   ├── types/                 # TypeScript types
│   └── config/                # Configuration files
├── public/                    # Static assets
├── .env.local                 # Environment variables
├── .gitignore
├── next.config.js
├── tailwind.config.ts
├── tsconfig.json
├── package.json
└── README.md
```

---

## Configuration Files

### 1. Update `tailwind.config.ts`

```typescript
import type { Config } from "tailwindcss"

const config = {
  darkMode: ["class"],
  content: [
    './pages/**/*.{ts,tsx}',
    './components/**/*.{ts,tsx}',
    './app/**/*.{ts,tsx}',
    './src/**/*.{ts,tsx}',
  ],
  prefix: "",
  theme: {
    container: {
      center: true,
      padding: "2rem",
      screens: {
        "2xl": "1400px",
      },
    },
    extend: {
      colors: {
        border: "hsl(var(--border))",
        input: "hsl(var(--input))",
        ring: "hsl(var(--ring))",
        background: "hsl(var(--background))",
        foreground: "hsl(var(--foreground))",
        primary: {
          DEFAULT: "hsl(var(--primary))",
          foreground: "hsl(var(--primary-foreground))",
        },
        secondary: {
          DEFAULT: "hsl(var(--secondary))",
          foreground: "hsl(var(--secondary-foreground))",
        },
        destructive: {
          DEFAULT: "hsl(var(--destructive))",
          foreground: "hsl(var(--destructive-foreground))",
        },
        muted: {
          DEFAULT: "hsl(var(--muted))",
          foreground: "hsl(var(--muted-foreground))",
        },
        accent: {
          DEFAULT: "hsl(var(--accent))",
          foreground: "hsl(var(--accent-foreground))",
        },
        popover: {
          DEFAULT: "hsl(var(--popover))",
          foreground: "hsl(var(--popover-foreground))",
        },
        card: {
          DEFAULT: "hsl(var(--card))",
          foreground: "hsl(var(--card-foreground))",
        },
      },
      borderRadius: {
        lg: "var(--radius)",
        md: "calc(var(--radius) - 2px)",
        sm: "calc(var(--radius) - 4px)",
      },
      keyframes: {
        "accordion-down": {
          from: { height: "0" },
          to: { height: "var(--radix-accordion-content-height)" },
        },
        "accordion-up": {
          from: { height: "var(--radix-accordion-content-height)" },
          to: { height: "0" },
        },
      },
      animation: {
        "accordion-down": "accordion-down 0.2s ease-out",
        "accordion-up": "accordion-up 0.2s ease-out",
      },
    },
  },
  plugins: [require("tailwindcss-animate")],
} satisfies Config

export default config
```

### 2. Update `next.config.js`

```javascript
/** @type {import('next').NextConfig} */
const nextConfig = {
  images: {
    domains: ['localhost'],
    // Add your image domains here
  },
  experimental: {
    serverActions: true,
  },
}

module.exports = nextConfig
```

### 3. Create `.env.local`

```bash
# App
NEXT_PUBLIC_APP_URL=http://localhost:3000
NEXT_PUBLIC_APP_NAME="[Your App Name]"

# API
NEXT_PUBLIC_API_URL=http://localhost:3000/api

# Supabase (if using)
NEXT_PUBLIC_SUPABASE_URL=your-supabase-url
NEXT_PUBLIC_SUPABASE_ANON_KEY=your-anon-key

# Add to .gitignore!
```

### 4. Update `.gitignore`

```
# Environment variables
.env.local
.env.development.local
.env.test.local
.env.production.local

# Dependencies
node_modules
.pnpm-store

# Build
.next
out
dist

# Debug
npm-debug.log*
yarn-debug.log*
yarn-error.log*
pnpm-debug.log*

# IDE
.vscode
.idea
*.swp
*.swo

# OS
.DS_Store
Thumbs.db
```

---

## Dark Mode Setup

### 1. Create Theme Provider

Create `src/components/providers/theme-provider.tsx`:

```typescript
"use client"

import * as React from "react"
import { ThemeProvider as NextThemesProvider } from "next-themes"
import { type ThemeProviderProps } from "next-themes/dist/types"

export function ThemeProvider({ children, ...props }: ThemeProviderProps) {
  return <NextThemesProvider {...props}>{children}</NextThemesProvider>
}
```

### 2. Update Root Layout

Update `src/app/layout.tsx`:

```typescript
import { ThemeProvider } from "@/components/providers/theme-provider"
import { Inter } from "next/font/google"
import "./globals.css"

const inter = Inter({ subsets: ["latin"] })

export default function RootLayout({
  children,
}: {
  children: React.ReactNode
}) {
  return (
    <html lang="en" suppressHydrationWarning>
      <body className={inter.className}>
        <ThemeProvider
          attribute="class"
          defaultTheme="system"
          enableSystem
          disableTransitionOnChange
        >
          {children}
        </ThemeProvider>
      </body>
    </html>
  )
}
```

### 3. Create Theme Toggle Component

```bash
pnpm dlx shadcn-ui@latest add dropdown-menu
```

Create `src/components/theme-toggle.tsx`:

```typescript
"use client"

import * as React from "react"
import { Moon, Sun } from "lucide-react"
import { useTheme } from "next-themes"

import { Button } from "@/components/ui/button"
import {
  DropdownMenu,
  DropdownMenuContent,
  DropdownMenuItem,
  DropdownMenuTrigger,
} from "@/components/ui/dropdown-menu"

export function ThemeToggle() {
  const { setTheme } = useTheme()

  return (
    <DropdownMenu>
      <DropdownMenuTrigger asChild>
        <Button variant="outline" size="icon">
          <Sun className="h-[1.2rem] w-[1.2rem] rotate-0 scale-100 transition-all dark:-rotate-90 dark:scale-0" />
          <Moon className="absolute h-[1.2rem] w-[1.2rem] rotate-90 scale-0 transition-all dark:rotate-0 dark:scale-100" />
          <span className="sr-only">Toggle theme</span>
        </Button>
      </DropdownMenuTrigger>
      <DropdownMenuContent align="end">
        <DropdownMenuItem onClick={() => setTheme("light")}>
          Light
        </DropdownMenuItem>
        <DropdownMenuItem onClick={() => setTheme("dark")}>
          Dark
        </DropdownMenuItem>
        <DropdownMenuItem onClick={() => setTheme("system")}>
          System
        </DropdownMenuItem>
      </DropdownMenuContent>
    </DropdownMenu>
  )
}
```

---

## React Query Setup

### 1. Create Query Provider

Create `src/components/providers/query-provider.tsx`:

```typescript
"use client"

import { QueryClient, QueryClientProvider } from "@tanstack/react-query"
import { ReactQueryDevtools } from "@tanstack/react-query-devtools"
import { useState } from "react"

export function QueryProvider({ children }: { children: React.ReactNode }) {
  const [queryClient] = useState(
    () =>
      new QueryClient({
        defaultOptions: {
          queries: {
            staleTime: 60 * 1000, // 1 minute
            refetchOnWindowFocus: false,
          },
        },
      })
  )

  return (
    <QueryClientProvider client={queryClient}>
      {children}
      <ReactQueryDevtools initialIsOpen={false} />
    </QueryClientProvider>
  )
}
```

### 2. Add to Root Layout

Update `src/app/layout.tsx`:

```typescript
import { QueryProvider } from "@/components/providers/query-provider"
import { ThemeProvider } from "@/components/providers/theme-provider"

export default function RootLayout({
  children,
}: {
  children: React.ReactNode
}) {
  return (
    <html lang="en" suppressHydrationWarning>
      <body>
        <ThemeProvider attribute="class" defaultTheme="system" enableSystem>
          <QueryProvider>
            {children}
          </QueryProvider>
        </ThemeProvider>
      </body>
    </html>
  )
}
```

---

## Zustand Store Setup (Optional)

Create `src/store/user-store.ts`:

```typescript
import { create } from 'zustand'
import { devtools, persist } from 'zustand/middleware'

interface User {
  id: string
  name: string
  email: string
}

interface UserState {
  user: User | null
  setUser: (user: User | null) => void
  clearUser: () => void
}

export const useUserStore = create<UserState>()(
  devtools(
    persist(
      (set) => ({
        user: null,
        setUser: (user) => set({ user }),
        clearUser: () => set({ user: null }),
      }),
      {
        name: 'user-storage',
      }
    )
  )
)
```

---

## Form Example with React Hook Form + Zod

Create `src/components/forms/login-form.tsx`:

```typescript
"use client"

import { zodResolver } from "@hookform/resolvers/zod"
import { useForm } from "react-hook-form"
import * as z from "zod"

import { Button } from "@/components/ui/button"
import {
  Form,
  FormControl,
  FormField,
  FormItem,
  FormLabel,
  FormMessage,
} from "@/components/ui/form"
import { Input } from "@/components/ui/input"

const formSchema = z.object({
  email: z.string().email("Invalid email address"),
  password: z.string().min(8, "Password must be at least 8 characters"),
})

export function LoginForm() {
  const form = useForm<z.infer<typeof formSchema>>({
    resolver: zodResolver(formSchema),
    defaultValues: {
      email: "",
      password: "",
    },
  })

  function onSubmit(values: z.infer<typeof formSchema>) {
    console.log(values)
    // Handle form submission
  }

  return (
    <Form {...form}>
      <form onSubmit={form.handleSubmit(onSubmit)} className="space-y-6">
        <FormField
          control={form.control}
          name="email"
          render={({ field }) => (
            <FormItem>
              <FormLabel>Email</FormLabel>
              <FormControl>
                <Input placeholder="email@example.com" {...field} />
              </FormControl>
              <FormMessage />
            </FormItem>
          )}
        />
        <FormField
          control={form.control}
          name="password"
          render={({ field }) => (
            <FormItem>
              <FormLabel>Password</FormLabel>
              <FormControl>
                <Input type="password" placeholder="••••••••" {...field} />
              </FormControl>
              <FormMessage />
            </FormItem>
          )}
        />
        <Button type="submit" className="w-full">
          Sign In
        </Button>
      </form>
    </Form>
  )
}
```

---

## Development Commands

```bash
# Development server
pnpm dev

# Build for production
pnpm build

# Start production server
pnpm start

# Lint
pnpm lint

# Type check
pnpm tsc --noEmit

# Add shadcn/ui component
pnpm dlx shadcn-ui@latest add [component-name]
```

---

## VS Code Extensions (Recommended)

```json
{
  "recommendations": [
    "bradlc.vscode-tailwindcss",
    "esbenp.prettier-vscode",
    "dbaeumer.vscode-eslint",
    "prisma.prisma",
    "ms-vscode.vscode-typescript-next"
  ]
}
```

Create `.vscode/extensions.json` with this content.

---

## Prettier Configuration

Create `.prettierrc`:

```json
{
  "semi": false,
  "singleQuote": false,
  "tabWidth": 2,
  "trailingComma": "es5",
  "printWidth": 80,
  "plugins": ["prettier-plugin-tailwindcss"]
}
```

Install Prettier plugin:
```bash
pnpm add -D prettier prettier-plugin-tailwindcss
```

---

## ESLint Configuration

Update `.eslintrc.json`:

```json
{
  "extends": [
    "next/core-web-vitals",
    "prettier"
  ],
  "rules": {
    "react/no-unescaped-entities": "off",
    "@next/next/no-page-custom-font": "off"
  }
}
```

---

## TypeScript Paths

Update `tsconfig.json` to include path aliases:

```json
{
  "compilerOptions": {
    "baseUrl": ".",
    "paths": {
      "@/*": ["./src/*"],
      "@/components/*": ["./src/components/*"],
      "@/lib/*": ["./src/lib/*"],
      "@/hooks/*": ["./src/hooks/*"],
      "@/store/*": ["./src/store/*"],
      "@/types/*": ["./src/types/*"]
    }
  }
}
```

---

## Testing Setup (Optional)

### Vitest for Unit Tests

```bash
pnpm add -D vitest @vitejs/plugin-react jsdom @testing-library/react @testing-library/jest-dom
```

Create `vitest.config.ts`:

```typescript
import { defineConfig } from 'vitest/config'
import react from '@vitejs/plugin-react'
import path from 'path'

export default defineConfig({
  plugins: [react()],
  test: {
    environment: 'jsdom',
  },
  resolve: {
    alias: {
      '@': path.resolve(__dirname, './src'),
    },
  },
})
```

### Playwright for E2E Tests

```bash
pnpm create playwright
```

---

## Deployment Readiness Checklist

- [ ] Environment variables configured
- [ ] API endpoints tested
- [ ] Forms validated with Zod
- [ ] Error boundaries added
- [ ] Loading states implemented
- [ ] SEO metadata added
- [ ] Image optimization configured
- [ ] Dark mode tested
- [ ] Mobile responsive
- [ ] Accessibility tested
- [ ] Performance optimized
- [ ] Security headers configured

---

## Next Steps

1. Review [COMPONENT_ARCHITECTURE.md](COMPONENT_ARCHITECTURE.md) for component organization patterns
2. Review [DEPLOYMENT_CONFIG.md](DEPLOYMENT_CONFIG.md) for deployment options (Vercel, AWS)
3. Review [PACKAGE_INVENTORY.md](PACKAGE_INVENTORY.md) for dependency management
4. Start building your features!

---

## Troubleshooting

### Issue: Tailwind styles not applying

**Solution:**
- Verify `tailwind.config.ts` content paths include your source files
- Restart dev server after config changes
- Clear `.next` folder: `rm -rf .next`

### Issue: shadcn/ui components not found

**Solution:**
- Verify components are in `src/components/ui/`
- Check import paths match `components.json` configuration
- Re-run `pnpm dlx shadcn-ui@latest add [component]`

### Issue: TypeScript errors on path aliases

**Solution:**
- Verify `tsconfig.json` paths configuration
- Restart VS Code TypeScript server
- Check `baseUrl` is set correctly

### Issue: Dark mode not working

**Solution:**
- Verify `suppressHydrationWarning` on `<html>` tag
- Check ThemeProvider is wrapping app
- Verify Tailwind `darkMode: ["class"]` configuration

---

## Resources

- [Next.js Documentation](https://nextjs.org/docs)
- [Tailwind CSS Documentation](https://tailwindcss.com/docs)
- [shadcn/ui Documentation](https://ui.shadcn.com)
- [React Hook Form Documentation](https://react-hook-form.com)
- [Zod Documentation](https://zod.dev)
- [TanStack Query Documentation](https://tanstack.com/query)
- [Zustand Documentation](https://docs.pmnd.rs/zustand)

---

**Last Updated:** 2025-11-16
**Stack Version:** Next.js 14.0+ / React 18+ / TypeScript 5.0+
