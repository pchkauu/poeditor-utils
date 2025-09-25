sealed class POEditorConfig {
  String get baseURL => 'https://api.poeditor.com/v2/';

  String get apiToken;

  Set<String> get projectIDs;

  const POEditorConfig();
}

final class POEditorConfigProduction extends POEditorConfig {
  @override
  String get apiToken => const String.fromEnvironment(
    'POEDITOR_API_TOKEN',
  );

  @override
  Set<String> get projectIDs => Set.from(
    const String.fromEnvironment('POEDITOR_PROJECT_IDS').split(','),
  );

  const POEditorConfigProduction();
}
