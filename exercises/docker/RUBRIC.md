# Grading Rubric: Terraform Docker Challenge

**Total Points: 20**

---

## Core Requirements (14 points)

| Requirement | Points | Criteria |
|-------------|--------|----------|
| Provider configured | 2 | Docker provider block present with valid host config |
| Network created | 2 | `docker_network` resource creates `challenge-net` |
| Nginx container | 2 | Container runs, uses correct image, attached to network |
| Redis container | 2 | Container runs, uses correct image, attached to network |
| Port exposure | 2 | Nginx accessible on specified external port |
| Variables used | 2 | All 3 required variables defined and used |
| Outputs defined | 2 | All 3 required outputs present and functional |

---

## Code Quality (4 points)

| Criteria | Points |
|----------|--------|
| File organization | 1 | Separate files for main/variables/outputs |
| Code comments | 1 | Key blocks explained |
| Naming conventions | 1 | Consistent, descriptive resource names |
| Working solution | 1 | `terraform apply` succeeds without errors |

---

## Stretch Goals (Bonus - up to 4 points)

| Goal | Points |
|------|--------|
| Local-exec provisioner | 1 |
| Image tag variable | 1 |
| Count for multiple nginx | 1 |
| Container labels | 1 |

---

## Scoring Guide

| Score | Grade | Notes |
|-------|-------|-------|
| 18-20+ | A | Excellent - completed with quality and possibly stretch goals |
| 15-17 | B | Good - all requirements met, minor issues |
| 12-14 | C | Satisfactory - mostly working, some gaps |
| 9-11 | D | Needs improvement - significant issues |
| 0-8 | F | Incomplete - did not meet minimum requirements |

---

## Quick Check Commands

```bash
# Verify resources
terraform state list
# Should show 5 resources:
# docker_network.challenge_net
# docker_image.nginx
# docker_image.redis
# docker_container.nginx
# docker_container.redis

# Verify containers running
docker ps --format "table {{.Names}}\t{{.Image}}\t{{.Ports}}"

# Verify network
docker network inspect challenge-net

# Verify nginx responds
curl -s localhost:8080 | head -5

# Verify outputs
terraform output
```
