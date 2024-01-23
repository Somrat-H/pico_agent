class Patient {
  String name;
  int age;
  String gender;
  String phoneNumber;

  Patient(this.name, this.age, this.gender, this.phoneNumber);

  @override
  String toString() {
    return 'Patient{name: $name, age: $age, gender: $gender, phoneNumber: $phoneNumber}';
  }
}