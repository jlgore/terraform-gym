# Terraform Challenge: Pizza Infrastructure

**Duration:** 30-45 minutes  
**Difficulty:** Intermediate  
**Provider:** Dominos Pizza (yes, really)

---

## Scenario

Your team has a tradition: when infrastructure deploys successfully, pizza arrives. Someone heard there's a Terraform provider for Dominos Pizza and wants you to prototype the "pizza pipeline."

Your mission: build the data source chain that would enable ordering pizza via Terraform. You'll query addresses, find stores, and search the menu - all through Terraform.

**IMPORTANT:** You will NOT be ordering any pizza. We're only using data sources, which are read-only. No credit cards, no charges, no delivery drivers.

---

## Your Mission

Build a Terraform configuration that queries the Dominos API to find menu items at a nearby store.

### Requirements

| # | Requirement |
|---|-------------|
| 1 | Configure the Dominos provider (no credit card needed for data sources) |
| 2 | Create a `dominos_address` data source for a delivery address |
| 3 | Create a `dominos_store` data source to find the nearest store |
| 4 | Create a `dominos_menu_item` data source to search for a menu item |
| 5 | Use **variables** for: street address, city, state, zip code, and menu search terms |
| 6 | Create **outputs** for: store ID, estimated delivery time, and matching menu items |

### File Structure

```
.
├── main.tf          # Provider config and data sources
├── variables.tf     # Variable definitions  
├── outputs.tf       # Output definitions
└── terraform.tfvars # Your test values
```

---

## Validation Checklist

Before calling it done, verify:

- [ ] `terraform init` completes successfully
- [ ] `terraform validate` shows no errors
- [ ] `terraform plan` shows **0 resources to create** (data sources don't create resources!)
- [ ] `terraform apply` succeeds (this just reads data, no pizza ordered)
- [ ] `terraform output` displays store info and menu matches
- [ ] Try different `query_string` values to find different menu items

---

## Resources

**Terraform Dominos Provider Documentation**  
https://registry.terraform.io/providers/MNThomson/dominos/latest/docs

Key pages:
- Provider configuration
- `dominos_address` data source
- `dominos_store` data source  
- `dominos_menu_item` data source

---

## Rules of Engagement

1. **No AI assistance** - The goal is learning to read docs
2. **Struggle first** - Try for 10 minutes before asking for help
3. **Use a real address** - The API validates addresses (use your school, a local business, etc.)
4. **No `dominos_order` resource** - We're not actually ordering pizza!

---

## Hints (Open Only If Stuck)

<details>
<summary>Hint 1: Provider Block</summary>

For data sources only, you just need `first_name`, `last_name`, `email_address`, and `phone_number`. These can be fake values - they're only used if you actually order. No `credit_card` block needed.

</details>

<details>
<summary>Hint 2: Data Source Chaining</summary>

The data sources feed into each other:
1. `dominos_address` outputs a `url_object`
2. `dominos_store` takes that `url_object` as input
3. `dominos_menu_item` takes the `store_id` from the store

</details>

<details>
<summary>Hint 3: Menu Search</summary>

The `query_string` is a list of strings. Each string must match somewhere in the menu item name. Try things like `["pepperoni", "large"]` or `["wings", "hot"]`.

</details>

<details>
<summary>Hint 4: Address Fields</summary>

The address data source uses `region` for state (not `state`). Check the docs for exact field names.

</details>

---

## Stretch Goals (If You Finish Early)

1. Add a `dominos_menu` data source to get the FULL menu (all 186+ items!)
2. Create an output that filters menu items under a certain price
3. Add a `locals` block to format the delivery estimate as "X minutes"
4. Use `for` expressions to output just the item names and prices

---

## Example Output

When working correctly, your output might look like:

```
store_id = "4332"
delivery_estimate = 25
menu_matches = [
  {
    code        = "P_14SCREEN"
    name        = "Large (14\") Hand Tossed Pepperoni"  
    price_cents = 1599
  },
  {
    code        = "P_12SCREEN"
    name        = "Medium (12\") Hand Tossed Pepperoni"
    price_cents = 1299
  }
]
```

---

## Fun Facts

- This provider was originally created because "if you can use Terraform to summon folks with shovels to drop a fiber line, why shouldn't you be able to summon a driver with a pizza?"
- `terraform destroy` for a pizza order "is implemented on the client side, by consuming the pizza"
- The API supports "none pizza with left beef" levels of customization, but the provider keeps it simple

---

## Cleanup

Nothing to clean up! Data sources don't create any resources.

```bash
# Optional: remove the terraform files
rm -rf .terraform .terraform.lock.hcl terraform.tfstate*
```

---

## Submission

Show your instructor:

1. `terraform output` results
2. Your code (they may ask you to explain the data source chain)
3. Try a different menu search live to show it works

---

Now go figure out how to query pizza infrastructure. No AI, just docs. You've got this. 🍕
