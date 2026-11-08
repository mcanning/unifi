# UniFi workspace

A Codex workspace for investigating UniFi Network health, Wi-Fi, VLANs and event
logs. The repository contains reusable instructions and logging tools. Local
credentials, topology, device records and recovery data live outside Git.

## Use with Codex

Open this directory as a project and ask a UniFi question, or invoke
`$unifi-network`. Investigations use read-only evidence by default; configuration
changes require a request to make that change.

To make the skill available in other projects, run this from the repository root:

```sh
mkdir -p "$HOME/.agents/skills"
ln -s "$PWD/.agents/skills/unifi-network" "$HOME/.agents/skills/unifi-network"
```

## Local setup

Keep controller addresses, API endpoints and links to local records in
`~/.config/unifi/context.md`, with the API key in `~/.config/unifi/token`. Keep
network notes, backups and exported reports under `~/.local/share/unifi`.
`XDG_CONFIG_HOME` and `XDG_DATA_HOME` override those base directories when set.

Use permissions `0700` for the private directories and `0600` for credentials and
private records. The repository's Git ignore rules allow only reviewed source
files; extend that allowlist deliberately when adding reusable tools.

## Logging tools

- `audit-health.sh` reads local UniFi logging and host health. Run it only
  when that investigation is needed; its output contains private operational
  details and belongs outside Git.
- `unifi-cef.logrotate` is a log rotation example retaining 30 compressed
  CEF logs and three raw logs. Review paths and ownership against the local host
  before installing it through the host's normal maintenance workflow.

Validate the existing shell helper without running a live collection:

```sh
bash -n audit-health.sh
shellcheck audit-health.sh
```
