# UniFi workspace

Public reusable tools and instructions live in Git; private records live in local/.

- Before network investigations, read local/context.md and its relevant links.
  Verify historical notes against current evidence.
- Questions use read-only requests. Apply network/host changes only when requested.
- Keep tokens, controller addresses, topology, device identifiers, logs, backups
  and generated reports outside Git. Never print tokens; save private findings
  under local/.
- Preserve the Git allowlist and stage explicit reviewed files.
- Validate changed shell tools with bash -n and ShellCheck; do not run live
  collectors, installers or restarts for source validation.
- Keep skill instructions reusable and local context private. Validate changed
  skill metadata with Codex's installed skill validator.
