import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../common/components/prompt_button.dart';
import '../config/app_colors.dart';
import '../config/app_layout.dart';
import '../config/app_text.dart';
import '../provider/tflite_provider.dart';

class TfliteModel extends ConsumerStatefulWidget {
  TfliteModel({super.key});

  @override
  ConsumerState<TfliteModel> createState() => _TfliteModelState();
}

class _TfliteModelState extends ConsumerState<TfliteModel> {
  final String modelPath = 'assets/model/model69AiRLstM.tflite';
  List<double> inputs = [];

  void addData(double value) {
    setState(() {
      inputs.add(double.parse(value.toStringAsFixed(6)));
    });
  }

  void _showAddDataDialog(BuildContext context) {
    double minValue = 1.00000;
    double maxValue = 60.00000;
    double sliderValue = minValue + (maxValue - minValue) / 2;
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return AlertDialog(
              title: const Text(
                "Pick Value",
                style: AppText.textStyleTitle,
              ),
              content: SizedBox(
                height: MediaQuery.sizeOf(context).height * 0.08,
                child: Slider(
                  value: sliderValue,
                  min: minValue,
                  max: maxValue,
                  divisions: ((maxValue - minValue) * 1000000).toInt(),
                  label: sliderValue.toStringAsFixed(5),
                  onChanged: (double value) {
                    setState(() {
                      sliderValue = value;
                    });
                  },
                ),
              ),
              actions: <Widget>[
                TextButton(
                  child: const Text('Cancel'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                TextButton(
                  child: const Text('OK'),
                  onPressed: () {
                    addData(sliderValue);
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Air Pollution",
          style: AppText.textStyleAppBar,
          textAlign: TextAlign.center,
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              if (inputs.isNotEmpty) {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text(
                          "Reset Data",
                          style: AppText.textStyleTitle,
                        ),
                        content: const Text(
                          "Are you sure you want to reset the data?",
                          style: AppText.textStyleSubtitle,
                        ),
                        actions: <Widget>[
                          TextButton(
                            child: const Text('Cancel'),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                          TextButton(
                            child: const Text('OK'),
                            onPressed: () {
                              setState(() {
                                inputs.clear();
                              });
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      );
                    });
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("There is no data to delete."),
                  ),
                );
              }
            },
          ),
        ],
      ),
      body: Column(
        children: [
          SizedBox(
            height: height * 0.8,
            child: inputs.isEmpty
                ? const Center(
                    child: Text(
                      "No Data Available",
                      style: AppText.textStyleSubtitle,
                    ),
                  )
                : SingleChildScrollView(
                    child: Column(
                      children: <Widget>[
                        for (int i = 0; i < inputs.length; i++)
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: height * 0.08,
                              decoration: BoxDecoration(
                                borderRadius: AppLayout.borderRadiusSmall,
                                color: AppColors.primaryColor.withOpacity(0.2),
                              ),
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Center(
                                      child: Text(
                                        "Reading ${i + 1}: ${inputs[i]}",
                                        style: AppText.textStyleSubtitle,
                                      ),
                                    ),
                                    IconButton(
                                      icon: const Icon(Icons.delete),
                                      onPressed: () {
                                        setState(() {
                                          inputs.removeAt(i);
                                        });
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                AppLayout.constSpacer,
                PromptButton(
                  onPressed: () => _showAddDataDialog(context),
                  textContent: "Add Data",
                  height: height * 0.07,
                  width: width * 0.45,
                  isEnabled: true,
                  textContentColor: AppColors.secondaryTextColor,
                  isEnabledColor: AppColors.primaryColor,
                ),
                AppLayout.constSpacer,
                PromptButton(
                  onPressed: () async {
                    String result = "";
                    final tflite = await ref
                        .read(tfliteProvider.notifier)
                        .fetchTflite(inputs);
                    log('tflite: $tflite');
                    setState(() {
                      result = tflite.toString();
                      if (tflite.containsKey("prediction")) {
                        result = tflite["prediction"]!;
                      } else if (tflite.containsKey("error")) {
                        result = tflite["error"]!;
                      } else {
                        result = "Unknown error occurred";
                      }
                    });
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: const Text(
                            "Prediction Result",
                            style: AppText.textStyleTitle,
                          ),
                          content: Text(
                            result.isEmpty ? "No Result Available" : result,
                            style: AppText.textStyleSubtitle,
                          ),
                          actions: <Widget>[
                            TextButton(
                              child: const Text('OK'),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                          ],
                        );
                      },
                    );
                  },
                  textContent: 'Predict Data',
                  height: height * 0.07,
                  width: width * 0.45,
                  isEnabled: inputs.isNotEmpty,
                  textContentColor: AppColors.secondaryTextColor,
                  isEnabledColor: AppColors.primaryColor,
                ),
                AppLayout.constSpacer,
              ],
            ),
          )
        ],
      ),
    );
  }
}
