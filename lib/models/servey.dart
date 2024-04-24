class Servey {
  String? food;
  String? employee;
  String? environment;
  String? price;
  Servey({
    this.food,
    this.employee,
    this.environment,
    this.price,
  });

  factory Servey.fromJson(Map<String, dynamic> json) {
    return Servey(
        food: json['food'],
        employee: json['employee'],
        environment: json['environment'],
        price: json['price']);
  }
}
