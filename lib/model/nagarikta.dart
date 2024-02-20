import 'dart:core';

class Nagarikta {
  String? name;
  String? address;
  String? doB;
  String? fatherName;
  String? motherName;
  String? dateOfIssue;
  String? spouseName;

  Nagarikta(
      {this.name,
      this.address,
      this.doB,
      this.fatherName,
      this.motherName,
      this.dateOfIssue,
      this.spouseName});


  factory Nagarikta.fromMap(Map<String, dynamic> map){
    return Nagarikta(
      name: map['name'],
      address: map['address'],
    //   remaining map from response
    );
  }
}
