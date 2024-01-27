class ComfirmAppoinmentModel {
  final String hospitalId;
  final String drId;
  final String drName;
  final String timeSlot;
  final String schedule;
  final String paitientId;
  final String paitientName;
  final String paitientPhone;

  const ComfirmAppoinmentModel({
    required this.hospitalId,
    required this.drId,
    required this.drName,
    required this.schedule,
    required this.timeSlot,
    required this.paitientId,
    required this.paitientName,
    required this.paitientPhone,
  });

  // Convert the model to a JSON map
  Map<String, dynamic> toJson() => {
        'hospitalId': hospitalId,
        'drId': drId,
        'drName': drName,
        'timeSlot': timeSlot,
        'schedule': schedule,
        'paitientId': paitientId,
        'paitientName': paitientName,
        'paitientPhone': paitientPhone,
      };

  // Create a model instance from a JSON map
  factory ComfirmAppoinmentModel.fromJson(Map<String, dynamic> json) =>
      ComfirmAppoinmentModel(
        hospitalId: json['hospitalId'] as String,
        drId: json['drId'] as String,
        drName: json['drName'] as String,
        timeSlot: json['timeSlot'] as String,
        schedule: json['schedule'] as String,
        paitientId: json['paitientId'] as String,
        paitientName: json['paitientName'] as String,
        paitientPhone: json['paitientPhone'] as String,
      );
}