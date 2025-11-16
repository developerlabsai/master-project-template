# Project Initialization Framework

**Version:** 1.0
**Created:** November 16, 2025
**Based on:** n8n Webhook and Domains Project Success Pattern

This framework provides a consistent, step-by-step process for initializing any new project with Claude Code, ensuring organization, efficiency, and proper MCP server configuration.

---

## Quick Start Prompt Template

Use this prompt to start any new project:

```
I'm starting a new project called [PROJECT_NAME] for [PROJECT_PURPOSE].

Please follow the Project Initialization Framework to:
1. Create the project structure
2. Generate project documentation
3. Identify and configure needed MCP servers
4. Set up automation scripts
5. Organize for efficiency

Project details:
- Name: [PROJECT_NAME]
- Purpose: [BRIEF_DESCRIPTION]
- Tech stack: [TECHNOLOGIES]
- Infrastructure: [AWS/GCP/Local/etc]
- Repository: [If exists]

Let's build this project the right way from day one.
```

---

## Phase 1: Project Discovery & Planning

### Step 1.1: Initial Project Assessment

**Prompt to Claude:**
```
Help me assess this project:

Project Name: [NAME]
Purpose: [DESCRIPTION]
Expected deliverables: [LIST]
Tech stack: [TECHNOLOGIES]
Infrastructure: [CLOUD/LOCAL/HYBRID]

Please analyze:
1. What MCP servers would be beneficial?
2. What documentation will be needed?
3. What scripts/automation should we create?
4. What folder structure makes sense?
5. What are the key milestones?
```

**Claude Should Provide:**
- Project complexity assessment
- Recommended MCP servers with justification
- Suggested folder structure
- Initial documentation outline
- Estimated setup time

### Step 1.2: Create Project Overview

**Prompt to Claude:**
```
Create a comprehensive PROJECT_OVERVIEW.md for this project that includes:
- Project goals and objectives
- Technical architecture
- Infrastructure requirements
- Key features/deliverables
- Success criteria
- Timeline/milestones
```

**Deliverable:** `PROJECT_OVERVIEW.md`

**Template Sections:**
1. Executive Summary
2. Project Goals
3. Technical Architecture
4. Infrastructure & Stack
5. Key Features/Components
6. Success Criteria
7. Timeline & Milestones
8. Dependencies & Prerequisites
9. Risk Assessment

---

## Phase 2: Project Structure Setup

### Step 2.1: Create Folder Structure

**Prompt to Claude:**
```
Create the initial folder structure for this project based on best practices.

Project type: [Web App/API/Infrastructure/Data Pipeline/etc]
Key components: [LIST]
```

**Standard Structure:**
```
project-name/
├── README.md                      # Main entry point
├── PROJECT_OVERVIEW.md            # Detailed overview
├── ROADMAP.md                     # Project roadmap
├── CLAUDE.md                      # Claude Code project rules
│
├── .mcp.json                      # MCP server config
├── .gitignore                     # Git exclusions
├── .env.example                   # Environment template
│
├── docs/                          # Documentation
│   ├── SETUP_GUIDE.md
│   ├── ARCHITECTURE.md
│   ├── API_REFERENCE.md
│   └── TROUBLESHOOTING.md
│
├── scripts/                       # Automation scripts
│   ├── setup.sh
│   ├── deploy.sh
│   └── test.sh
│
├── src/                          # Source code
│   └── [project-specific]
│
├── tests/                        # Test files
│   └── [test-specific]
│
├── config/                       # Configuration files
│   └── [config-specific]
│
└── [project-specific folders]
```

### Step 2.2: Initialize Git Repository

**Prompt to Claude:**
```
Create a comprehensive .gitignore file for this project.

Project type: [TYPE]
Tech stack: [STACK]
Cloud provider: [PROVIDER]
```

**Should Include:**
- Language-specific ignores (node_modules, __pycache__, etc)
- Environment files (.env, .env.local, etc)
- IDE files (.vscode, .idea, etc)
- Credentials and secrets (*.pem, *.key, credentials.json)
- MCP local config (.mcp.local.json)
- Build artifacts
- Logs and temporary files
- OS-specific files (.DS_Store, Thumbs.db)

