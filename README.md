# Agentic Engineering — Vibe Coding vs. Agentic Engineering

A presentation about the risks and failure modes of agentic engineering, exploring the difference between "vibe coding" and disciplined agentic development.

**Author:** Christian Budde ([@MeKo-Christian](https://github.com/MeKo-Christian))

## Download the Slides

[Download the presentation (PDF)](https://github.com/MeKo-Christian/ai-workshop/releases/download/latest/presentation.pdf)

[Download the handout (PDF)](https://github.com/MeKo-Christian/ai-workshop/releases/download/latest/handout.pdf)

## Example: Candy Crush Clone

A neon-styled Candy Crush clone built with React and Vite:

**[Play Neon Candy Crush](https://meko-christian.github.io/ai-workshop/candy/)**

## Overview

This presentation explores the emerging discipline of *agentic engineering* — using AI agents in software development workflows — and contrasts it with *vibe coding*: the practice of generating code via prompts without review or understanding.

The three HU-Drop game implementations serve as a live demonstration: the same prompt, three different models, three different results. None of the code was reviewed before publishing.

## Slides

The slides are written in [Typst](https://typst.app/) and live in [slides/presentation.typ](slides/presentation.typ).

Key topics:

- What is vibe coding, and why is it appealing?
- What is agentic engineering?
- Failure modes and risks of agentic systems
- Skills, MCP (Model Context Protocol), and the AI tooling ecosystem
- The pelican benchmark as a proxy for agentic capability

## Building the Slides

### Prerequisites

Required:

- **typst** — `cargo install typst-cli` or [typst.app](https://github.com/typst/typst#installation)
- **just** — `cargo install just` or your package manager

Optional:

- **polylux2pdfpc** — speaker notes: `cargo install --git https://github.com/andreasKroepelin/polylux/ --branch release`
- **treefmt** — formatter: `cargo install treefmt`

Check your setup:

```bash
just setup
```

### Build Commands

```bash
just build               # presentation + handout
just build-presentation  # presentation only
just build-handout       # handout only
just watch               # watch for changes
just fmt                 # format files
```

## Project Structure

```
slides/         Typst presentation source
  presentation.typ
  handout.typ
  lib/            shared slide library
assets/         images used in slides
candy/          Neon Candy Crush clone (React + Vite)
```
