import 'package:flutter/material.dart';
import 'package:water_tracker/consts/strings.dart';

class WaterAmountChangerButton extends StatelessWidget {
  final VoidCallback increaseFunction;
  final VoidCallback decreaseFunction;
  final int numberOfGlass;

  const WaterAmountChangerButton({
    super.key,
    required this.decreaseFunction,
    required this.increaseFunction,
    required this.numberOfGlass,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(36.0),
          ),
          child: SizedBox(
            height: MediaQuery.sizeOf(context).height * 0.05,
            width: MediaQuery.sizeOf(context).width * 0.4,
            child: Row(
              children: [
                buildAmountChangeIconButton(
                    onTap: decreaseFunction, icon: Icons.remove_rounded),
                const VerticalDivider(),
                 Flexible(
                  flex: 3,
                  fit: FlexFit.tight,
                  child: Text(
                    '$numberOfGlass',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ),
                const VerticalDivider(),
                buildAmountChangeIconButton(
                    onTap: increaseFunction, icon: Icons.add_rounded),
              ],
            ),
          ),
        ),
        Image.asset(
          upArrowPng,
          height: 20,
        ),
        Text(
          confirmGlassNumberString,
          style: Theme.of(context).textTheme.titleSmall,
        ),
      ],
    );
  }

  Flexible buildAmountChangeIconButton({
    required onTap,
    required icon,
  }) {
    return Flexible(
      flex: 3,
      fit: FlexFit.tight,
      child: InkWell(
        customBorder: const CircleBorder(),
        onTap: onTap,
        child: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: Icon(
            icon,
          ),
        ),
      ),
    );
  }
}