---

## Phase 3: MCP Server Configuration

### Step 3.1: Identify Required MCP Servers

**Decision Matrix:**

| Project Needs | Recommended MCP Server | Use Case |
|---------------|----------------------|----------|
| **File management** | `@modelcontextprotocol/server-filesystem` | All projects |
| **AWS infrastructure** | `awslabs.aws-api-mcp-server` | EC2, S3, Lambda management |
| **Docker containers** | `mcp-server-docker` | Docker-based projects |
| **GitHub operations** | `@modelcontextprotocol/server-github` | Repo management |
| **Database access** | `@modelcontextprotocol/server-postgres` | PostgreSQL projects |
| **API development** | Custom or fetch server | API testing |
| **Cloud monitoring** | Cloud provider specific | Production monitoring |

### Step 3.2: Create MCP Configuration

**Prompt to Claude:**
```
Create a project-specific .mcp.json configuration with these servers:
- [SERVER_1]: for [PURPOSE]
- [SERVER_2]: for [PURPOSE]
- [SERVER_3]: for [PURPOSE]

Also create:
- .mcp.json.basic (filesystem only)
- .mcp.json.template (for team members)
```

**Standard .mcp.json Template:**
```json
{
  "mcpServers": {
    "filesystem": {
      "command": "npx",
      "args": [
        "-y",
        "@modelcontextprotocol/server-filesystem",
        "/absolute/path/to/project"
      ],
      "env": {}
    },
    "aws": {
      "command": "uvx",
      "args": ["awslabs.aws-api-mcp-server@latest"],
      "env": {
        "AWS_REGION": "us-east-1",
        "AWS_PROFILE": "project-profile"
      }
    }
  }
}
```

### Step 3.3: Test MCP Servers

**Prompt to Claude:**
```
Test all configured MCP servers and create a test results document:
1. Test each server connection
2. Verify permissions
3. Document what each server can do
4. Create troubleshooting guide
```

**Deliverable:** `docs/MCP_CONNECTION_TEST_RESULTS.md`

---

## Phase 4: Core Documentation

### Step 4.1: Create README.md

**Prompt to Claude:**
```
Create a comprehensive README.md that includes:
- Project status badge/overview
- Quick start guide
- Installation instructions
- Project structure explanation
- MCP server setup
- Usage examples
- Documentation links
- Contributing guidelines
```

**README Sections:**
1. Project title and description
2. Current status (with badges if applicable)
3. Quick start guide
4. Prerequisites
5. Installation steps
6. Project structure
7. Configuration
8. Usage/examples
9. Documentation links
10. Contributing
11. License
12. Support/contact

### Step 4.2: Create CLAUDE.md (Project Rules)

**Prompt to Claude:**
```
Create a CLAUDE.md file with project-specific rules for Claude Code:
- Project overview
- File organization rules
- Coding standards
- Documentation requirements
- MCP server usage guidelines
- Commit message format
- Testing requirements
```

**Template:**
```markdown
# Project: [PROJECT_NAME]

## Overview
[Brief description]

## Rules
- Always [RULE_1]
- Never [RULE_2]
- When [CONDITION], do [ACTION]

## Project Structure
[Explain folder organization]

## Key Files to Maintain
- [FILE_1] - [PURPOSE]
- [FILE_2] - [PURPOSE]

## When Working on This Project
1. [GUIDELINE_1]
2. [GUIDELINE_2]
```

### Step 4.3: Create ROADMAP.md

**Prompt to Claude:**
```
Create a project roadmap with:
- Current status
- Completed phases
- Immediate priorities (this week)
- Short-term goals (this month)
- Medium-term goals (3 months)
- Long-term vision (6+ months)
- Decision points
- Key metrics to track
```

---

## Phase 5: Automation Scripts

### Step 5.1: Identify Needed Scripts

**Common Scripts by Project Type:**

**Web Application:**
- `setup.sh` - Initial environment setup
- `dev.sh` - Start development server
- `test.sh` - Run test suite
- `build.sh` - Production build
- `deploy.sh` - Deployment automation

