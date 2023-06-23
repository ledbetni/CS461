import 'package:flutter/material.dart';
import 'package:vet_app/lib.dart';

class AnimalDropdownButton extends StatefulWidget {
  final AnimalList animalList;
  const AnimalDropdownButton({super.key, required this.animalList});

  @override
  State<AnimalDropdownButton> createState() => _AnimalDropdownButtonState();
}

class _AnimalDropdownButtonState extends State<AnimalDropdownButton> {
  Animal? dropdownValue;

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
        child: DropdownButton<Animal>(
          value: dropdownValue,
          icon: const Icon(Icons.keyboard_arrow_down),
          elevation: 0,
          isExpanded: true,
          hint: Text("Select an Animal"),
          onChanged: (Animal? value) {
            setState(() {
              dropdownValue = value;
            });
          },
          items: widget.animalList.entries
              .map<DropdownMenuItem<Animal>>((Animal value) {
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
