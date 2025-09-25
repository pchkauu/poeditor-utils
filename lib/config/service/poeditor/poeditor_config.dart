sealed class POEditorConfig {
  String get apiKey;

  Set<String> get projectIDs;

  const POEditorConfig();
}

final class POEditorConfigProduction extends POEditorConfig {
  @override
  String get apiKey => const String.fromEnvironment(
    'POEDITOR_API_KEY',
  );

  @override
  Set<String> get projectIDs => Set.from(
    const String.fromEnvironment('POEDITOR_PROJECT_IDS').split(','),
  );

  const POEditorConfigProduction();
}