**Infrastructure Project:**
- `setup.sh` - Infrastructure provisioning
- `backup.sh` - Backup automation
- `restore.sh` - Restore from backup
- `monitor.sh` - Health monitoring
- `deploy.sh` - Deployment automation

**Data Pipeline:**
- `setup.sh` - Pipeline setup
- `validate.sh` - Data validation
- `run.sh` - Execute pipeline
- `monitor.sh` - Pipeline monitoring
- `cleanup.sh` - Data cleanup

### Step 5.2: Create Scripts

**Prompt to Claude:**
```
Create the following automation scripts for this project:
1. setup.sh - [DESCRIPTION]
2. [SCRIPT_NAME] - [DESCRIPTION]
3. [SCRIPT_NAME] - [DESCRIPTION]

Requirements:
- Error handling
- Logging
- Color-coded output
- Help text
- Safety checks
```

**Script Template:**
```bash
#!/bin/bash
#
# Script Name
# Description of what this script does
#
# Usage: ./script-name.sh [options]
#

set -e  # Exit on error

# Colors
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m'

# Functions
log_info() { echo -e "${GREEN}[INFO]${NC} $1"; }
log_warn() { echo -e "${YELLOW}[WARN]${NC} $1"; }
log_error() { echo -e "${RED}[ERROR]${NC} $1"; }

# Main script logic
log_info "Starting script..."

# [SCRIPT LOGIC HERE]

log_info "Script completed successfully!"
```

---

## Phase 6: Project Organization & Cleanup

### Step 6.1: Review and Organize

**Prompt to Claude:**
```
Review the entire project structure and:
1. Identify any redundant files
2. Suggest better organization
3. Ensure all documentation cross-references are correct
4. Verify .gitignore is comprehensive
5. Check for any sensitive data
6. Organize scripts into logical groups
```

### Step 6.2: Create Quick Reference

**Prompt to Claude:**
```
Create a QUICK_START.md with:
- Essential commands
- Common workflows
- Troubleshooting quick fixes
- Links to detailed docs
```

### Step 6.3: Documentation Cross-Linking

**Ensure all docs link to each other:**
- README.md → All other docs
- Each doc → README.md and related docs
- Consistent link format
- No broken links

---

## Phase 7: Testing & Verification

### Step 7.1: Create Testing Checklist

**Prompt to Claude:**
```
Create a project verification checklist:
- [ ] All MCP servers tested
- [ ] All scripts executable and working
- [ ] All documentation links valid
- [ ] .gitignore covers all sensitive files
- [ ] README.md is comprehensive
- [ ] ROADMAP.md has clear priorities
- [ ] All automation working
- [ ] Project structure organized
```

### Step 7.2: Run MCP Tests

**Prompt to Claude:**
```
Test all MCP servers and document:
1. Connection status
2. Available operations
3. Test results
4. Any issues found
5. Troubleshooting steps
```

**Deliverable:** `docs/MCP_CONNECTION_TEST_RESULTS.md`

---

## Phase 8: Final Documentation

### Step 8.1: Create PROJECT_STATUS.md

**Prompt to Claude:**
```
Create a PROJECT_STATUS.md documenting:
- Current state of the project
- What's been completed
- What's working
- What's pending
- Known issues
- Next steps
```

### Step 8.2: Create WORK_COMPLETED.md

**For each major milestone, document:**
```
Create a WORK_COMPLETED_[DATE].md with:
- Summary of what was accomplished
- Changes made
- Files created/updated
- Test results
- Before/after comparisons
- Next actions
```

---

## Prompt Templates for Each Phase

### Starting a New Project

```
I'm starting a new project: [PROJECT_NAME]

Purpose: [DESCRIPTION]
Tech stack: [LIST]
Infrastructure: [DETAILS]

Please initialize this project using the Project Initialization Framework:
1. Create PROJECT_OVERVIEW.md
2. Suggest optimal folder structure
3. Recommend MCP servers
4. Set up initial documentation
5. Create automation scripts
6. Organize for efficiency

Let's start with Phase 1: Project Discovery & Planning.
```

### MCP Server Setup

