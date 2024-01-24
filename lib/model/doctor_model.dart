import 'package:pico_agent/common/constant.dart';

class DoctorModel {
  String? id;
  String drImage;
  String drName;
  String dept;
  String experince;
  String passingYear;
  String registrationNumber;
  String about;
  String totalSeenPatient;
  String rating;
  String fee;
  List<String> schedule = [];
  List<String> availableSlot = [];

  DoctorModel({
    this.id,
    required this.about,
    required this.availableSlot,
    required this.dept,
    required this.passingYear,
    required this.registrationNumber,
    required this.drImage,
    required this.drName,
    required this.experince,
    required this.rating,
    required this.totalSeenPatient,
    required this.fee,
    required this.schedule,
  });

  factory DoctorModel.fromJson(Map<String, dynamic> json) => DoctorModel(
        id: json['id'],
        passingYear: json['passingYear'] as String,
        registrationNumber: json['registrationNumber'],
        about: json['about'] as String,
        availableSlot: (json['availableSlot'] as List<dynamic>).cast<String>(),
        dept: json['dept'] as String,
        drImage: json['drImage'] as String,
        drName: json['drName'] as String,
        experince: json['experince'] as String,
        rating: json['rating'] as String,
        totalSeenPatient: json['totalSeenPatient'] as String,
        fee: json['fee'] as String,
        schedule: (json['schedule'] as List<dynamic>).cast<String>(),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'passingYear': passingYear,
        'registrationNumber': registrationNumber,
        'about': about,
        'availableSlot': availableSlot,
        'dept': dept,
        'drImage': drImage,
        'drName': drName,
        'experince': experince,
        'rating': rating,
        'totalSeenPatient': totalSeenPatient,
        'fee': fee,
        'schedule': schedule,
      };
}
