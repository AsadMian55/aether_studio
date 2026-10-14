import '../domain/agent_persona.dart';

class AgentCatalogData {
  const AgentCatalogData._();

  static const List<AgentPersona> defaultAgents = [
    AgentPersona(
      id: 'ag_architect',
      name: 'Systems Architect',
      role: 'Distributed Systems & Clean Flutter Architecture',
      modelId: 'aether-omni-4.5',
      description:
          'Reviews module boundaries, state management patterns, and zero-jank rendering pipelines.',
      tools: ['AST Analyzer', 'Benchmark Runner', 'Git Diff Inspector'],
      accentHex: 0xFF06B6D4,
      successRate: 99.4,
    ),
    AgentPersona(
      id: 'ag_security',
      name: 'Sentinel Auditor',
      role: 'Zero-Trust Security & Cryptography Specialist',
      modelId: 'aether-reasoner-r2',
      description:
          'Audits OAuth flows, API key storage, and SQL/NoSQL injection vectors across client and edge.',
      tools: ['CVE Scanner', 'Secret Detector', 'TLS Inspector'],
      accentHex: 0xFF8B5CF6,
      successRate: 98.9,
    ),
    AgentPersona(
      id: 'ag_quant',
      name: 'Tensor Optimizer',
      role: 'On-Device Quantization & Shader Profiling',
      modelId: 'aether-coder-32b',
      description:
          'Profiles Metal/Vulkan compute shaders, KV-cache memory footprints, and GGUF quantization.',
      tools: ['Memory Profiler', 'Shader Compiler', 'Latency Probe'],
      accentHex: 0xFF10B981,
      successRate: 97.8,
    ),
    AgentPersona(
      id: 'ag_research',
      name: 'Deep Synthesis Agent',
      role: 'Multi-Hop Citation & Literature Synthesizer',
      modelId: 'aether-omni-4.5',
      description:
          'Executes parallel web and arXiv queries, cross-verifies claims, and builds grounded reports.',
      tools: ['ArXiv Search', 'Semantic Scholar', 'Citation Verifier'],
      accentHex: 0xFFF59E0B,
      successRate: 99.1,
    ),
  ];
}
