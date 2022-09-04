import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shale_app/controller/home_controller.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
        init: HomeController(),
        builder: (controller) {
          return Scaffold(
              appBar: AppBar(
                title: controller.isPlatform
                    ? const Text(
                        'IOS',
                        style: TextStyle(letterSpacing: 1.5),
                      )
                    : const Text(
                        'ANDROID',
                        style: TextStyle(letterSpacing: 1.5),
                      ),
                centerTitle: true,
                actions: [
                  controller.isPlatform
                      ? CupertinoSwitch(
                          thumbColor: Theme.of(context).primaryColor,
                          activeColor: Colors.white,
                          value: controller.isPlatform,
                          onChanged: (value) {
                            controller.platformType(value);
                          })
                      : Switch(
                          activeColor: Colors.white,
                          value: controller.isPlatform,
                          onChanged: (value) {
                            controller.platformType(value);
                          }),
                ],
              ),
              body: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        controller.isPlatform
                            ? CupertinoSlider(
                                value: controller.sliderValue,
                                onChanged: (value) {
                                  controller.onSlider(value);
                                },
                                divisions: 5,
                                min: 0.0,
                                max: 5.0,
                              )
                            : Slider(
                                divisions: 5,
                                value: controller.sliderValue,
                                min: 0,
                                max: 5,
                                onChanged: (value) {
                                  controller.onSlider(value);
                                },
                              ),
                        controller.isPlatform
                            ? CupertinoSwitch(
                                value: controller.switchValue2,
                                onChanged: (value) {
                                  controller.onSwitchTap(value);
                                })
                            : Switch(
                                // activeColor: Colors.orange,
                                value: controller.switchValue2,
                                onChanged: (value) {
                                  controller.onSwitchTap(value);
                                }),
                      ],
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Row(
                            children: [
                              Radio(
                                  value: 'Male',
                                  groupValue: controller.radioValue,
                                  onChanged: (val) {
                                    controller.radioButton(val);
                                  }),
                              const Text('Male')
                            ],
                          ),
                          Row(
                            children: [
                              Radio(
                                  value: 'Female',
                                  groupValue: controller.radioValue,
                                  onChanged: (val) {
                                    controller.radioButton(val);
                                  }),
                              const Text('Female')
                            ],
                          ),
                          Row(
                            children: [
                              Radio(
                                  value: 'Other',
                                  groupValue: controller.radioValue,
                                  onChanged: (val) {
                                    controller.radioButton(val);
                                  }),
                              const Text('Other')
                            ],
                          ),
                        ]),
                    Column(
                      children: [
                        TextButton(
                            onPressed: () {
                              _onSubmit(context, controller.sliderValue,
                                  controller.isPlatform);
                            },
                            child: const Text('Slider Value')),
                        OutlinedButton(
                            onPressed: () {
                              _onSubmit(context, controller.switchValue2,
                                  controller.isPlatform);
                            },
                            child: const Text('Switch Value')),
                        ElevatedButton(
                            onPressed: () {
                              _onSubmit(context, controller.radioValue,
                                  controller.isPlatform);
                            },
                            child: const Text('Radio Value')),
                      ],
                    )
                  ],
                ),
              ));
        });
  }

  /// show alert dialoge

  _onSubmit(BuildContext context, message, bool isPlatform) {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return isPlatform
            ? CupertinoAlertDialog(
                title: const Center(child: Text('Slider Value')),
                content: Text(
                  message.toString(),
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      color: Colors.red,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                actions: <Widget>[
                  CupertinoDialogAction(
                      child: const Text("YES"),
                      onPressed: () {
                        Navigator.of(context).pop();
                      }),
                ],
              )
            : AlertDialog(
                actionsAlignment: MainAxisAlignment.spaceAround,
                title: const Center(child: Text('Slider Value')),
                content: Text(
                  message.toString(),
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      color: Colors.red,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                actions: <Widget>[
                  ElevatedButton(
                      child: const Text('Ok'),
                      onPressed: () {
                        Navigator.of(context).pop();
                      })
                ],
              );
      },
    );
  }
}