```
Configure MCP servers for this project:

Project type: [TYPE]
Needs:
- [NEED_1] (e.g., file management)
- [NEED_2] (e.g., AWS EC2 management)
- [NEED_3] (e.g., Docker containers)

Create:
1. .mcp.json with appropriate servers
2. .mcp.json.basic (filesystem only)
3. .mcp.json.template (for team)
4. MCP_SETUP.md documentation

Then test all connections.
```

### Documentation Creation

```
Create comprehensive documentation for [PROJECT_NAME]:

1. README.md - Main entry point
2. SETUP_GUIDE.md - Step-by-step setup
3. ARCHITECTURE.md - Technical design
4. ROADMAP.md - Project timeline
5. CLAUDE.md - Project rules
6. TROUBLESHOOTING.md - Common issues

Ensure all docs are:
- Cross-linked
- Up-to-date
- Well-organized
- Easy to navigate
```

### Script Creation

```
Create automation scripts for this project:

Project type: [TYPE]
Infrastructure: [DETAILS]

Required scripts:
1. setup.sh - [WHAT IT DOES]
2. deploy.sh - [WHAT IT DOES]
3. backup.sh - [WHAT IT DOES]
4. monitor.sh - [WHAT IT DOES]

Requirements:
- Error handling
- Color-coded output
- Logging
- Help text
- Safety checks
```

### Project Organization

```
Review and organize this project:

1. Check for redundant files
2. Verify folder structure efficiency
3. Ensure documentation is complete
4. Test all automation scripts
5. Verify MCP servers working
6. Create PROJECT_STATUS.md
7. Update README.md with current state

Then create a summary of what's been completed.
```

---

## Best Practices Learned

### From n8n Project Success

1. **MCP Servers**
   - Start with filesystem (always needed)
   - Add infrastructure-specific servers (AWS, Docker, etc)
   - Test thoroughly before proceeding
   - Remove non-applicable servers
   - Document actual vs. planned setup

2. **Documentation**
   - Create comprehensive README first
   - Document actual state, not aspirations
   - Keep docs organized in /docs folder
   - Cross-link everything
   - Update as you go, not at the end

3. **Scripts**
   - Create automation early
   - Test scripts immediately
   - Use color-coded output
   - Include error handling
   - Add comprehensive logging

4. **Organization**
   - Use consistent folder structure
   - Move technical docs to /docs
   - Keep root clean
   - Remove redundant files
   - Update cross-references

5. **Version Control**
   - Comprehensive .gitignore from day one
   - Never commit secrets
   - Commit MCP configs (if no secrets)
   - Regular commits with clear messages

6. **Testing**
   - Test MCP servers immediately
   - Verify data persistence
   - Document test results
   - Create verification reports

---

## Project Type Templates

### Infrastructure Project (like n8n)

**MCP Servers:**
- ✅ Filesystem
- ✅ AWS/GCP/Azure
- ⚠️ Docker (if applicable)
- ⚠️ Database (if applicable)

**Key Scripts:**
- setup.sh
- backup.sh
- restore.sh
- monitor.sh
- deploy.sh

**Documentation:**
- ACTUAL_SERVER_SETUP.md
- ARCHITECTURE.md
- TROUBLESHOOTING.md
- DATA_PERSISTENCE_VERIFIED.md

### Web Application Project

**MCP Servers:**
- ✅ Filesystem
- ✅ GitHub
- ⚠️ Database server
- ⚠️ Cloud provider (if deployed)

**Key Scripts:**
- dev.sh
- build.sh
- test.sh
- deploy.sh

**Documentation:**
- API_REFERENCE.md
- COMPONENT_GUIDE.md
- DEPLOYMENT.md

### Data Pipeline Project

**MCP Servers:**
- ✅ Filesystem
- ✅ Cloud storage (S3, GCS)
- ✅ Database server
- ⚠️ Docker (if containerized)

**Key Scripts:**
- validate.sh
- run.sh
- monitor.sh
- cleanup.sh

**Documentation:**
- DATA_SCHEMA.md
- PIPELINE_ARCHITECTURE.md
- MONITORING.md

---

## Customization Guidelines

### Adapting This Framework

1. **Assess Project Complexity**
   - Small project: Use simplified version
   - Medium project: Use standard framework
   - Large project: Add additional phases

