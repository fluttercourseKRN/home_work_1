import 'package:flutter/material.dart';

class StandWidget extends StatelessWidget {
  const StandWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        const Text('Stand with Ukraine'),
        const SizedBox(width: 4),
        SizedBox(
          width: 30,
          height: 30,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Column(
              children: [
                Expanded(
                  child: Container(
                    color: Colors.blue,
                  ),
                ),
                Expanded(
                  child: Container(
                    color: Colors.amberAccent,
                  ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
