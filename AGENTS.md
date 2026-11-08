# UniFi workspace

This repository contains public, reusable UniFi instructions and tools. Private
configuration and records are stored outside the checkout.

- Before investigating the local network, read
  `${XDG_CONFIG_HOME:-$HOME/.config}/unifi/context.md` and follow its links to the
  relevant private notes. Historical records need current evidence before being
  treated as the running state.
- Use read-only API requests and existing local evidence for questions. Apply
  network or host configuration changes only when the user requests them.
- Keep API keys, controller addresses, topology, device identifiers, logs,
  configuration backups and generated reports outside Git. Never print tokens.
  Keep durable private findings under
  `${XDG_DATA_HOME:-$HOME/.local/share}/unifi`.
- Stage explicit reviewed files. Preserve the Git allowlist and inspect the
  staged content before committing or publishing.
- Validate changed shell tools with `bash -n` and ShellCheck. Do not run live
  collectors, installers or service restarts merely to validate source changes.
- Keep the skill concise; route to local private notes for network-specific
  context. Check skill metadata with Codex's installed skill validator after
  changing it.
