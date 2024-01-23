import '../../list_doctor/application/model.dart';
import 'model.dart';

class Appointment {
  Doctor doctor;
  Patient patient;
  DateTime appointmentDateTime;

  Appointment(this.doctor, this.patient, this.appointmentDateTime);

  @override
  String toString() {
    return 'Appointment{doctor: $doctor, patient: $patient, appointmentDateTime: $appointmentDateTime}';
  }
}

List<Appointment> appointmentList = [
  Appointment(doctorList[0], Patient("Fahad", 28, "Male", "+880123892389"),
      DateTime.now().add(Duration(days: 3))),
  Appointment(doctorList[0], Patient("Fahad", 28, "Male", "+880123892389"),
      DateTime.now().add(Duration(days: 3))),
  Appointment(doctorList[0], Patient("Fahad", 28, "Male", "+880123892389"),
      DateTime.now().add(Duration(days: 3))),
  Appointment(doctorList[0], Patient("Fahad", 28, "Male", "+880123892389"),
      DateTime.now().add(Duration(days: 3))),
  Appointment(doctorList[0], Patient("Fahad", 28, "Male", "+880123892389"),
      DateTime.now().add(Duration(days: 3))),
];
