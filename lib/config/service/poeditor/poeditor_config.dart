import 'package:equatable/equatable.dart';

final class POEditorConfig extends Equatable {
  final String baseURL;

  final String apiToken;

  final Set<String> projectIDs;

  const POEditorConfig._({
    required this.apiToken,
    required this.projectIDs,
    required this.baseURL,
  });

  factory POEditorConfig.fromJson(Map<String, dynamic> json) {
    final baseURL = json['baseURL'] as String?;
    if (baseURL == null) {
      throw Exception('service.poeditor.baseURL (string) is required');
    }

    final apiToken = json['apiToken'] as String?;
    if (apiToken == null) {
      throw Exception('service.poeditor.apiToken (string) is required');
    }

    final projectIDs = (json['projectIDs'] as List<dynamic>?)?.cast<String>().toSet();
    if (projectIDs == null) {
      throw Exception('service.poeditor.projectIDs (list of strings) is required');
    }

    return POEditorConfig._(
      baseURL: 'https://api.poeditor.com/v2/',
      apiToken: apiToken,
      projectIDs: projectIDs,
    );
  }

  @override
  List<Object?> get props => [apiToken, projectIDs, baseURL];

  @override
  String toString() {
    return 'POEditorConfig\n'
        '\t\t\tapiToken: $apiToken,\n'
        '\t\t\tprojectIDs: $projectIDs,\n'
        '\t\t\tbaseURL: $baseURL\n';
  }
}
