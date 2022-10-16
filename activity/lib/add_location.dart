import 'package:activity/bloc/manage_location.dart';
import 'package:activity/models/location.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter/src/foundation/key.dart';
// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';

class AddLocation extends StatefulWidget {
  const AddLocation({Key? key}) : super(key: key);

  @override
  State<AddLocation> createState() => _AddLocationState();
}

class _AddLocationState extends State<AddLocation> {
  Location newLocation = Location(imagePath: 'image/OIP.jpg');

  renderImage(String assetName){
    return ListTile(
      onTap: () => setState(() {
        newLocation.imagePath = assetName;
      }),
      leading: Radio<String>(
        value: assetName,
        groupValue: newLocation.imagePath,
        onChanged: (value) => setState(() {
          newLocation.imagePath = value!;
        }),
      ),
      horizontalTitleGap: -75,
      title: Container(
        height: 110,
        child: Image(
          image: AssetImage(
            assetName,
          )
        ),
      ),
    );
  }

  renderTextField(String name, Function onChanged, {int maxChars = 35, int maxLines = 1, bool allBorder = false, text = ""}){
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
            controller: TextEditingController(text: text),
            decoration: allBorder ? const InputDecoration(
              border: OutlineInputBorder()
            ) : InputDecoration(),
            onChanged: (value) => onChanged(value),
          ),
        ],
        crossAxisAlignment: CrossAxisAlignment.start,
      ),
      padding: const EdgeInsets.all(20),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( title: const Text("Adicionar") ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            renderTextField('Título', (String value){ newLocation.title = value; }, text: newLocation.title),
            renderTextField('Assunto', (String value){ newLocation.subject = value; }, text: newLocation.subject, maxChars: 150, maxLines: 3),
            renderTextField('Descrição', (String value){ newLocation.description = value; }, text: newLocation.description, maxChars: 0, maxLines: 5, allBorder: true),
            const Text("Escolha uma imagem",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
            )),
            const Padding(padding: EdgeInsets.all(8)),
            renderImage('image/OIP.jpg'),
            renderImage('image/PBC.jpg'),
            renderImage('image/IGE.jpg'),
            const Padding(padding: EdgeInsets.all(8)),
            ElevatedButton(
              child: const Text("Criar publicação",
                style: TextStyle( fontSize: 16, )),
              onPressed: () {
                ManageLocationBloc crLocation = BlocProvider.of<ManageLocationBloc>(context);
                crLocation.add(AddLocationEvent(newLocation));
                Navigator.pop(context);
              },
            ),
            const Padding(padding: EdgeInsets.all(8)),
          ],
        ),
      ),
    );
  }
}
