import 'package:flutter/cupertino.dart';
import 'package:hngx_cv_app/data/cv_model.dart';

class CvNotifier {
  ValueNotifier<CvModel> myCv = ValueNotifier(CvModel.me());

  // CvModel myCv = CvModel.me();
  void updateMyCv(CvModel cv) {
    myCv.value = cv;
  }
}
