import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:major_project/res/space.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import '../model/nagarikta.dart';
import 'package:path/path.dart' as path;
import '../repository/repo.dart';
import '../utils/utils.dart';

class Result extends StatefulWidget {
  final File? frontImage;
  final File? backImage;

  const Result({super.key, required this.frontImage, required this.backImage});

  @override
  State<Result> createState() => _ResultState();
}

class _ResultState extends State<Result> {
  Repository repository = Repository();
  TextEditingController nameController = TextEditingController();
  TextEditingController dateOfBirthController = TextEditingController();
  TextEditingController permanentAddressDistrictController =
      TextEditingController();
  TextEditingController placeOfBirthDistrictController =
      TextEditingController();
  TextEditingController citizenshipNumberController = TextEditingController();
  TextEditingController issuingDistrictController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  TextEditingController placeOfBirthWardController = TextEditingController();
  TextEditingController permanentAddressWardController =
      TextEditingController();
  TextEditingController fatherNameController = TextEditingController();
  TextEditingController motherNameController = TextEditingController();
  TextEditingController spouseNameController = TextEditingController();
  TextEditingController permanentAddressNagarpalikaController =
      TextEditingController();
  TextEditingController placeOfBirthNagarpalikaController =
      TextEditingController();
  TextEditingController typeController = TextEditingController();
  TextEditingController nameOfOfficerController = TextEditingController();
  TextEditingController dateofissueController = TextEditingController();

