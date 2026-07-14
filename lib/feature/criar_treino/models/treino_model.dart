class TreinoModel {
  final String name;
  final int interval;
  final List<dynamic> exercises;

  TreinoModel({
    required this.name,
    required this.interval,
    required this.exercises,
  });

  Map<String, dynamic> toJson() => {
    'name': name,
    'interval': interval,
    'exercises': exercises,
  };

  factory TreinoModel.fromJson(Map<String, dynamic> json) {
    return TreinoModel(
      name: json['name'],
      interval: json['interval'],
      exercises: json['exercises'],
    );
  }
}
