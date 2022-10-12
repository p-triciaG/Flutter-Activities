import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
/**
 * TODO: implement input to get and save picture
 */
class ImageInput extends StatefulWidget {
  const ImageInput({Key? key}) : super(key: key);

  @override
  State<ImageInput> createState() => _ImageInputState();
}

class _ImageInputState extends State<ImageInput> {
  Future getImage() async {
    try{
      return await ImagePicker().pickImage(source: ImageSource.gallery);
    } on PlatformException catch(e) {
      print('Failed: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ElevatedButton(
        onPressed: () => getImage(),
        child: Text("Teste"),
      ),
    );
  }
}