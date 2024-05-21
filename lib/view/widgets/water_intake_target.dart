import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:water_tracker/consts/strings.dart';

class WaterIntakeTarget extends StatelessWidget {
  final double progressPercentage;
  final int drinkAmount;
  final int totalWaterConsumed;
  final int standardAmountOfWaterRequirement;
  final VoidCallback onTap;
  const WaterIntakeTarget({
    super.key,
    required this.progressPercentage,
    required this.drinkAmount,
    required this.totalWaterConsumed,
    required this.standardAmountOfWaterRequirement,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return CircularPercentIndicator(
      progressColor: Theme.of(context).colorScheme.primary,
      backgroundColor: Theme.of(context).colorScheme.onPrimary.withOpacity(0.5),
      radius: MediaQuery.sizeOf(context).width * 0.2,
      lineWidth: 15.0,
      circularStrokeCap: CircularStrokeCap.round,
      reverse: true,
      percent: progressPercentage,
      header: Column(
        children: [
          Text(
            '$totalWaterConsumed/$standardAmountOfWaterRequirement ml',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          Text(
            dailyDrinkTrackerString,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ],
      ),
      center: InkWell(
        customBorder: const CircleBorder(),
        onTap: onTap,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Lottie.asset(
              waterLottie,
            ),
            Image.asset(
              glassPng,
              height: MediaQuery.sizeOf(context).width * 0.3,
              color: Theme.of(context).colorScheme.onPrimary,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.add_rounded,
                  color: Theme.of(context).colorScheme.onPrimary,
                  size: 40,
                ),
                SizedBox(
                  width: 50,
                  child: Text(
                    '$drinkAmount ml',
                    overflow: TextOverflow.fade,
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    style: TextStyle(
                      fontSize: Theme.of(context).textTheme.titleMedium?.fontSize,
                      color: Theme.of(context).colorScheme.onPrimary
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}