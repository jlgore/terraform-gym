# Grading Rubric: Terraform Pizza Challenge

**Total Points: 20**

---

## Core Requirements (14 points)

| Requirement | Points | Criteria |
|-------------|--------|----------|
| Provider configured | 2 | Dominos provider block with required fields (name, email, phone) |
| Address data source | 2 | `dominos_address` with street, city, region, postal_code |
| Store data source | 2 | `dominos_store` correctly references address url_object |
| Menu item data source | 2 | `dominos_menu_item` references store_id and has query_string |
| Variables used | 3 | All 5 required variables defined and used |
| Outputs defined | 3 | All 3 required outputs present and functional |

---

## Code Quality (4 points)

| Criteria | Points |
|----------|--------|
| File organization | 1 | Separate files for main/variables/outputs |
| Code comments | 1 | Key blocks explained |
| Variable descriptions | 1 | All variables have descriptions |
| Working solution | 1 | `terraform apply` succeeds and outputs display |

---

## Stretch Goals (Bonus - up to 4 points)

| Goal | Points |
|------|--------|
| Full menu data source | 1 |
| Price filtering output | 1 |
| Locals for formatting | 1 |
| For expressions in output | 1 |

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
# Verify configuration
terraform validate

# Check outputs (should show store and menu data)
terraform apply -auto-approve
terraform output

# Test different searches
terraform apply -var='menu_search=["wings"]' -auto-approve
terraform output menu_matches
```

---

## Common Issues

1. **Using `state` instead of `region`** - The address data source uses `region` for the state field
2. **query_string as string instead of list** - Must be a list: `["pepperoni"]` not `"pepperoni"`
3. **Invalid address** - The Dominos API validates addresses; use a real one
4. **Forgetting url_object vs api_object** - Store uses `url_object`, order would use `api_object`
