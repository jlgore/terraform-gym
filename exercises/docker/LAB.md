# Terraform Challenge: Container Deployment

**Duration:** 30-45 minutes  
**Difficulty:** Intermediate  
**Provider:** Docker (new to you!)

---

## Scenario

Your team is evaluating Terraform for container orchestration. Before committing to a solution, your lead wants to see if you can figure out a new provider on your own using only the official documentation.

You've never used the Terraform Docker provider before. Time to learn.

---

## Your Mission

Deploy a simple two-container application stack using Docker and Terraform.

### Requirements

| # | Requirement |
|---|-------------|
| 1 | Configure the Docker provider |
| 2 | Create a Docker network named `challenge-net` |
| 3 | Deploy an `nginx:alpine` container connected to that network |
| 4 | Deploy a `redis:alpine` container connected to that network |
| 5 | Expose nginx on an external port (your choice) |
| 6 | Use **variables** for: nginx container name, redis container name, nginx external port |
| 7 | Create **outputs** for: network name, nginx container ID, URL to access nginx |

### File Structure

Your solution should have this structure:

```
.
├── main.tf          # Provider config and resources
├── variables.tf     # Variable definitions
├── outputs.tf       # Output definitions
└── terraform.tfvars # (optional) Variable values
```

---

## Validation Checklist

Before calling it done, verify:

- [ ] `terraform init` completes successfully
- [ ] `terraform validate` shows no errors
- [ ] `terraform plan` shows exactly **4 resources** (2 images + 1 network + 2 containers... wait, count again!)
- [ ] `terraform apply` succeeds
- [ ] `docker ps` shows both containers running
- [ ] `docker network ls` shows your network
- [ ] `curl localhost:<your-port>` returns the nginx welcome page
- [ ] `terraform output` displays all three outputs

---

## Resources

Your only external resource:

**Terraform Docker Provider Documentation**  
https://registry.terraform.io/providers/kreuzwerker/docker/latest/docs

Useful pages:
- Provider configuration
- `docker_network` resource
- `docker_image` resource
- `docker_container` resource

---

## Rules of Engagement

1. **No AI assistance** - The goal is learning to read docs and figure things out
2. **Struggle first** - Try for at least 10 minutes before asking for help
3. **Ask questions** - If truly stuck, ask your instructor (not for answers, but for hints)
4. **Comment your code** - Explain what each block does

---

## Hints (Open Only If Stuck)

<details>
<summary>Hint 1: Provider Block</summary>

The Docker provider needs to know how to connect to Docker. On Linux, it typically uses the Unix socket. Check the provider docs for the `host` argument.

</details>

<details>
<summary>Hint 2: Image vs Container</summary>

You might need to pull images before you can create containers from them. There's a resource for that.

</details>

<details>
<summary>Hint 3: Container Networking</summary>

Containers need to be explicitly attached to networks. Look for a `networks_advanced` block in the container resource docs.

</details>

<details>
<summary>Hint 4: Port Mapping</summary>

Exposing ports requires a `ports` block inside the container resource. You need both `internal` and `external` port values.

</details>

---

## Stretch Goals (If You Finish Early)

1. Add a `local-exec` provisioner that runs `curl` against nginx after creation
2. Add a variable for the nginx image tag (default to `alpine`)
3. Create a second nginx container for "high availability" using `count`
4. Add labels to your containers with metadata (team, environment, etc.)

---

## Cleanup

When finished:

```bash
terraform destroy
```

Verify with:

```bash
docker ps
docker network ls
```

---

## Submission

Show your instructor:

1. `terraform plan` output
2. `terraform output` results  
3. `curl localhost:<port>` response
4. Your code (they may ask you to explain it)

---

Good luck. Read the docs. You've got this.
