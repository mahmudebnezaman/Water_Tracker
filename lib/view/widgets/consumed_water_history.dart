import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:water_tracker/consts/strings.dart';

class ConsumedWaterHistory extends StatelessWidget {
  final List waterIntakeHistory;
  const ConsumedWaterHistory({
    super.key,
    required this.waterIntakeHistory,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  trackRecordString,
                  style: const TextStyle(
                    color: Colors.green,
                    fontSize: 16,
                  ),
                ),
                const Icon(Icons.history),
              ],
            ),
          ),
          trackRecord(data: waterIntakeHistory),
        ],
      ),
    );
  }
}

Widget trackRecord({required data}) {
  return Expanded(
    child: ListView.builder(
      shrinkWrap: true,
      itemCount: data.length,
      itemBuilder: (context, index) => Card(
        child: ListTile(
          leading: Image.asset(
            waterPng,
            height: 40,
          ),
          trailing: Text(
            '${data[index].waterAmount}ml',
            style: Theme.of(context).textTheme.titleSmall,
          ),
          title: Text(
            DateFormat.jm().format(
              data[index].time,
            ),
          ),
          subtitle: Text(
            DateFormat.MMMMd().add_y().format(
                data[index].time,
                ),
          ),
        ),
      ),
    ),
  );
}
