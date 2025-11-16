# Project Templates

This directory contains templates for common project documentation and tracking needs. These templates were developed based on successful patterns from real projects.

---

## Available Templates

### 📋 Documentation Templates

#### [SECRETS_REFERENCE.template.md](SECRETS_REFERENCE.template.md)
**Purpose:** Central location for all project credentials, API keys, and secrets.

**When to use:** At project start, create `config/SECRETS_REFERENCE.md` from this template.

**Key features:**
- Comprehensive secret categories
- Generation commands for new secrets
- Rotation schedule tracking
- Security best practices

**Usage:**
```bash
cp templates/SECRETS_REFERENCE.template.md config/SECRETS_REFERENCE.md
# Edit and fill in your actual secrets
# Verify it's in .gitignore!
```

---

#### [SHARED_RESOURCES.md](SHARED_RESOURCES.md)
**Purpose:** Document centralized credentials and resources shared across multiple projects.

**When to use:** Keep one copy in your central Projects folder, update as you add shared resources.

**Key features:**
- SSH key locations and usage
- AWS/cloud credentials sharing pattern
- MCP server configuration examples
- Cross-project reference guide

**Usage:**
```bash
# Keep in ~/Projects/ or similar
cp templates/SHARED_RESOURCES.md ~/Projects/SHARED_RESOURCES.md
# Update as you add shared SSH keys, AWS profiles, etc.
```

---

#### [PHASE_COMPLETION_REPORT.template.md](PHASE_COMPLETION_REPORT.template.md)
**Purpose:** Standardized format for documenting phase completions in multi-phase projects.

**When to use:** After completing each major project phase.

**Key features:**
- Task completion tracking
- Service status documentation
- Issue tracking and resolution
- Verification tests
- Resource usage metrics
- Next phase prerequisites

**Usage:**
```bash
cp templates/PHASE_COMPLETION_REPORT.template.md docs/PHASE1_COMPLETION_REPORT.md
# Fill in details as you complete the phase
```

---

#### [COST_ANALYSIS.template.md](COST_ANALYSIS.template.md)
**Purpose:** Compare architectural options with detailed cost breakdowns.

**When to use:** During planning phase when evaluating different technical approaches.

**Key features:**
- Side-by-side option comparison
- Monthly/annual cost projections
- 3-year TCO analysis
- Break-even calculations
- Risk assessment
- Optimization opportunities

**Usage:**
```bash
cp templates/COST_ANALYSIS.template.md docs/COST_ANALYSIS.md
# Fill in options and costs
# Present to stakeholders for decision
```

---

#### [DECISION_LOG.template.md](DECISION_LOG.template.md)
**Purpose:** Track significant architectural and technical decisions with full context.

**When to use:** Start at project beginning, add entries throughout project lifecycle.

**Key features:**
- Structured decision format
- Options considered with pros/cons
- Rationale documentation
- Consequences and risks
- Review schedule
- Decision status tracking

**Usage:**
```bash
cp templates/DECISION_LOG.template.md DECISION_LOG.md
# Add decisions as they're made
# Review quarterly
```

---

## Scripts

### [infrastructure-snapshot.sh](../scripts/infrastructure-snapshot.sh)
**Purpose:** Capture complete system state before starting a new project.

**When to use:** Before beginning any installation or deployment.

**Key features:**
- OS and kernel information
- CPU, memory, disk stats
- Network configuration and ports
- Installed software versions
- Docker containers and images
- Current resource usage
- Outputs both Markdown and JSON

**Usage:**
```bash
# Run on target server
./scripts/infrastructure-snapshot.sh ./docs

# Creates:
# - docs/infrastructure_snapshot_YYYYMMDD_HHMMSS.md
# - docs/infrastructure_snapshot_YYYYMMDD_HHMMSS.json
```

---

## Template Usage Patterns

### Pattern 1: New Project Initialization

