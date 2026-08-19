# Next layer: data engineering workstation

The base Mac setup should stay relatively generic. Add data-platform tooling only when a project needs it.

Potential next layer:

- dbt adapter(s) for the warehouse in use
- AWS CLI
- Terraform
- Node.js
- Docker / Compose workloads through OrbStack
- Airflow or Astronomer tooling
- database CLIs
- cloud credential helpers

## Recommendation

Prefer project-scoped dependencies over globally installing every data tool.

For Python projects:

```bash
uv init
uv add <dependencies>
uv sync
```

For standalone Python CLI utilities:

```bash
uv tool install <tool>
```

This keeps the machine-level environment smaller and makes projects reproducible.

## dbt state workflow

The shell aliases assume a state directory such as:

```text
prod_dbt_artifacts/
└── manifest.json
```

Example:

```bash
dbt run \
  --defer \
  --state prod_dbt_artifacts \
  --favor-state \
  -s my_model
```

Equivalent alias:

```bash
dbt_run_defer_favor_state my_model
```

For a new employer/project, configure its artifact URL in `~/.zshrc.local`:

```bash
export DBT_MANIFEST_URL="https://your-artifact-location/manifest.json"
```

Then:

```bash
get_dbt_manifest
```
