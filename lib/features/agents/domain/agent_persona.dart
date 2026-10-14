class AgentPersona {
  final String id;
  final String name;
  final String role;
  final String modelId;
  final String description;
  final List<String> tools;
  final int accentHex;
  final double successRate;

  const AgentPersona({
    required this.id,
    required this.name,
    required this.role,
    required this.modelId,
    required this.description,
    required this.tools,
    required this.accentHex,
    required this.successRate,
  });
}
