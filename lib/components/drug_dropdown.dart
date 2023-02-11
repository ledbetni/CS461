import 'package:flutter/material.dart';
import 'package:vet_app/lib.dart';

final List<Drug> drugList = [
  Drug(1, 'Acepromazine'),
  Drug(2, 'Alfaxalone'),
  Drug(3, 'Atropine'),
  Drug(4, 'Azaperone'),
  Drug(5, 'Buprenorphine')
];

class DrugDropdownButton extends StatefulWidget {
  const DrugDropdownButton({super.key});

  @override
  State<DrugDropdownButton> createState() => _DrugDropdownButtonState();
}

class _DrugDropdownButtonState extends State<DrugDropdownButton> {
  Drug? dropdownValue = drugList.first;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            side: BorderSide(
                width: 1.0, style: BorderStyle.solid, color: Colors.indigo),
            borderRadius: BorderRadius.all(Radius.circular(5.0)),
          )),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 0.0),
        child: DropdownButton<Drug>(
          value: dropdownValue,
          icon: const Icon(Icons.keyboard_arrow_down),
          elevation: 0,
          isExpanded: true,
          hint: Text("Select a Drug"),
          onChanged: (Drug? value) {
            setState(() {
              dropdownValue = value;
              //print(value?.name);
            });
          },
          items: drugList.map<DropdownMenuItem<Drug>>((Drug value) {
            return DropdownMenuItem(
              value: value,
              child: Text(value.name),
            );
          }).toList(),
        ),
      ),
    );
  }
}
