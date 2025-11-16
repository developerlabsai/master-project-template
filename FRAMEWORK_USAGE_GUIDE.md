# Framework Usage Guide

**How to Use the Project Initialization Framework**

This guide explains the TWO ways to use the framework and when to use each approach.

---

## Option 1: Prompt-Based Approach (Recommended)

**Best For:**
- ✅ New projects with unique requirements
- ✅ When you want Claude to customize for your specific needs
- ✅ Projects where tech stack varies significantly
- ✅ When you want fresh, project-specific documentation
- ✅ Learning and understanding the framework

**How It Works:**
1. Copy the starter prompt from [QUICK_PROJECT_START.md](QUICK_PROJECT_START.md)
2. Fill in your project details
3. Paste into Claude Code
4. Let Claude build the project step-by-step
5. Claude adapts framework to your specific needs

**Advantages:**
- 🎯 **Customized** - Claude tailors everything to your project
- 🔄 **Flexible** - Easy to modify approach mid-stream
- 📚 **Learning** - You see and understand each step
- 🆕 **Fresh Content** - Documentation written for your specific context
- ⚡ **Interactive** - Can ask questions and adjust as you go

**Disadvantages:**
- ⏱️ Takes longer (but still only ~2 hours)
- Requires active participation
- May vary slightly between projects

**Example Prompt:**
```
I'm starting a new project: TaskMaster API

Purpose: REST API for task management with real-time updates
Tech: Node.js, Express, PostgreSQL, WebSockets, Redis
Infrastructure: AWS EC2, RDS, ElastiCache

Use the Project Initialization Framework:
1. Create PROJECT_OVERVIEW.md
2. Build folder structure for Node.js API
3. Configure MCP servers (filesystem, AWS, postgres)
4. Create documentation (README, ROADMAP, CLAUDE.md)
5. Set up automation scripts (setup, test, deploy)
6. Test everything and create PROJECT_STATUS.md

Let's start with Phase 1.
```

---

## Option 2: Template Folder Approach

**Best For:**
- ⚡ Quick project starts
- 🔁 Similar/repetitive projects
- 👥 Team standardization
- 📦 Creating multiple projects with same structure
- ⏰ When time is critical

**How It Works:**
1. Create a template folder with standard files
2. Copy template to new project location
3. Run find/replace on project-specific values
4. Customize MCP servers for the project
5. Let Claude fill in project-specific content

**What Goes in the Template:**

### Minimal Template (Always Include)
```
project-template/
├── README.md                      # Template with [PLACEHOLDERS]
├── PROJECT_OVERVIEW.md            # Template with [PLACEHOLDERS]
├── ROADMAP.md                     # Standard structure
├── CLAUDE.md                      # Generic project rules
├── .mcp.json.template             # Common MCP servers
├── .gitignore                     # Comprehensive template
├── .env.example                   # Common env vars
├── docs/
│   ├── SETUP_GUIDE.md            # Template structure
│   ├── ARCHITECTURE.md           # Template sections
│   └── TROUBLESHOOTING.md        # Common issues
└── scripts/
    ├── setup.sh                  # Generic setup script
    └── README.md                 # Script descriptions
```

### Full Template (Includes Everything)
```
project-template/
├── [All files from Minimal Template]
├── PROJECT_FRAMEWORK_TEMPLATE.md  # This framework
├── QUICK_PROJECT_START.md         # Quick start guide
├── FRAMEWORK_USAGE_GUIDE.md       # This file
└── templates/
    ├── web-app/                  # Web app specific
    ├── api/                      # API specific
    ├── infrastructure/           # Infra specific
    └── data-pipeline/            # Data pipeline specific
```

**Advantages:**
- ⚡ **Fast** - Start in minutes, not hours
- 📏 **Consistent** - Same structure every time
- 👥 **Team-Friendly** - Everyone uses same template
- 🎯 **Proven** - Based on working project structure
- 🔄 **Repeatable** - Perfect for similar projects

**Disadvantages:**
- Less customized to specific needs
- Still need to fill in project-specific content
- May include unnecessary files
- Requires maintaining template

---

## Recommendation: Hybrid Approach (Best of Both)

**The Optimal Strategy:**

