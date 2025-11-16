#!/usr/bin/env bash

###############################################################################
# Component Generator Script
#
# Purpose: Generate Next.js components with standardized boilerplate
# Usage: ./component-generator.sh [type] [name]
# Types: ui, feature, form, layout, page
###############################################################################

set -euo pipefail

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Helper functions
log_info() {
    echo -e "${GREEN}[INFO]${NC} $1"
}

log_warn() {
    echo -e "${YELLOW}[WARN]${NC} $1"
}

log_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

log_success() {
    echo -e "${BLUE}[SUCCESS]${NC} $1"
}

# Usage message
usage() {
    cat <<EOF
Component Generator for Next.js Projects

Usage:
    ./component-generator.sh [type] [name] [options]

Types:
    ui          - UI component (e.g., button, card)
    feature     - Feature component (e.g., user-profile)
    form        - Form component with React Hook Form + Zod
    layout      - Layout component
    page        - Page component (App Router)
    hook        - Custom React hook

Options:
    --client    - Mark component as "use client"
    --test      - Generate test file
    --story     - Generate Storybook story

Examples:
    ./component-generator.sh ui button
    ./component-generator.sh feature user-profile --client
    ./component-generator.sh form login-form --client
    ./component-generator.sh page dashboard
    ./component-generator.sh hook use-user

EOF
    exit 1
}

# Check if in Next.js project
check_nextjs_project() {
    if [[ ! -f "package.json" ]]; then
        log_error "Not in a Node.js project directory (no package.json found)"
        exit 1
    fi

    if ! grep -q "next" package.json; then
        log_error "Not in a Next.js project (Next.js not found in package.json)"
        exit 1
    fi
}

# Convert kebab-case to PascalCase
kebab_to_pascal() {
    echo "$1" | sed -r 's/(^|-)([a-z])/\U\2/g'
}

# Generate UI Component
generate_ui_component() {
    local name="$1"
    local client="$2"
    local pascal_name=$(kebab_to_pascal "$name")
    local file_path="src/components/ui/${name}.tsx"

    mkdir -p "src/components/ui"

    cat > "$file_path" <<EOF
${client}import * as React from "react"
import { cn } from "@/lib/utils"

interface ${pascal_name}Props extends React.HTMLAttributes<HTMLDivElement> {
  // Add custom props here
}

const ${pascal_name} = React.forwardRef<HTMLDivElement, ${pascal_name}Props>(
  ({ className, ...props }, ref) => {
    return (
      <div
        ref={ref}
        className={cn("", className)}
        {...props}
      />
    )
  }
)

${pascal_name}.displayName = "${pascal_name}"

export { ${pascal_name} }
EOF

    log_success "Created UI component: $file_path"
}

# Generate Feature Component
generate_feature_component() {
    local name="$1"
    local client="$2"
    local pascal_name=$(kebab_to_pascal "$name")

    # Extract feature name (first part before hyphen)
    local feature=$(echo "$name" | cut -d'-' -f1)
    local file_path="src/components/features/${feature}/${name}.tsx"

    mkdir -p "src/components/features/${feature}"

    cat > "$file_path" <<EOF
${client}import { cn } from "@/lib/utils"

interface ${pascal_name}Props {
  className?: string
}

export function ${pascal_name}({ className }: ${pascal_name}Props) {
  return (
    <div className={cn("", className)}>
      <h2>${pascal_name}</h2>
      {/* Component content */}
    </div>
  )
}
EOF

    log_success "Created feature component: $file_path"
}

# Generate Form Component
generate_form_component() {
    local name="$1"
    local pascal_name=$(kebab_to_pascal "$name")
    local file_path="src/components/forms/${name}.tsx"

    mkdir -p "src/components/forms"

    cat > "$file_path" <<EOF
"use client"

import { zodResolver } from "@hookform/resolvers/zod"
import { useForm } from "react-hook-form"
import * as z from "zod"

import { Button } from "@/components/ui/button"
import {
  Form,
  FormControl,
  FormDescription,
  FormField,
  FormItem,
  FormLabel,
  FormMessage,
} from "@/components/ui/form"
import { Input } from "@/components/ui/input"
import { toast } from "@/hooks/use-toast"

// Define form schema
const formSchema = z.object({
  // Add form fields here
  name: z.string().min(2, "Name must be at least 2 characters"),
})

type FormValues = z.infer<typeof formSchema>

interface ${pascal_name}Props {
  onSubmit?: (data: FormValues) => void | Promise<void>
}

export function ${pascal_name}({ onSubmit }: ${pascal_name}Props) {
  const form = useForm<FormValues>({
    resolver: zodResolver(formSchema),
    defaultValues: {
      name: "",
    },
  })

  async function handleSubmit(data: FormValues) {
    try {
      if (onSubmit) {
        await onSubmit(data)
      }

      toast({
        title: "Success",
        description: "Form submitted successfully",
      })

      form.reset()
    } catch (error) {
      toast({
        title: "Error",
        description: "Failed to submit form",
        variant: "destructive",
      })
    }
  }

  return (
    <Form {...form}>
      <form onSubmit={form.handleSubmit(handleSubmit)} className="space-y-6">
        <FormField
          control={form.control}
          name="name"
          render={({ field }) => (
            <FormItem>
              <FormLabel>Name</FormLabel>
              <FormControl>
                <Input placeholder="Enter name" {...field} />
              </FormControl>
              <FormDescription>
                This is a sample field
              </FormDescription>
              <FormMessage />
            </FormItem>
          )}
        />

        <Button type="submit" disabled={form.formState.isSubmitting}>
          {form.formState.isSubmitting ? "Submitting..." : "Submit"}
        </Button>
      </form>
    </Form>
  )
}
EOF

    log_success "Created form component: $file_path"
}

