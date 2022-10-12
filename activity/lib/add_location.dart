import 'package:activity/Component/image_input.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/src/foundation/key.dart';
// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';

class AddLocation extends StatefulWidget {
  const AddLocation({Key? key}) : super(key: key);

  @override
  State<AddLocation> createState() => _AddLocationState();
}

class _AddLocationState extends State<AddLocation> {

  renderTextField(String name, {int maxChars = 35, int maxLines = 1, bool allBorder = false}){
    return Container(
      child: Column(
        children: [
          Text(name, style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),),
          TextField(
            maxLength: (maxChars > 0) ? maxChars : null,
            maxLines: maxLines,
            controller: TextEditingController(),
            decoration: allBorder ? const InputDecoration(
              border: OutlineInputBorder()
            ) : InputDecoration(),
          ),
        ],
        crossAxisAlignment: CrossAxisAlignment.start,
      ),
      padding: const EdgeInsets.all(20),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          renderTextField('Título'),
          renderTextField('Assunto', maxChars: 150, maxLines: 3),
          renderTextField('Descrição', maxChars: 0, maxLines: 5, allBorder: true),
          
        ],
      ),
    );
  }
}
