import 'package:flutter/material.dart';

class DiagonalWidget extends StatelessWidget {
  const DiagonalWidget({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      clipper: CustomClipPath(),
      child: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/asthetic_bg.jpeg'),
                fit: BoxFit.cover)),
        width: MediaQuery.of(context).size.width,
        // color: Colors.black,
        child: child,
      ),
    );
  }
}

class CustomClipPath extends CustomClipper<Path> {
  var radius = 10.0;

  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height * 0.7);
    path.lineTo(
        size.width - size.width * 0.16, size.height - size.height * 0.05);
    path.quadraticBezierTo(
        size.width, size.height, size.width, size.height - size.height * 0.08);
    path.lineTo(size.width, size.height - size.height * 0.1);
    path.lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}