


import '../../appointment/application/model.dart';
import '../../list_doctor/application/model.dart';


class CancelAppointment {
   Doctor doctor;
  Patient patient;
  DateTime appointmentDateTime;

  CancelAppointment(this.doctor, this.patient, this.appointmentDateTime);
  

  @override
  String toString() {
    return 'Appointment{doctor: $doctor, patient: $patient, appointmentDateTime: $appointmentDateTime}';
  }
}

List<CancelAppointment> cancledAppoinmentsList = [
  CancelAppointment(
        Doctor("Dr. Adif Rahaman", "Cardiology", "+8801362i2384", "LabAid Hospital", "Dhaka Medcial Collage", "2014", "239882394398"),

      Patient("Fahad", 28, "Male", "+880123892389"),
      DateTime.now().add(Duration(days: 3))),
  CancelAppointment(
        Doctor("Dr. Adif Rahaman", "Cardiology", "+8801362i2384", "LabAid Hospital", "Dhaka Medcial Collage", "2014", "239882394398"),

      Patient("Fahad", 28, "Male", "+880123892389"),
      DateTime.now().add(Duration(days: 3))),
  CancelAppointment(
     Doctor("Dr. Adif Rahaman", "Cardiology", "+8801362i2384", "LabAid Hospital", "Dhaka Medcial Collage", "2014", "239882394398"),

      Patient("Fahad", 28, "Male", "+880123892389"),
      DateTime.now().add(Duration(days: 3))),
  CancelAppointment(
        Doctor("Dr. Adif Rahaman", "Cardiology", "+8801362i2384", "LabAid Hospital", "Dhaka Medcial Collage", "2014", "239882394398"),

      Patient("Fahad", 28, "Male", "+880123892389"),
      DateTime.now().add(Duration(days: 3))),
  CancelAppointment(
       Doctor("Dr. Adif Rahaman", "Cardiology", "+8801362i2384", "LabAid Hospital", "Dhaka Medcial Collage", "2014", "239882394398"),

      Patient("Fahad", 28, "Male", "+880123892389"),
      DateTime.now().add(Duration(days: 3))),
];
