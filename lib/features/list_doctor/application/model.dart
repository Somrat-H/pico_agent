class Doctor {
  String name;
  String specialization;
  String hospitalName;
  String phoneNumber;
  String passingYear;
  String medicalCollageName;
  String registrationNumber;

  Doctor(this.name, this.specialization, this.phoneNumber, this.hospitalName,
      this.medicalCollageName, this.passingYear, this.registrationNumber);

  @override
  String toString() {
    return 'Doctor{name: $name, specialization: $specialization, phoneNumber: $phoneNumber, hopitalName: $hospitalName}';
  }
}

List<Doctor> doctorList = [
  Doctor("Dr. Adif Rahaman", "Cardiology", "+8801362i2384", "LabAid Hospital",
      "Dhaka Medcial Collage", "2014", "239882394398"),
  // Doctor("Dr. Arefin", "Gastroenterologist", "+88014565543", "LabAid Hospital",
  //     "Dhaka Medcial Collage", "2014", "239882394398"),
  // Doctor("Dr. Munna Roy", "Endocrinologist", "+8801334564", "LabAid Hospital",
  //     "Dhaka Medcial Collage", "2014", "239882394398"),
  // Doctor("Dr. Major Sinha", "Dermatologist", "+88013456786", "LabAid Hospital",
  //     "Dhaka Medcial Collage", "2014", "239882394398"),
  // Doctor("Dr. Nila Ahsan", "Ophthalmology", "+880187452384", "LabAid Hospital",
  //     "Dhaka Medcial Collage", "2014", "239882394398"),
  // Doctor("Dr. Ashraf Zadid", "Neurologist", "+880142i2384", "LabAid Hospital",
  //     "Dhaka Medcial Collage", "2014", "239882394398"),
  // Doctor("Dr. Emon Rahman", "Gynecologists", "+88016462i2384",
  //     "LabAid Hospital", "Dhaka Medcial Collage", "2014", "239882394398"),
  // Doctor("Dr. Salam Tamin", "Pediatrician", "+8801562i2384", "LabAid Hospital",
  //     "Dhaka Medcial Collage", "2014", "239882394398"),
];
