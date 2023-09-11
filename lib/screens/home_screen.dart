import 'package:flutter/material.dart';
import 'package:hngx_cv_app/components/diagonal_widget.dart';
import 'package:hngx_cv_app/components/info_widget.dart';
import 'package:hngx_cv_app/data/cv_model.dart';
import 'package:hngx_cv_app/data/cv_notifier.dart';
import 'package:hngx_cv_app/screens/edit_cv_screen.dart';

final CvNotifier notifier = CvNotifier();

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}



class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _imageSlideInAnimation;
  late Animation<double> _opacityAnimation;

  @override
  void initState() {
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 700));
    _imageSlideInAnimation =
        Tween<Offset>(begin: const Offset(0, 2), end: const Offset(0, 0))
            .animate(CurvedAnimation(
                parent: _controller,
                curve: const Interval(0, 0.5, curve: Curves.easeIn)));
    _opacityAnimation = Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.7, 1, curve: Curves.easeIn)));
    Future.delayed(const Duration(milliseconds: 500))
        .then((value) => _controller.forward());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ValueListenableBuilder<CvModel>(
        // child: Container(),
        builder: (context, val, child) {
          return Column(
            children: [
              Expanded(
                  child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    DiagonalWidget(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                              height: 60,
                            ),
                            AnimatedBuilder(
                              animation: _opacityAnimation,
                              builder: (BuildContext context, Widget? child) {
                                return Opacity(
                                    opacity: _opacityAnimation.value,
                                    child: child!);
                              },
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Hi,',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 25),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    'I\'m ${val.fullName}',
                                    style: const TextStyle(
                                        color: Colors.white, fontSize: 30),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 50,
                            ),
                            SlideTransition(
                                position: _imageSlideInAnimation,
                                child: const Image(
                                    image: AssetImage(
                                        'assets/images/profile.png'))),
                          ],
                        ),
                      ),
                    ),
                    const InfoWidget()
                  ],
                ),
              )),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
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
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const EditCvScreen(),
                                  ));
                            },
                            child: const Center(
                                child: Text(
                                  'Update cv',
                                  style: TextStyle(fontSize: 16),
                                )))),
                  ],
                ),
              ),
            ],
          );
        },
        valueListenable: notifier.myCv,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}




