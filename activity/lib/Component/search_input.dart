import 'package:flutter/material.dart';

class SearchInput extends StatelessWidget {
  TextEditingController ctrl;
  Function e;
  SearchInput(this.ctrl, this.e, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      verticalDirection: VerticalDirection.down,
      children: [
        ConstrainedBox(
          constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.8),
          child: Container(
            padding: const EdgeInsets.all(5),
            margin: const EdgeInsets.symmetric(vertical: 10),
            child: TextField(
              controller: ctrl,
              decoration: const InputDecoration(
                border: OutlineInputBorder()
              ),
            ),
          ),
        ),
        ElevatedButton.icon(
          onPressed: () => e(),
          icon: const Icon(
            Icons.search,
          ),
          label: const Text("")
        ),
      ],
    );
  }
}