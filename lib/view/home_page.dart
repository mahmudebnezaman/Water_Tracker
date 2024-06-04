import 'package:flutter/material.dart';
import 'package:water_tracker/consts/background_container.dart';
import 'package:water_tracker/consts/consumed_time.dart';
import 'package:water_tracker/view/widgets/consumed_water_history.dart';
import 'package:water_tracker/view/widgets/custom_appbar.dart';
import 'package:water_tracker/view/widgets/water_amount_changer_button.dart';
import 'package:water_tracker/view/widgets/water_intake_target.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int standardGlassSize = 175;
  int standardAmountOfWaterRequirement = 3700;
  List<ConsumedTime> consumedTimeList = [];
  int totalWaterConsumed = 0;

  double progressPercentage = 0.0;
  int numberOfGlass = 1;
  int drinkAmount = 0;

  @override
  void initState() {
    numberOfGlass = 1;
    drinkAmount = standardGlassSize;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context: context, title: widget.title),
      body: BackgroundWidget(
        child: Column(
          children: [
            WaterIntakeTarget(
              progressPercentage: progressPercentage,
              drinkAmount: drinkAmount,
              standardAmountOfWaterRequirement: standardAmountOfWaterRequirement,
              totalWaterConsumed: totalWaterConsumed,
              onTap: calculateProgress,
            ),
            WaterAmountChangerButton(
              decreaseFunction: decreaseFunctionality,
              increaseFunction: increaseFunctionality,
              numberOfGlass: numberOfGlass,
            ),
            const Divider(),
            ConsumedWaterHistory(
              waterIntakeHistory: consumedTimeList.reversed.toList(),
            ),
          ],
        ),
      ),
    );
  }

  void increaseFunctionality() {
    numberOfGlass++;
    drinkAmount = standardGlassSize * numberOfGlass;
    setState(() {});
  }

  void decreaseFunctionality() {
    if (numberOfGlass > 1) {
      numberOfGlass--;
      drinkAmount = standardGlassSize * numberOfGlass;
      setState(() {});
    }
  }

  void addWaterConsume() {
    ConsumedTime consumedTime = ConsumedTime(
      time: DateTime.now(),
      waterAmount: drinkAmount,
    );
    consumedTimeList.add(consumedTime);
  }

  void calculateProgress() {
    addWaterConsume();
    totalWaterConsumed += drinkAmount;

    progressPercentage = totalWaterConsumed / standardAmountOfWaterRequirement;
    if (progressPercentage > 1){
      progressPercentage = 1;
    }

    numberOfGlass = 1;
    drinkAmount = standardGlassSize;
    setState(() {});
  }
}
