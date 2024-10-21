enum Skill {
  FLUTTER,
  DART,
  OTHER,
}

class Address {
  final String _street;
  final String _city;
  final String _zipCode;

  Address(this._street, this._city, this._zipCode);

  String get street => _street;
  String get city => _city;
  String get zipCode => _zipCode;
}

class Employee {
  // Q1: Add new attributes for skills, address, yearsOfExperience, and baseSalary
  final String _name;
  final List<Skill> _skills;
  final Address _address;
  final int _yearsOfExperience;
  final double _baseSalary;

  // Q2: Update constructor to initialize the new attributes
  Employee({
    required String name,
    required List<Skill> skills,
    required Address address,
    required int yearsOfExperience,
    double baseSalary = 40000,
  })  : _name = name,
        _skills = skills,
        _address = address,
        _yearsOfExperience = yearsOfExperience,
        _baseSalary = baseSalary;

  // Q2: Named constructor
  Employee.mobileDeveloper({
    required String name,
    required Address address,
    required int yearsOfExperience,
    double baseSalary = 40000,
  })  : _name = name,
        _skills = [Skill.FLUTTER, Skill.DART],
        _address = address,
        _yearsOfExperience = yearsOfExperience,
        _baseSalary = baseSalary;

  Employee.backendDeveloper({
    required String name,
    required Address address,
    required int yearsOfExperience,
    double baseSalary = 40000,
  })  : _name = name,
        _skills = [Skill.DART, Skill.OTHER],
        _address = address,
        _yearsOfExperience = yearsOfExperience,
        _baseSalary = baseSalary;

  Employee.frontendDeveloper({
    required String name,
    required Address address,
    required int yearsOfExperience,
    double baseSalary = 40000,
  })  : _name = name,
        _skills = [Skill.FLUTTER, Skill.OTHER],
        _address = address,
        _yearsOfExperience = yearsOfExperience,
        _baseSalary = baseSalary;

  Employee.fullStackDeveloper({
    required String name,
    required Address address,
    required int yearsOfExperience,
    double baseSalary = 40000,
  })  : _name = name,
        _skills = [Skill.FLUTTER, Skill.DART, Skill.OTHER],
        _address = address,
        _yearsOfExperience = yearsOfExperience,
        _baseSalary = baseSalary;

  // Q3: Provide getter methods for accessing the private attributes
  String get name => _name;
  List<Skill> get skills => _skills;
  Address get address => _address;
  int get yearsOfExperience => _yearsOfExperience;
  double get baseSalary => _baseSalary;

  // Q4: Method to compute salary of the employee based on rules
  double computeSalary() {
    double salary = _baseSalary;

    salary += _yearsOfExperience * 2000;

    for (var skill in _skills) {
      switch (skill) {
        case Skill.FLUTTER:
          salary += 5000;
          break;
        case Skill.DART:
          salary += 3000;
          break;
        case Skill.OTHER:
          salary += 1000;
          break;
      }
    }
    return salary;
  }
}

void main() {
  Address address1 = Address("CADT", "PP", "12345");

  Employee mobileDev = Employee.mobileDeveloper(
    name: "Yuth Kota",
    address: address1,
    yearsOfExperience: 4,
  );

  Employee backendDev = Employee.backendDeveloper(
    name: "Seth Sinara",
    address: address1,
    yearsOfExperience: 6,
  );

  Employee frontendDev = Employee.frontendDeveloper(
    name: "Rith Kh",
    address: address1,
    yearsOfExperience: 3,
  );

  Employee fullStackDev = Employee.fullStackDeveloper(
    name: "Pay Panha",
    address: address1,
    yearsOfExperience: 8,
  );

  print(
      "Mobile Developer: ${mobileDev.name}, Salary: \$${mobileDev.computeSalary()}");
  print(
      "Backend Developer: ${backendDev.name}, Salary: \$${backendDev.computeSalary()}");
  print(
      "Frontend Developer: ${frontendDev.name}, Salary: \$${frontendDev.computeSalary()}");
  print(
      "Full Stack Developer: ${fullStackDev.name}, Salary: \$${fullStackDev.computeSalary()}");
}