### 1. Create Template Once
Use the prompt-based approach to create your FIRST project of each type:
- Web application template
- API template
- Infrastructure template
- Data pipeline template

### 2. Save as Template
After completing a project with the prompt approach:
```bash
# Remove project-specific data
rm -rf node_modules .env database.sqlite

# Save as template
cp -r current-project ~/project-templates/[TYPE]-template

# Document what needs customization
echo "CUSTOMIZE_ME.md" with list of placeholders
```

### 3. Use Template for Similar Projects
For future similar projects:
```bash
# Copy template
cp -r ~/project-templates/api-template new-project

# Run customization script
cd new-project
./customize.sh "NewProjectName" "description"

# Let Claude fill in specifics
```

### 4. Use Prompt for Unique Projects
When starting something different:
- Use the prompt-based approach
- Let Claude customize everything
- Save result as new template type if needed

---

## Detailed: Prompt-Based Approach

### Step-by-Step Process

**1. Prepare Your Project Info**
```
Project Name: [NAME]
Purpose: [ONE-SENTENCE]
Tech Stack: [LIST]
Infrastructure: [DETAILS]
Team Size: [NUMBER]
Timeline: [DURATION]
```

**2. Use Master Prompt**
Copy from [QUICK_PROJECT_START.md](QUICK_PROJECT_START.md):
```
I'm starting a new project: [NAME]

Purpose: [PURPOSE]
Tech: [STACK]
Infrastructure: [INFRA]

Use the Project Initialization Framework...
[FULL PROMPT]
```

**3. Let Claude Work Through Phases**
Claude will proceed through:
- Phase 1: Discovery & Planning
- Phase 2: Structure Setup
- Phase 3: MCP Configuration
- Phase 4: Documentation
- Phase 5: Automation
- Phase 6: Organization
- Phase 7: Testing
- Phase 8: Final Documentation

**4. Review and Approve Each Phase**
- Claude creates files
- You review
- Provide feedback
- Claude adjusts
- Move to next phase

**5. Final Verification**
- Test all MCP servers
- Run all scripts
- Verify all links
- Review documentation

**Time Investment:**
- Simple project: 30-45 minutes
- Standard project: 1-2 hours
- Complex project: 2-3 hours

---

## Detailed: Template Folder Approach

### Creating Your Template

**1. Start with Successful Project**
Use this n8n project as base:
```bash
# Copy this project (remove sensitive data first)
cp -r "n8n Webhook and Domains" ~/project-templates/infrastructure-template
```

**2. Generalize Content**
Replace specific values with placeholders:
```bash
# In all .md files
[PROJECT_NAME]
[PROJECT_PURPOSE]
[TECH_STACK]
[AWS_REGION]
[EC2_INSTANCE_TYPE]
etc.
```

**3. Create Customization Script**
```bash
#!/bin/bash
# customize.sh

PROJECT_NAME=$1
PROJECT_PURPOSE=$2

# Replace placeholders in all files
find . -type f -name "*.md" -exec sed -i '' "s/\[PROJECT_NAME\]/$PROJECT_NAME/g" {} +
find . -type f -name "*.md" -exec sed -i '' "s/\[PROJECT_PURPOSE\]/$PROJECT_PURPOSE/g" {} +

echo "Template customized for: $PROJECT_NAME"
```

**4. Document Customization Points**
Create `CUSTOMIZE_ME.md`:
```markdown
# Customization Checklist

## Required Changes
- [ ] Update [PROJECT_NAME] in all files
- [ ] Update [PROJECT_PURPOSE] in README.md
- [ ] Configure .mcp.json with correct path
- [ ] Update CLAUDE.md with project-specific rules
- [ ] Customize scripts for your infrastructure

## Files to Review
- README.md
- PROJECT_OVERVIEW.md
- .mcp.json
- All scripts in scripts/

## After Customization
- [ ] Test all MCP servers
- [ ] Run setup.sh
- [ ] Verify all documentation links
```

### Using the Template

**1. Copy Template**
```bash
cp -r ~/project-templates/[TYPE]-template ~/Projects/new-project
cd ~/Projects/new-project
```

**2. Run Customization**
```bash
./customize.sh "MyProject" "Project description"
```

