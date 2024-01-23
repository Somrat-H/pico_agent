import 'package:pico_agent/model/doctor_model.dart';

class HospitalModel {
  final String id;
  final String area;
  final String name;
  final String location;
  final String phone;
  final String description;
  final String website;
  final String email;
  final String opensAt;
  final String closeAt;
  final String weekend;
  final String? image;
  final double? ratings;
  final String? ambulance;
  final String? parking;
  final String? numberofIcus;
  final List<Pathelogy> pathelogyList;
  final List<DoctorModel> drList;

  HospitalModel({
    required this.id,
    required this.name,
    required this.area,
    required this.location,
    required this.phone,
    required this.opensAt,
    required this.closeAt,
    required this.weekend,
    this.description = '',
    this.website = '',
    this.email = '',
    this.image,
    this.ratings,
    this.ambulance,
    this.numberofIcus,
    this.parking,
    this.pathelogyList = const [],
    this.drList = const [],
  });

  factory HospitalModel.fromJson( Map<String, dynamic> json) {
    return HospitalModel(
        id: json['id'] as String,
        name: json['name'] as String,
        location: json['location'] as String,
        area: json['area'] as String,
        phone: json['phone'] as String,
        description: json['description'] as String,
        website: json['website'] as String,
        email: json['email'] as String,
        opensAt: json['opensAt'] as String,
        closeAt: json['closeAt'] as String,
        weekend: json['weekend'] as String,
        image: json['image'] as String?,
        ratings: json['ratings'] as double?,
        ambulance: json['ambulance'] as String?,
        parking: json['parking'] as String?,
        numberofIcus: json['numberofIcus'] as String?,
        pathelogyList: (json['pathelogyList'] as List<dynamic>)
            .map((e) => Pathelogy.fromJson(e as Map<String, dynamic>))
            .toList(),
        drList: (json['drList'] as List<dynamic>)
            .map((e) => DoctorModel.fromJson(e as Map<String, dynamic>))
            .toList(),
      );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'location': location,
        'area': area,
        'phone': phone,
        'description': description,
        'website': website,
        'email': email,
        'opensAt': opensAt,
        'closeAt': closeAt,
        'weekend': weekend,
        'image': image,
        'ratings': ratings,
        'ambulance': ambulance,
        'parking': parking,
        'numberofIcus': numberofIcus,
        'pathelogyList': pathelogyList.map((e) => e.toJson()).toList(),
        'drList': drList.map((e) => e.toJson()).toList(),
      };
}

class Pathelogy {
  String name;
  String cost;
  String schedule;
  String timing;
  String rating;

  Pathelogy({
    required this.name,
    required this.cost,
    required this.rating,
    required this.timing,
    required this.schedule,
  });

  factory Pathelogy.fromJson(Map<String, dynamic> json) => Pathelogy(
        name: json['name'] as String,
        cost: json['cost'] as String,
        rating: json['rating'] as String,
        timing: json['timing'] as String,
        schedule: json['schedule'] as String,
      );

  Map<String, dynamic> toJson() => {
        'name': name,
        'cost': cost,
        'rating': rating,
        'timing': timing,
        'schedule': schedule,
      };
}