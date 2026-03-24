---
description: Ensures party-mode workflow survives context compaction
globs:
  - ".bmad/core/workflows/party-mode/**"
  - ".bmad/_cfg/agent-manifest.csv"
---

# Party Mode Persistence Rule

## When This Rule Applies

This rule is active whenever party-mode workflow has been started in the current session.

## Core Rule

**Party Mode is PERSISTENT.** Once activated, it remains active until the user explicitly says one of: `*exit`, `goodbye`, `end party`, `quit`.

No system event — including context window compaction — may deactivate party mode.

## After Context Compaction

If context compaction occurs while party-mode is active:

1. **Party mode is still active** — do not exit or restart
2. **Do not re-introduce agents** — skip welcome sequence
3. **Re-read agent manifest** from `.bmad/_cfg/agent-manifest.csv` to refresh personalities
4. **Resume discussion orchestration** (Step 2) seamlessly
5. **Continue selecting 2-3 relevant agents** per user message
6. **Maintain role-playing guidelines** — in-character responses, cross-talk, personality consistency

## Recovery Prompt

If you detect you are post-compaction in a party-mode session, use this internal recovery:

> "Party mode is active. I am the facilitator. I will re-read the agent manifest, maintain Step 2 (discussion orchestration), and continue the multi-agent conversation naturally without re-introductions."