**3. Manual Customization**
- Update .mcp.json with correct paths
- Customize scripts for your needs
- Update documentation specifics

**4. Let Claude Fill Details**
```
I've copied a project template for [PROJECT_TYPE].
Please help me:
1. Review and update PROJECT_OVERVIEW.md
2. Customize README.md for this specific project
3. Update ROADMAP.md with actual milestones
4. Test MCP servers
5. Verify all scripts work
```

**Time Investment:**
- Initial template creation: 2-3 hours (one time)
- Using template: 15-30 minutes per project
- ROI: Saves 1-2 hours per project

---

## Comparison Matrix

| Aspect | Prompt-Based | Template-Based | Hybrid |
|--------|--------------|----------------|--------|
| **Setup Time** | 1-2 hours | 15-30 min | 30-60 min |
| **Customization** | High | Medium | High |
| **Consistency** | Variable | High | High |
| **Learning Curve** | Higher | Lower | Medium |
| **Flexibility** | Very High | Medium | High |
| **Maintenance** | None | Template | Template |
| **Best For** | Unique projects | Repetitive | Most cases |
| **Team Use** | Harder | Easier | Good |

---

## Real-World Scenarios

### Scenario 1: First Infrastructure Project
**Use:** Prompt-Based Approach
**Why:** Learn the framework, create custom solution
**Time:** 2 hours
**Result:** Perfect fit for your specific needs

### Scenario 2: Building 5 Similar APIs
**Use:** Template-Based Approach
**Why:** Consistency and speed matter
**Time:** 2 hours (template) + 20 min each (5 projects)
**Result:** 5 consistent, well-structured projects

### Scenario 3: Regular Project Creation
**Use:** Hybrid Approach
**Why:** Balance of speed and customization
**Time:** Varies based on similarity
**Result:** Fast start with full customization

### Scenario 4: Team Onboarding
**Use:** Template + Documentation
**Why:** Team needs consistency
**Setup:** Create templates for common project types
**Result:** New team members can start projects independently

---

## Template Creation Guide

### From This Project

**1. Identify Reusable Components**
```bash
# These files are generic:
- PROJECT_FRAMEWORK_TEMPLATE.md
- QUICK_PROJECT_START.md
- FRAMEWORK_USAGE_GUIDE.md (this file)
- .mcp.json.basic
- .mcp.json.template

# These need customization:
- README.md (add placeholders)
- PROJECT_OVERVIEW.md (add placeholders)
- CLAUDE.md (make generic)
- scripts/* (add variable support)
```

**2. Create Placeholder System**
```
Standard Placeholders:
[PROJECT_NAME] - Name of the project
[PROJECT_PURPOSE] - One-sentence description
[PROJECT_DESCRIPTION] - Detailed description
[TECH_STACK] - Technologies used
[AWS_REGION] - AWS region
[AWS_PROFILE] - AWS profile name
[DOMAIN_NAME] - Custom domain
[EC2_INSTANCE_ID] - Instance ID
[SSH_KEY_PATH] - Path to SSH key
```

**3. Build Template Structure**
```bash
# Create template directory
mkdir -p ~/project-templates/infrastructure-template

# Copy framework files
cp PROJECT_FRAMEWORK_TEMPLATE.md ~/project-templates/infrastructure-template/
cp QUICK_PROJECT_START.md ~/project-templates/infrastructure-template/
cp FRAMEWORK_USAGE_GUIDE.md ~/project-templates/infrastructure-template/

# Copy and generalize project files
cp README.md ~/project-templates/infrastructure-template/README.template.md
# (edit to add placeholders)

# Create customization script
cat > ~/project-templates/infrastructure-template/customize.sh << 'EOF'
#!/bin/bash
# Customization script
# Usage: ./customize.sh PROJECT_NAME "Project description"
EOF
```

---

## Automation Script for Template

**Create Template from Current Project:**