```bash
# 1. Create project structure
mkdir my-project && cd my-project
mkdir -p {config,docs,scripts,templates,backups}

# 2. Copy essential templates
cp ~/Projects/00\ -\ MASTER\ PROJECT\ TEMPLATE/templates/SECRETS_REFERENCE.template.md config/SECRETS_REFERENCE.md
cp ~/Projects/00\ -\ MASTER\ PROJECT\ TEMPLATE/templates/DECISION_LOG.template.md DECISION_LOG.md

# 3. Initialize git and ensure secrets are ignored
git init
echo "config/SECRETS_REFERENCE.md" >> .gitignore

# 4. Take infrastructure snapshot if deploying to server
scp ~/Projects/00\ -\ MASTER\ PROJECT\ TEMPLATE/scripts/infrastructure-snapshot.sh server:~
ssh server './infrastructure-snapshot.sh'
scp server:infrastructure_snapshot_*.md docs/
```

### Pattern 2: Multi-Phase Project

```bash
# At start of each phase
PHASE_NUM=1
cp ~/Projects/00\ -\ MASTER\ PROJECT\ TEMPLATE/templates/PHASE_COMPLETION_REPORT.template.md \
   docs/PHASE${PHASE_NUM}_COMPLETION_REPORT.md

# Work through phase...

# At end of phase, fill in completion report
# Commit to git
git add docs/PHASE${PHASE_NUM}_COMPLETION_REPORT.md
git commit -m "Complete Phase ${PHASE_NUM}"
```

### Pattern 3: Architecture Decision

```bash
# During planning, when evaluating options
cp ~/Projects/00\ -\ MASTER\ PROJECT\ TEMPLATE/templates/COST_ANALYSIS.template.md docs/COST_ANALYSIS.md

# Fill in options and present to stakeholders
# Once decided, log in DECISION_LOG.md

# Add decision entry
cat >> DECISION_LOG.md <<EOF

## Decision 001: Architecture Approach

**Date:** $(date +%Y-%m-%d)
**Status:** Accepted
**Deciders:** Team

### Decision
Chose [Option X] based on cost analysis in docs/COST_ANALYSIS.md

### Rationale
1. [Reason from cost analysis]
2. [Reason from cost analysis]

EOF
```

---

## Best Practices

### Security
- ✅ **ALWAYS** verify `config/SECRETS_REFERENCE.md` is in `.gitignore` before adding secrets
- ✅ Keep `SHARED_RESOURCES.md` in a central location, NOT in each project
- ✅ Never commit actual secrets, only the template structure

### Documentation
- ✅ Fill in templates as you go, not all at once at the end
- ✅ Phase completion reports should be written immediately after phase completion
- ✅ Update decision log when decisions are made, not later
- ✅ Review cost analysis quarterly as circumstances change

### Maintenance
- ✅ Review decision log quarterly
- ✅ Update shared resources document when adding new SSH keys or credentials
- ✅ Take infrastructure snapshots before major changes
- ✅ Archive old completion reports but keep them accessible

---

## Customization

These templates are starting points. Feel free to:
- Add sections relevant to your specific needs
- Remove sections that don't apply
- Adjust format to match your team's preferences
- Create project-specific variants

---

## Template Evolution

These templates were developed from real project experience. As you use them:
1. Note what works well
2. Identify missing sections
3. Update the master templates
4. Share improvements back to the framework

**Last Updated:** 2025-11-16
**Based on:** Supabase installation project learnings

---

## Quick Reference

| Need to... | Use this template |
|------------|-------------------|
| Store project secrets | SECRETS_REFERENCE.template.md |
| Document shared SSH keys/AWS creds | SHARED_RESOURCES.md |
| Complete a project phase | PHASE_COMPLETION_REPORT.template.md |
| Compare architecture options | COST_ANALYSIS.template.md |
| Record important decisions | DECISION_LOG.template.md |
| Baseline infrastructure | infrastructure-snapshot.sh |

---

For questions or improvements, update the master template repository.
