class NotasModel {
  NotasModel(
      {this.nota10 = 0,
      this.nota100 = 0,
      this.nota2 = 0,
      this.nota20 = 0,
      this.nota200 = 0,
      this.nota5 = 0,
      this.nota50 = 0,
      this.resto = 0});
  int nota2 = 0;
  int nota5 = 0;
  int nota10 = 0;
  int nota20 = 0;
  int nota50 = 0;
  int nota100 = 0;
  int nota200 = 0;
  int resto = 0;

  @override
  String toString() {
    return "(notas2: $nota2, nota5: $nota5, nota10: $nota10, nota20: $nota20, nota50: $nota50, nota100: $nota100, nota200: $nota200)";
  }
}