```bash
#!/bin/bash
# create-template.sh

TEMPLATE_NAME=$1
SOURCE_DIR=$2
DEST_DIR=~/project-templates/$TEMPLATE_NAME

# Create template directory
mkdir -p "$DEST_DIR"

# Copy framework files
cp "$SOURCE_DIR/PROJECT_FRAMEWORK_TEMPLATE.md" "$DEST_DIR/"
cp "$SOURCE_DIR/QUICK_PROJECT_START.md" "$DEST_DIR/"
cp "$SOURCE_DIR/FRAMEWORK_USAGE_GUIDE.md" "$DEST_DIR/"

# Copy and clean project files
cp -r "$SOURCE_DIR/docs" "$DEST_DIR/"
cp -r "$SOURCE_DIR/scripts" "$DEST_DIR/"
cp "$SOURCE_DIR/.gitignore" "$DEST_DIR/"
cp "$SOURCE_DIR/.mcp.json.template" "$DEST_DIR/"

# Create README template
sed 's/n8n Webhook and Domains/[PROJECT_NAME]/g' "$SOURCE_DIR/README.md" > "$DEST_DIR/README.template.md"

echo "Template created at: $DEST_DIR"
echo "Next: Customize placeholders and test"
```

---

## Decision Tree

```
Starting a new project?
│
├─ Is it similar to a previous project?
│  ├─ YES → Do you have a template?
│  │  ├─ YES → Use Template Approach (15-30 min)
│  │  └─ NO → Use Prompt to create template (2 hours)
│  │             Save result as template for future
│  │
│  └─ NO → Use Prompt-Based Approach (1-2 hours)
│          Create custom solution
│          Optionally save as new template type
│
└─ Working with a team?
   ├─ YES → Create/use templates for consistency
   │        Document customization process
   │        Train team on template usage
   │
   └─ NO → Use approach that feels right
           Prompt for learning/unique projects
           Template for speed/repetition
```

---

## Recommended Setup

**For Individual Developers:**

1. **First Time:**
   - Use prompt-based approach for first project of each type
   - Save successful projects as templates
   - Build library of 3-5 templates

2. **Ongoing:**
   - Use templates for familiar project types
   - Use prompts for unique requirements
   - Update templates quarterly

**For Teams:**

1. **Initial Setup:**
   - Create standardized templates together
   - Document customization process
   - Store templates in shared repository

2. **Maintenance:**
   - Review templates monthly
   - Update based on learnings
   - Version control templates

---

## Next Steps

### To Use Prompt-Based Approach
1. Read [QUICK_PROJECT_START.md](QUICK_PROJECT_START.md)
2. Copy the master prompt
3. Fill in your project details
4. Paste into Claude Code
5. Work through phases

### To Use Template Approach
1. Use this n8n project as first template
2. Clean sensitive data
3. Add placeholders
4. Create customization script
5. Test with new project

### To Create Hybrid System
1. Start with prompt approach
2. Save successful projects as templates
3. Build template library
4. Use templates for similar projects
5. Use prompts for unique projects

---

## Success Metrics

**You know it's working when:**
- ✅ New projects start in under 30 minutes (with template)
- ✅ All projects have consistent structure
- ✅ Documentation is comprehensive from day one
- ✅ MCP servers work immediately
- ✅ Team can start projects independently
- ✅ No "missing files" or "forgot to set up X" moments

---

## FAQ

**Q: Which approach did we use for this n8n project?**
A: Prompt-based. We discovered the framework by actually doing it.

**Q: Should I create templates for everything?**
A: No. Create templates for project types you do repeatedly (3+ times).

**Q: Can I combine both approaches?**
A: Yes! Use template for structure, prompt for customization.

**Q: How often should I update templates?**
A: After every major success or learning. Minimum quarterly review.

**Q: What if my project doesn't fit a template?**
A: Use the prompt-based approach. That's what it's for!

**Q: Can I share templates with my team?**
A: Absolutely! That's one of the main benefits.

---

## Conclusion

**The Right Choice Depends On:**
- Project uniqueness
- Time available
- Team needs
- Learning goals
- Future repetition

**General Recommendation:**
- **First project of a type:** Prompt-based
- **Repeated projects:** Template-based
- **Most cases:** Hybrid approach

**Remember:**
The goal is consistent, well-organized projects. Both approaches work. Choose based on your situation.

---

**Version:** 1.0
**Created:** November 16, 2025
**Based On:** n8n project success
**Next Update:** After creating first template
