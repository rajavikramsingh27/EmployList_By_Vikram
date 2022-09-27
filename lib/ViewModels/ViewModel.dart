

import 'package:get/get.dart';
import 'dart:convert';
import 'package:flutter/services.dart';
import '../Models/Employ.dart';

class ViewModel extends GetxController {
  RxList<ModelEmploy> arrModelEmploy = <ModelEmploy>[].obs;

  initGet() async {
    loadJson();
  }

  loadJson() async {
    String data = await rootBundle.loadString('JSONFile/employ.json');
    arrModelEmploy.value  = List<ModelEmploy>.from(json.decode(data).map((x) => ModelEmploy.fromJson(x)));
  }



}
