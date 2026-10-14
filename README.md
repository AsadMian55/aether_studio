# Aether Studio — Multimodal AI Workspace & Agent Orchestrator (Flutter UI)

A production-grade, feature-first Flutter UI architecture for a multimodal AI workspace, autonomous agent studio, neural image synthesis lab, real-time voice session interface, and node-based workflow builder.

## Architecture Overview

The codebase follows a strict **Feature-First Modular UI Architecture** inside `lib/` with **105+ Dart files** organized into independent domain modules:

```
lib/
├── main.dart
├── app/
│   ├── aether_app.dart
│   ├── navigation/
│   │   ├── app_router.dart
│   │   ├── app_routes.dart
│   │   └── workspace_shell.dart
│   └── state/
│       └── workspace_controller.dart
├── core/
│   ├── constants/
│   ├── theme/
│   ├── utils/
│   └── extensions/
├── shared/
│   ├── widgets/
│   └── models/
└── features/
    ├── chat/           # Multi-model LLM threads, reasoning blocks, citations, code canvas
    ├── agents/         # Autonomous agent persona builder, tool bindings, memory inspector
    ├── image_lab/      # Neural diffusion studio, aspect presets, sampler tuning, upscale compare
    ├── voice_live/     # Real-time duplex voice orb, waveform visualizer, live transcript
    ├── workflows/      # Node-based pipeline builder, trigger nodes, execution logs
    ├── prompt_vault/   # Categorized system prompt templates, variable interpolation
    ├── knowledge_base/ # RAG vector dataset manager, chunk inspector, embedding status
    ├── model_hub/      # Local & cloud LLM benchmarks, quantization specs, latency matrix
    ├── usage_analytics/# Token consumption telemetry, cost breakdown, latency histograms
    └── settings/       # API provider vault, appearance tuning, keyboard shortcuts
```

## Getting Started

```bash
flutter pub get
flutter run
```
