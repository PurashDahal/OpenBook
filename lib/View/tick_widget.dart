import 'package:flutter/material.dart';

class TickWidget extends StatefulWidget {
  const TickWidget({super.key});

  @override
  State<TickWidget> createState() => _TickWidgetState();
}

class _TickWidgetState extends State<TickWidget> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          activeColor: Colors.green,
          value: isChecked,
          onChanged: (bool? value) {
            setState(() {
              isChecked = value!;
            });
          },
        ),
        // Text(
        //   'Remember me',
        //   style: GoogleFonts.getFont(
        //     'Lato',
        //     fontSize: 12,
        //   ),
        // ),
      ],
    );
  }
}
