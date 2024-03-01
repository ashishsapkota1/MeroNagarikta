import 'dart:core';

class Nagarikta {
  String? name;
  String? dateOfBirth;
  String? permanentAddressDistrict;
  String? placeOfBirthDistrict;
  String? citizenshipNumber;
  String? issuingDistrict;
  String? gender;
  String? placeOfBirthWard;
  String? permanentAddressWard;
  String? fatherName;
  String? motherName;
  String? spouseName;
  String? permanentAddressNagarpalika;
  String? placeOfBirthNagarpalika;
  String? type;
  String? nameOfOfficer;
  String? dateofissue;

  Nagarikta({
    this.name,
    this.dateOfBirth,
    this.permanentAddressDistrict,
    this.placeOfBirthDistrict,
    this.citizenshipNumber,
    this.issuingDistrict,
    this.gender,
    this.placeOfBirthWard,
    this.permanentAddressWard,
    this.fatherName,
    this.motherName,
    this.spouseName,
    this.permanentAddressNagarpalika,
    this.placeOfBirthNagarpalika,
    this.type,
    this.nameOfOfficer,
    this.dateofissue,
  });

  factory Nagarikta.fromMap(Map<String, dynamic> map) {
    return Nagarikta(
      name: map['name'],
      dateOfBirth: map['dateOfBirth'],
      permanentAddressDistrict: map['permanentAddressDistrict'],
      placeOfBirthDistrict: map['placeOfBirthDistrict'],
      citizenshipNumber: map['citizenshipNumber'],
      issuingDistrict: map['issuingDistrict'],
      gender: map['gender'],
      placeOfBirthWard: map['placeOfBirthWard'],
      permanentAddressWard: map['permanentAddressWard'],
      fatherName: map['fatherName'],
      motherName: map['motherName'],
      spouseName: map['spouseName'],
      permanentAddressNagarpalika: map['permanentAddressNagarpalika'],
      placeOfBirthNagarpalika: map['placeOfBirthNagarpalika'],
      type: map['type'],
      nameOfOfficer: map['nameOfOfficer'],
      dateofissue: map['dateofissue'],
      //   remaining map from response
    );
  }
}
