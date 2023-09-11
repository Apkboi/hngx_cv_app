class CvModel {
  String fullName;
  String slackName;
  String githubHandle;
  String bio;

  CvModel(
      {required this.fullName,
      required this.slackName,
      required this.githubHandle,
      required this.bio});

  factory CvModel.me() => CvModel(
      fullName: 'Victor Abraham',
      slackName: 'Victor Abraham',
      githubHandle: 'Apkboi',
      bio:
          'Am a Skilled and experienced mobile app developer who is depth to solving complex problems with mobile apps. I am highly skilled in JAVA,KOTLIN,FLUTTER/DART');
}