# Generate Layout Component
generate_layout_component() {
    local name="$1"
    local client="$2"
    local pascal_name=$(kebab_to_pascal "$name")
    local file_path="src/components/layout/${name}.tsx"

    mkdir -p "src/components/layout"

    cat > "$file_path" <<EOF
${client}import { cn } from "@/lib/utils"

interface ${pascal_name}Props {
  children: React.ReactNode
  className?: string
}

export function ${pascal_name}({ children, className }: ${pascal_name}Props) {
  return (
    <div className={cn("", className)}>
      {children}
    </div>
  )
}
EOF

    log_success "Created layout component: $file_path"
}

# Generate Page Component
generate_page_component() {
    local name="$1"
    local file_path="src/app/${name}/page.tsx"

    mkdir -p "src/app/${name}"

    cat > "$file_path" <<EOF
import type { Metadata } from "next"

export const metadata: Metadata = {
  title: "${name}",
  description: "Description for ${name} page",
}

export default function ${name}Page() {
  return (
    <div className="container mx-auto py-10">
      <h1 className="text-3xl font-bold mb-6">${name}</h1>
      {/* Page content */}
    </div>
  )
}
EOF

    log_success "Created page component: $file_path"
}

# Generate Custom Hook
generate_hook() {
    local name="$1"
    local file_path="src/hooks/${name}.ts"

    mkdir -p "src/hooks"

    # Convert use-something to useSomething
    local camel_name=$(echo "$name" | sed -E 's/-([a-z])/\U\1/g')

    cat > "$file_path" <<EOF
import { useState, useEffect } from "react"

export function ${camel_name}() {
  const [value, setValue] = useState<any>(null)

  useEffect(() => {
    // Hook logic here
  }, [])

  return { value, setValue }
}
EOF

    log_success "Created custom hook: $file_path"
}

# Generate test file
generate_test() {
    local component_path="$1"
    local test_path="${component_path%.tsx}.test.tsx"

    cat > "$test_path" <<EOF
import { render, screen } from "@testing-library/react"
import { describe, it, expect } from "vitest"

describe("Component", () => {
  it("should render", () => {
    render(<div>Test</div>)
    expect(screen.getByText("Test")).toBeInTheDocument()
  })
})
EOF

    log_success "Created test file: $test_path"
}

# Main script
main() {
    if [[ $# -lt 2 ]]; then
        usage
    fi

    check_nextjs_project

    local type="$1"
    local name="$2"
    local client_directive=""
    local generate_test=false

    # Parse options
    shift 2
    while [[ $# -gt 0 ]]; do
        case "$1" in
            --client)
                client_directive='"use client"\n\n'
                shift
                ;;
            --test)
                generate_test=true
                shift
                ;;
            --story)
                log_warn "Storybook generation not yet implemented"
                shift
                ;;
            *)
                log_error "Unknown option: $1"
                usage
                ;;
        esac
    done

    log_info "Generating $type component: $name"

    case "$type" in
        ui)
            generate_ui_component "$name" "$client_directive"
            ;;
        feature)
            generate_feature_component "$name" "$client_directive"
            ;;
        form)
            generate_form_component "$name"
            ;;
        layout)
            generate_layout_component "$name" "$client_directive"
            ;;
        page)
            generate_page_component "$name"
            ;;
        hook)
            generate_hook "$name"
            ;;
        *)
            log_error "Unknown component type: $type"
            usage
            ;;
    esac

    if [[ "$generate_test" == true ]]; then
        generate_test "src/components/${type}/${name}.tsx"
    fi

    echo ""
    log_success "Component generation complete!"
    echo ""
    echo "Next steps:"
    echo "  1. Open the generated file and customize it"
    echo "  2. Add the component to your page or layout"
    echo "  3. Test the component"
}

# Run main
main "$@"
