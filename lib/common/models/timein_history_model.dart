class TimeInHistoryModel {
  final String type;
  final String name;
  final String project;
  final DateTime timein;
  final DateTime timeout;

  TimeInHistoryModel({
    required this.type,
    required this.name,
    required this.project,
    required this.timein,
    required this.timeout,
  });

  factory TimeInHistoryModel.fromJson(Map<String, dynamic> json) => TimeInHistoryModel(
        type: json["type"],
        name: json["name"],
        project: json["project"],
        timein: DateTime.parse(json["timein"]),
        timeout: DateTime.parse(json["timeout"]),
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "name": name,
        "project": project,
        "timein": timein.toIso8601String(),
        "timeout": timeout.toIso8601String(),
      };
}
