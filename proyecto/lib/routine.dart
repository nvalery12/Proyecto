class Routine {
  Routine({
    this.id,
    this.name,
    this.secT,
    this.minT,
    this.secRest,
    this.minRest,
    this.secRound,
    this.minRound,
    this.sets,
    this.exercise,
  });

  int id;
  String name;
  int secT;
  int minT;
  int secRest;
  int minRest;
  int secRound;
  int minRound;
  int sets;
  int exercise;

  factory Routine.fromMap(Map<String, dynamic> json) => Routine(
        id: json["id"],
        name: json["name"],
        secT: json["secT"],
        minT: json["minT"],
        secRest: json["secRest"],
        minRest: json["minRest"],
        secRound: json["secRound"],
        minRound: json["minRound"],
        sets: json["sets"],
        exercise: json["exercise"],
      );

  Map<String, dynamic> toMap() => {
        "id": this.id,
        "name": this.name,
        "secT": this.secT,
        "minT": this.minT,
        "secRest": this.secRest,
        "minRest": this.minRest,
        "secRound": this.secRound,
        "minRound": this.minRound,
        "sets": this.sets,
        "exercise": this.exercise,
      };
}
