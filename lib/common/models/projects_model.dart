class ProjectsModel {
  final String project;
  final String client;
  final String site;
  final String category;
  final String storageLocation;
  final String stage;
  final String status;
  final DateTime updated;

  ProjectsModel({
    required this.project,
    required this.client,
    required this.site,
    required this.category,
    required this.storageLocation,
    required this.stage,
    required this.status,
    required this.updated,
  });

  factory ProjectsModel.fromJson(Map<String, dynamic> json) => ProjectsModel(
        project: json["project"],
        client: json["client"],
        site: json["site"],
        category: json["category"],
        storageLocation: json["storageLocation"],
        stage: json["stage"],
        status: json["status"],
        updated: DateTime.parse(json["updated"]),
      );

  Map<String, dynamic> toJson() => {
        "project": project,
        "client": client,
        "site": site,
        "category": category,
        "storageLocation": storageLocation,
        "stage": stage,
        "status": status,
        "updated": updated.toIso8601String(),
      };
}
