import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:menstrual_record/main.dart';
import 'package:styled_widget/styled_widget.dart';

import 'menstrual_first_logic.dart';

class MenstrualFirstPage extends GetView<MenstrualFirstLogic> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const SizedBox(),
        title: const Text('Home'),
      ),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: SafeArea(
            child: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              child: <Widget>[
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(12),
                  child: <Widget>[
                    const Text('Periodic phase'),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      height: 89,
                      child: GridView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 1,
                              mainAxisSpacing: 10,
                              childAspectRatio: 89 / 123),
                          itemCount: 3,
                          itemBuilder: (_, index) {
                            const colors = [
                              [Color(0xffffeba4), Color(0xfffff8e0)],
                              [Color(0xfffeddc4), Color(0xffffecdd)],
                              [Color(0xffffdee3), Color(0xffffedf0)]
                            ];
                            final titles = [
                              Obx(() {
                                return Text(
                                  controller.firstDate.value,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15),
                                );
                              }),
                              Obx(() {
                                return Text(
                                  controller.secondDate.value,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15),
                                );
                              }),
                              Obx(() {
                                return Text(
                                  controller.thirdDate.value,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15),
                                );
                              }),
                            ];
                            final subTitles = ['Next conception','Ovulation day', 'Next period'];
                            return Container(
                              padding: const EdgeInsets.all(12),
                              child: <Widget>[
                                titles[index],
                                const SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  subTitles[index],
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                      color: Colors.grey, fontSize: 12),
                                ),
                              ].toColumn(
                                  mainAxisAlignment:
                                  MainAxisAlignment.center),
                            ).decorated(
                                gradient:
                                LinearGradient(colors: colors[index]),
                                borderRadius: BorderRadius.circular(12));
                          }),
                    )
                  ].toColumn(
                      crossAxisAlignment: CrossAxisAlignment.start),
                ).decorated(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12)),
                const SizedBox(
                  height: 15,
                ),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(12),
                  child: <Widget>[
                    const Text('Conception probability'),
                    const SizedBox(
                      height: 12,
                    ),
                    Container(
                      width: double.infinity,
                      height: 18,
                      padding: const EdgeInsets.symmetric(horizontal: 92),
                      child: Container(
                        padding:
                        const EdgeInsets.symmetric(horizontal: 10),
                        child: <Widget>[
                          Container(
                            width: 6,
                            height: 6,
                          ).decorated(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(3)),
                          Container(
                            width: 6,
                            height: 6,
                          ).decorated(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(3)),
                        ].toRow(
                            mainAxisAlignment:
                            MainAxisAlignment.spaceBetween),
                      ).decorated(
                          color: primaryColor,
                          borderRadius: BorderRadius.circular(9)),
                    ).decorated(
                        color: const Color(0xffebebeb),
                        borderRadius: BorderRadius.circular(9)),
                    const SizedBox(
                      height: 8,
                    ),
                    <Widget>[
                      Obx(() {
                        return Text(controller.fertileStart.value);
                      }),
                      Obx(() {
                        return Text(controller.fertileEnd.value);
                      })
                    ]
                        .toRow(
                        mainAxisAlignment:
                        MainAxisAlignment.spaceBetween)
                        .marginSymmetric(horizontal: 62)
                  ].toColumn(
                      crossAxisAlignment: CrossAxisAlignment.start),
                ).decorated(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12)),
                const SizedBox(
                  height: 15,
                ),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(12),
                  child: <Widget>[
                    const Text('My cycle'),
                    const SizedBox(
                      height: 10,
                    ),
                    Obx(() {
                      return controller.list.value.isEmpty
                          ? const Center(
                        child: Text('No data'),
                      )
                          : GridView.builder(
                          physics:
                          const NeverScrollableScrollPhysics(),
                          padding: EdgeInsets.zero,
                          shrinkWrap: true,
                          gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                              mainAxisSpacing: 10,
                              crossAxisSpacing: 10,
                              childAspectRatio: 101 / 66),
                          itemCount: controller.list.length,
                          itemBuilder: (_, index) {
                            final entity = controller.list[index];
                            final contentDate = DateFormat('MM-dd')
                                .format(
                                DateTime.parse(entity.content));
                            return Container(
                              alignment: Alignment.center,
                              child: Text(contentDate),
                            ).decorated(
                                gradient: const LinearGradient(
                                    colors: [
                                      Color(0xffffdeec),
                                      Color(0xffffedf0)
                                    ],
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter),
                                borderRadius:
                                BorderRadius.circular(12));
                          });
                    })
                  ].toColumn(
                      crossAxisAlignment: CrossAxisAlignment.start),
                ).decorated(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12)),
              ].toColumn(),
            ).marginAll(15)),
      ),
    );
  }
}
