import 'package:flutter/material.dart';

class SubmitDisplay extends StatefulWidget {
  final Function(String) onSubmit; // Change type to Function(String)
  const SubmitDisplay({Key? key, required this.onSubmit}) : super(key: key); // Fix constructor

  @override
  State<SubmitDisplay> createState() => _SubmitDisplayState();
}

class _SubmitDisplayState extends State<SubmitDisplay> {
  TextEditingController ideaTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextField(
            controller: ideaTextController,
          ),
        ),
        IconButton(
          onPressed: () {
            widget.onSubmit(ideaTextController.text); // Pass text to callback function
          },
          icon: const Icon(Icons.send),
        )
      ],
    );
  }
}
