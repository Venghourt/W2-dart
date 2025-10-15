enum Skill { FLUTTER, DART, OTHER }

class Address {
  String _street;
  String _city;
  String _zipCode;

  Address(this._street, this._city, this._zipCode);

  String get street => _street;
  String get city => _city;
  String get zipCode => _zipCode;

  @override
  String toString() {
    return '$_street, $_city, $_zipCode';
  }
}

class Employee {
  final String _name;
  final double _baseSalary;
  final List<Skill> _skills;
  final Address _address;
  final int _yearsOfExperience;

  Employee(
    this._name,
    this._skills,
    this._address,
    this._yearsOfExperience, [
    this._baseSalary = 4000,
  ]);

  String get name => _name;
  List<Skill> get skills => _skills;
  Address get address => _address;
  int get yearsOfExperience => _yearsOfExperience;

  void printDetails() {
    print('Employee: $_name\nBase Salary: \$$_baseSalary\nAddress: $_address\nYears of Experience: $_yearsOfExperience');
  }

  Employee.mobileDeveloper(this._name, this._address, this._yearsOfExperience)
      : _skills = [Skill.FLUTTER, Skill.DART],
        _baseSalary = 4000;

  double computeSalary() {
    double salary = _baseSalary + (_yearsOfExperience * 2000);
    for (var skill in _skills) {
      if (skill == Skill.FLUTTER) salary += 5000;
      if (skill == Skill.DART) salary += 3000;
      if (skill == Skill.OTHER) salary += 1000;
    }
    return salary;
  }
}

void main() {
  var emp1 = Employee(
    'Sokea',
    [Skill.FLUTTER, Skill.DART],
    Address('101', 'Phnom Penh', '10001'),
    3,
  );
  emp1.printDetails();
  print('${emp1.name} salary: \$${emp1.computeSalary()}');

  var emp2 = Employee(
    'Ronan',
    [Skill.FLUTTER, Skill.OTHER],
    Address('102', 'Phnom Penh', '10001'),
    5,
  );
  emp2.printDetails();
  print('${emp2.name} salary: \$${emp2.computeSalary()}');
}
