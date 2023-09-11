import 'package:flutter/material.dart';
import 'package:hngx_cv_app/data/cv_model.dart';
import 'package:hngx_cv_app/screens/home_screen.dart';

class EditCvScreen extends StatefulWidget {
  const EditCvScreen({Key? key}) : super(key: key);

  @override
  State<EditCvScreen> createState() => _EditCvScreenState();
}

class _EditCvScreenState extends State<EditCvScreen> {
  @override
  void initState() {
    updateFields();

    super.initState();
  }

  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController slackNameController = TextEditingController();
  final TextEditingController githubHandleController = TextEditingController();
  final TextEditingController bioController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Update Cv'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 16,
              ),
              const Text(
                'Full name',
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(
                height: 16,
              ),
              CustomField(
                hint: 'Update full name',
                controller: fullNameController,
              ),
              const SizedBox(
                height: 16,
              ),
              const Text(
                'Slack Name',
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(
                height: 16,
              ),
              CustomField(
                hint: 'Update slack name',
                controller: slackNameController,
              ),
              const SizedBox(
                height: 16,
              ),
              const Text(
                'Github handle',
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(
                height: 16,
              ),
              CustomField(
                hint: 'Update github handle',
                controller: githubHandleController,
              ),
              const SizedBox(
                height: 16,
              ),
              const Text(
                'Personal bio',
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(
                height: 16,
              ),
              CustomField(
                hint: 'Update personal handle',
                maxLines: 5,
                controller: bioController,
              ),
              const SizedBox(
                height: 16,
              ),
              Row(
                children: [
                  Expanded(
                      child: ElevatedButton(
                          style: TextButton.styleFrom(
                              foregroundColor: Colors.white,
                              padding: const EdgeInsets.all(16),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5)),
                              backgroundColor: Colors.black),
                          onPressed: () {
                            updateCv();
                          },
                          child: const Center(
                              child: Text(
                            'Save',
                            style: TextStyle(fontSize: 16),
                          )))),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void updateFields() {
    fullNameController.text = notifier.myCv.value.fullName;
    slackNameController.text = notifier.myCv.value.slackName;
    bioController.text = notifier.myCv.value.bio;
    githubHandleController.text = notifier.myCv.value.githubHandle;
  }

  void updateCv() {
    notifier.updateMyCv(CvModel(
        fullName: fullNameController.text,
        slackName: slackNameController.text,
        githubHandle: githubHandleController.text,
        bio: bioController.text));
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Padding(
      padding: EdgeInsets.all(1),
      child: Text(' CV Updated'),
    )));
    Navigator.pop(context);
  }
}

class CustomField extends StatelessWidget {
  final String hint;
  final TextEditingController controller;
  final int? maxLines;

  const CustomField(
      {Key? key,
      required this.hint,
      required this.controller,
       this.maxLines})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        hintText: hint,
      ),
      maxLines: maxLines,
      controller: controller,
    );
  }
}
