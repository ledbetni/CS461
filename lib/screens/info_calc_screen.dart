import 'package:flutter/material.dart';
import 'package:vet_app/lib.dart';

class InfoCalcScreen extends StatelessWidget {
  const InfoCalcScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //final animal = ModalRoute.of(context)!.settings.arguments as Animal;

    return Scaffold(
        appBar: AppBar(
          title: Text("Calculator Instructions"),
        ),
        body: Column(
          children: [
            // Text(
            //   "Calculator Instructions: \n",
            //   style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
            // ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                  'Multiply the concentration by the dose to get the correct dosage for an Animal/Drug combination\n'),
            ),
            Text(
              'Example: Dog/Trazadone - 100kg\n',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
                'Dose 1: 10.00 - 14.00\nConcentration: 50 mg/capsule\nMethod of Administration: PO\nNotes: No notes for this dosage\n'),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                  'In the above example, a Dog weighing 100kgs would receive 10-14 50mg capsules of Trazadone. This is a dosage of 500-700 mg\n'),
            ),
            Text('Example 2: Dog/Trazadone - 100kg\n',
                style: TextStyle(fontWeight: FontWeight.bold)),
            Text(
                'Dose 2: 5.00 - 7.00\nConcentration: 100 mg/capsule\nMethod of Administration: PO\nNotes: No notes for this dosage\n'),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                  'In the above example, a Dog weighing 100kgs would recieve 5-7 100mg capsules of Trazadone. This is also a dosage of 500-700 mg'),
            )
          ],
        ));
  }
}
