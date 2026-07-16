class TreinoModel {
  final int id;
  final String name;
  final int interval;
  final List<dynamic> exercises;

  TreinoModel({
    int? id,
    required this.name,
    required this.interval,
    required this.exercises,
  }) : id = id ?? DateTime.now().microsecondsSinceEpoch;

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'interval': interval,
    'exercises': exercises,
  };

  factory TreinoModel.fromJson(Map<String, dynamic> json) {
    return TreinoModel(
      id: json['id'],
      name: json['name'],
      interval: json['interval'],
      exercises: json['exercises'],
    );
  }
}
