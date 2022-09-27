import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../ViewModels/ViewModel.dart';

class EmployList extends StatelessWidget {
  EmployList({Key? key}) : super(key: key);

  final controller = Get.put(ViewModel());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // backgroundColor: Colors.grey,
        appBar: AppBar(
          backgroundColor: Colors.blueAccent,
          title: Text("Employs List"),
          elevation: 0,
        ),
        body: GetBuilder(
          init: controller,
          initState: (state) {
            controller.initGet();
          },
          builder: (auth) {
            return employTable();
          },
        )
    );
  }

  employTable() {
    return ListView.builder(
      // outer ListView
      itemCount: controller.arrModelEmploy.length,
      itemBuilder: (_, index) {
        final arrEmploy = controller.arrModelEmploy[index].employ!;

        return Column(
          children: [
            Container(
              color: Colors.blueAccent,
              alignment: Alignment.center,
              child: Text(
                controller.arrModelEmploy[index].domain.toString(),
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white
                ),
              ),
            ),
            ListView.separated(
                // inner ListView
                shrinkWrap: true,
                // 1st add
                physics: ClampingScrollPhysics(),
                // 2nd add
                itemCount: arrEmploy.length,
                padding:
                    EdgeInsets.only(top: 10, bottom: 10, left: 20, right: 20),
                separatorBuilder: (context, index) {
                  return Container(
                    height: 1,
                    color: Colors.red,
                    margin: EdgeInsets.only(top: 10, bottom: 10),
                  );
                },
                itemBuilder: (context, index) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Name:- "+arrEmploy[index].name!,
                        textAlign: TextAlign.left,
                      ),
                      Text("email:- "+arrEmploy[index].email!),
                      Text("domain: "+arrEmploy[index].domain!)
                    ],
                  );
                })
          ],
        );
      },
    );
  }
}
