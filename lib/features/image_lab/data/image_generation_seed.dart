import '../domain/generation_job.dart';

class ImageGenerationSeed {
  const ImageGenerationSeed._();

  static const List<GenerationJob> jobs = [
    GenerationJob(
      id: 'job_101',
      prompt:
          'Isometric obsidian neural supercomputer core with bioluminescent cyan fiber optics, octane render, 8k',
      aspectRatio: '16:9',
      stylePreset: 'Cybernetic Architectural',
      modelName: 'Aether Flux Pro v2.1',
      steps: 32,
      cfgScale: 6.5,
      seed: 44910284,
      accentHex: 0xFF06B6D4,
      createdAt: '2m ago',
    ),
    GenerationJob(
      id: 'job_102',
      prompt:
          'Minimalist titanium autonomous drone docked in a glass brutalist laboratory, volumetric lighting',
      aspectRatio: '1:1',
      stylePreset: 'Industrial Studio',
      modelName: 'Aether Flux Pro v2.1',
      steps: 28,
      cfgScale: 7.0,
      seed: 91827364,
      accentHex: 0xFF8B5CF6,
      createdAt: '18m ago',
    ),
    GenerationJob(
      id: 'job_103',
      prompt:
          'Abstract topological data manifold floating over dark volcanic glass, emerald and gold rim lighting',
      aspectRatio: '4:5',
      stylePreset: 'Data Sculpture',
      modelName: 'Aether Diffusion XL',
      steps: 40,
      cfgScale: 6.0,
      seed: 19283745,
      accentHex: 0xFF10B981,
      createdAt: '1h ago',
    ),
  ];
}
