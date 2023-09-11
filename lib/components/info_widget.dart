import 'package:flutter/material.dart';
import 'package:hngx_cv_app/data/cv_model.dart';
import 'package:hngx_cv_app/screens/home_screen.dart';

class InfoWidget extends StatefulWidget {
  const InfoWidget({Key? key}) : super(key: key);

  @override
  State<InfoWidget> createState() => _InfoWidgetState();
}

class _InfoWidgetState extends State<InfoWidget> {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<CvModel>(
      builder: (context, val, child) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InfoItem(info: val.bio, tittle: "About me"),
              const SizedBox(
                height: 16,
              ),
              InfoItem(
                tittle: 'Full Name',
                info: val.fullName,
              ),
              const SizedBox(
                height: 16,
              ),
              InfoItem(
                tittle: 'Slack Username',
                info: val.slackName,
              ),
              const SizedBox(
                height: 16,
              ),
              InfoItem(
                tittle: 'Github handle',
                info: val.githubHandle,
              ),
              const SizedBox(
                height: 60,
              )
            ],
          ),
        );
      },
      valueListenable: notifier.myCv,
    );
  }
}

class InfoItem extends StatelessWidget {
  const InfoItem({Key? key, required this.tittle, required this.info})
      : super(key: key);
  final String tittle;
  final String info;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: Text(
            tittle,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Center(
          child: Text(
            textAlign: TextAlign.center,

            info,
            style: const TextStyle(color: Colors.grey, fontSize: 16),
          ),
        ),
      ],
    );
  }
}
