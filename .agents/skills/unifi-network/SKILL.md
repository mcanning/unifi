---
name: unifi-network
description: Investigate UniFi Network health, Wi-Fi, VLANs and event logs using local private context. Use for UniFi questions, troubleshooting and requested network configuration changes.
---

# UniFi Network

Resolve this skill directory's real path when accessed through a symlink. The
workspace is three parent directories above that resolved directory.
Read its ignored `local/context.md` first to locate the controller, API
endpoints, token file and relevant private records. If the local setup is
missing, ask for the controller and credential location. Keep secrets and
network-specific records out of this public skill.

Use read-only API requests and existing logs to answer questions. Apply changes
only when requested, preserving a private recovery snapshot and verifying the
result. A question or proposed plan alone does not authorize a change.

Read the token from its private file without printing it or placing its value in
command arguments or tracked files. Prefer a private header file or standard
input when passing credentials to native tools.

Use the local context's links to search historical notes by topic or date. Read
the relevant sections rather than loading the entire history. Treat saved
versions, topology and earlier findings as dated evidence; check current state
before relying on them. Do not rerun historical change scripts to investigate.

Distinguish controller health, network event logging and Protect clip backups.
Use the existing monitoring and service state for the relevant component. Avoid
restarting services or changing network settings merely to inspect them.

Summarize findings with their evidence and practical uncertainty. Save durable
network-specific findings, configuration exports and reports under the
workspace's ignored `local/` directory, updating the private context when
their locations change. Publish only reviewed, reusable instructions and tools.