  bool _loading = false;

  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
    nameOfOfficerController.dispose();
    dateofissueController.dispose();
    dateOfBirthController.dispose();
    fatherNameController.dispose();
    motherNameController.dispose();
    spouseNameController.dispose();
    citizenshipNumberController.dispose();
    permanentAddressDistrictController.dispose();
    permanentAddressWardController.dispose();
    permanentAddressNagarpalikaController.dispose();
    placeOfBirthDistrictController.dispose();
    placeOfBirthWardController.dispose();
    placeOfBirthNagarpalikaController.dispose();
    genderController.dispose();
    typeController.dispose();
    issuingDistrictController.dispose();

  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    uploadPhoto(widget.frontImage!, widget.backImage!);
  }

  String returnText(String encoded) {
    return jsonDecode('"$encoded"');
  }

  Future<void> uploadPhoto(File front, File back) async {
    setState(() {
      _loading = true;
    });
    try {
      List<int> frontBytes = await front.readAsBytes();
      String frontFileName = path.basename(front.path);
      String frontExt = path.extension(frontFileName);
      String base64Front =
          '${frontExt.split('.')[1]};base64,${base64Encode(frontBytes)}';

      List<int> backBytes = await back.readAsBytes();
      String backFileName = path.basename(back.path);
      String backExt = path.extension(backFileName);
      String base64Back =
          '${backExt.split('.')[1]};base64,${base64Encode(backBytes)}';

      var data =
          jsonEncode({'front_image': base64Front, 'back_image': base64Back});
      Nagarikta? response = await repository.uploadApi(data);
      if(response != null) {
        setState(() {
          issuingDistrictController.text =
              returnText(response.issuingDistrict ?? '');
          citizenshipNumberController.text =
              returnText(response.citizenshipNumber ?? '');
          nameController.text = returnText(response.name ?? '');
          typeController.text = returnText(response.type ?? '');
          dateOfBirthController.text = returnText(response.dateOfBirth ?? '');
          dateofissueController.text = returnText(response.dateofissue ?? '');
          fatherNameController.text = returnText(response.fatherName ?? '');
          motherNameController.text = returnText(response.motherName ?? '');
          spouseNameController.text = returnText(response.spouseName ?? '');
          nameOfOfficerController.text =
              returnText(response.nameOfOfficer ?? '');
          permanentAddressDistrictController.text =
              returnText(response.permanentAddressDistrict ?? '');
          permanentAddressNagarpalikaController.text =
              returnText(response.permanentAddressNagarpalika ?? '');
          permanentAddressWardController.text =
              returnText(response.permanentAddressWard ?? '');
          placeOfBirthDistrictController.text =
              returnText(response.placeOfBirthDistrict ?? '');
          placeOfBirthNagarpalikaController.text =
              returnText(response.placeOfBirthNagarpalika ?? '');
          placeOfBirthWardController.text =
              returnText(response.placeOfBirthWard ?? '');
          genderController.text = returnText(response.gender ?? '');
          _loading = false;
        });
      }else{
        Navigator.pop(context);
        Utils.flushBarErrorMessage('Error. Try removing card cover and retake in high contrast background', context);

      }
    } catch (e) {
      setState(() {
        _loading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        centerTitle: true,
        title: const Text('Result'),
      ),
      body: _loading
          ? Center(
              child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const CircularProgressIndicator(),
                verticalSpacing(space: 4),
                FutureBuilder<void>(
                  future: Future.delayed(const Duration(seconds: 4)),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Container(); // Empty container while waiting
                    } else {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Preprocessing Image',
                            style: TextStyle(fontSize: 18),
                          ),
                          horizontalSpacing(space: 4),
                          const Icon(
                            Icons.check_circle,
                            color: Colors.green,
                          )
                        ],
                      );
                    }
                  },
                ),
                verticalSpacing(space: 4),
                FutureBuilder<void>(
                  future: Future.delayed(const Duration(seconds: 8)),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Container(); // Empty container while waiting
                    } else {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Fetching Data',
                            style: TextStyle(fontSize: 18),
                          ),
                          horizontalSpacing(space: 4),
                          const Icon(
                            Icons.check_circle,
                            color: Colors.green,
                          )
                        ],
                      );
                    }
                  },
                ),
                verticalSpacing(space: 4),
                FutureBuilder<void>(
                  future: Future.delayed(const Duration(seconds: 13)),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Container(); // Empty container while waiting
                    } else {
                      return const Text(
                        'Almost Done!',
                        style: TextStyle(fontSize: 18),
                      );
                    }
                  },
                ),
              ],
            )) // Show loader
          : SingleChildScrollView(
              child: Column(
                children: [
                  verticalSpacing(space: 8),
                  showTextField(issuingDistrictController, 'Issuing District'),
                  verticalSpacing(space: 8),
                  showTextField(citizenshipNumberController, 'Citizenship No.'),
                  verticalSpacing(space: 8),
                  showTextField(typeController, 'Type'),
                  verticalSpacing(space: 8),
                  showTextField(nameController, 'Name'),
                  verticalSpacing(space: 8),
                  showTextField(genderController, 'Gender'),
                  verticalSpacing(space: 8),
                  showTextField(dateOfBirthController, "Date Of Birth"),
                  verticalSpacing(space: 8),
                  showTextField(
                      placeOfBirthDistrictController, 'Birth Place District'),
                  verticalSpacing(space: 8),
                  showTextField(
                      placeOfBirthNagarpalikaController, 'Na.pa/Ga.pa'),
                  verticalSpacing(space: 8),
                  showTextField(placeOfBirthWardController, 'Ward'),
                  verticalSpacing(space: 8),
                  showTextField(permanentAddressDistrictController,
                      'Permanent Address District'),
                  verticalSpacing(space: 8),
                  showTextField(
                      permanentAddressNagarpalikaController, 'Na.pa/Ga.pa'),
                  verticalSpacing(space: 8),
                  showTextField(permanentAddressWardController, 'Ward'),
                  verticalSpacing(space: 8),
                  showTextField(fatherNameController, "Father's Name"),
                  verticalSpacing(space: 8),
                  showTextField(motherNameController, "Mother's Name"),
                  verticalSpacing(space: 8),
                  showTextField(spouseNameController, "Spouse's Name"),
                  verticalSpacing(space: 8),
                  showTextField(nameOfOfficerController, 'Issuing Officer'),
                  verticalSpacing(space: 8),
                  showTextField(dateofissueController, 'Date Of Issue'),
                  verticalSpacing(space: 14),
                  SizedBox(
                    width: 200,
                    child: ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.teal)),
                        onPressed: () {
                          saveFormData();
                        },
                        child: const Text(
                          'Save',
                          style: TextStyle(fontSize: 20, color: Colors.black54),
                        )),
                  ),
                  verticalSpacing(space: 8)
                ],
              ),
            ),
    );
  }

  showTextField(TextEditingController controller, String textType) {
    return Padding(
      padding: const EdgeInsets.only(left: 8, right: 8),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
            label: Text(textType),
            hintText: textType,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
            )),
      ),
    );
  }

  void saveFormData() async{
    try {
      String formData = '';
      formData += 'IssuingDistrict: ${issuingDistrictController.text}\n';
      formData += 'CitizenshipNo: ${citizenshipNumberController.text}\n';
      formData += 'Type: ${typeController.text}\n';
      formData += 'Name: ${nameController.text}\n';
      formData += 'Gender: ${genderController.text}\n';
      formData += 'DateOfBirth: ${dateOfBirthController.text}\n';
      formData += 'Birth\'s District: ${placeOfBirthDistrictController.text}\n';
      formData +=
      'Birth\'s Nagarpalika: ${placeOfBirthNagarpalikaController.text}\n';
      formData += 'Birth\'s Ward: ${placeOfBirthWardController.text}\n';
      formData +=
      'Permanent Address District: ${permanentAddressDistrictController
          .text}\n';
      formData +=
      'Permanent Address Nagarpalika: ${permanentAddressNagarpalikaController
          .text}\n';
      formData +=
      'Permanent Address Ward: ${permanentAddressWardController.text}\n';
      formData += 'Father\'s Name: ${fatherNameController.text}\n';
      formData += 'Mother\'s Name: ${motherNameController.text}\n';
      formData += 'Spouse\'s Name: ${spouseNameController.text}\n';
      formData += 'Officer\'s Name: ${nameOfOfficerController.text}\n';
      formData += 'Date of Issue: ${dateofissueController.text}\n';

      Directory? directory = await getExternalStorageDirectory();
      String fileName =
          'form_data_${DateTime.now().millisecondsSinceEpoch}.txt';

      String filePath = '${directory?.path}/$fileName';
      File file = File(filePath);
      await file.writeAsString(formData);
      Utils.toastMessage('File saved successfully');
      Navigator.pop(context);
    }catch(e){
      Utils.toastMessage(e.toString());
    }

  }
}