2. **Choose Relevant Sections**
   - Not all projects need all scripts
   - Select MCP servers based on actual needs
   - Skip sections not applicable

3. **Team Considerations**
   - More documentation for team projects
   - Clear onboarding guides
   - Shared MCP configuration templates

4. **Add Project-Specific Sections**
   - Security requirements
   - Compliance needs
   - Performance benchmarks
   - Custom workflows

---

## Success Metrics

A well-initialized project should have:

- [ ] Clear, comprehensive README.md
- [ ] All necessary MCP servers configured and tested
- [ ] Logical, organized folder structure
- [ ] Comprehensive documentation
- [ ] Working automation scripts
- [ ] No redundant or outdated files
- [ ] Proper .gitignore (no secrets committed)
- [ ] Clear roadmap and priorities
- [ ] Documented current state
- [ ] Easy onboarding for new contributors

---

## Example: Using This Framework

**Starting a new API project:**

```
I'm starting a new REST API project called "UserAuth API" for user authentication.

Tech stack: Node.js, Express, PostgreSQL, JWT
Infrastructure: AWS EC2, RDS
Purpose: Provide authentication endpoints for multiple apps

Please use the Project Initialization Framework to set this up properly.
Start with Phase 1.
```

**Claude will then:**
1. Create PROJECT_OVERVIEW.md
2. Suggest folder structure for Node.js API
3. Recommend MCP servers (filesystem, AWS, postgres)
4. Create initial documentation
5. Set up automation scripts
6. Test everything
7. Create status report

---

## Maintenance

### Keeping Projects Organized

**Weekly:**
- Update ROADMAP.md with progress
- Review and archive completed tasks
- Update documentation if changes made

**Monthly:**
- Review folder structure efficiency
- Clean up temporary files
- Update MCP server configurations if needed
- Review automation scripts

**Quarterly:**
- Major documentation review
- Refactor if needed
- Update framework based on lessons learned

---

## Version History

**v1.0** (November 16, 2025)
- Initial framework based on n8n project
- Complete phase-by-phase guide
- Prompt templates included
- Best practices documented

**Future Improvements:**
- Add more project type templates
- Include CI/CD integration
- Add team collaboration guidelines
- Create video walkthroughs

---

## Related Resources

### Internal Resources
- [n8n Project Example](README.md)
- [WORK_COMPLETED_Nov16.md](WORK_COMPLETED_Nov16.md) - Real example
- [PROJECT_STATUS.md](PROJECT_STATUS.md) - Status template example

### MCP & Claude Code
- [MCP Documentation](https://modelcontextprotocol.io/)
- [Claude Code Documentation](https://code.claude.com/docs)
- [MCP Server Registry](https://github.com/modelcontextprotocol/servers)
- [Claude Code MCP Guide](https://code.claude.com/docs/en/guides/mcp)

### AWS Resources
- [AWS CLI Reference](https://docs.aws.amazon.com/cli/latest/reference/)
- [AWS EC2 Documentation](https://docs.aws.amazon.com/ec2/)
- [AWS EC2 Best Practices](https://docs.aws.amazon.com/ec2/latest/userguide/ec2-best-practices.html)
- [AWS Security Groups](https://docs.aws.amazon.com/vpc/latest/userguide/VPC_SecurityGroups.html)
- [AWS Systems Manager](https://docs.aws.amazon.com/systems-manager/)
- [AWS CloudWatch](https://docs.aws.amazon.com/cloudwatch/)

### Infrastructure & DevOps
- [Docker Documentation](https://docs.docker.com/)
- [nginx Documentation](https://nginx.org/en/docs/)
- [Let's Encrypt Documentation](https://letsencrypt.org/docs/)
- [Certbot User Guide](https://eff-certbot.readthedocs.io/)

### Development Tools
- [Git Best Practices](https://git-scm.com/book/en/v2)
- [Bash Scripting Guide](https://www.gnu.org/software/bash/manual/)
- [systemd Documentation](https://www.freedesktop.org/software/systemd/man/)

---

**Framework Author:** Claude (based on successful n8n project)
**Last Updated:** November 16, 2025
**Status:** Production Ready
**License:** Free to use and adapt for any project
