class OurServiece {
  final String servieceName;
  final String servieceLogo;
  OurServiece({required this.servieceName, required this.servieceLogo});
}

List<OurServiece> ourServices = [
  OurServiece(servieceName: "Appointment", servieceLogo: "assets/appointment.png"),
  OurServiece(servieceName: "Cancel Appointment", servieceLogo: "assets/cancel_appointment.png"),
  OurServiece(servieceName: "Doctor List", servieceLogo: "assets/doctor_list.png"),
  OurServiece(servieceName: "Doctor Add", servieceLogo: "assets/add.png"),
  
  OurServiece(servieceName: "Report Upload", servieceLogo: "assets/upload.png"),
  OurServiece(servieceName: "Prescription Upload", servieceLogo: "assets/upload.png"),
];
