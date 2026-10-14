class GenerationJob {
  final String id;
  final String prompt;
  final String aspectRatio;
  final String stylePreset;
  final String modelName;
  final int steps;
  final double cfgScale;
  final int seed;
  final int accentHex;
  final String createdAt;

  const GenerationJob({
    required this.id,
    required this.prompt,
    required this.aspectRatio,
    required this.stylePreset,
    required this.modelName,
    required this.steps,
    required this.cfgScale,
    required this.seed,
    required this.accentHex,
    required this.createdAt,
  });
}
