import 'package:flutter/material.dart';

class ListaLocais extends StatefulWidget {
  const ListaLocais({Key? key}) : super(key: key);

  @override
  State<ListaLocais> createState() => _ListaLocaisState();
}

class _ListaLocaisState extends State<ListaLocais> {
  List<String> img = ['image/OIP.jpg', 'image/PBC.jpg', 'image/IGE.jpg'];
  List<String> titles = [
    'Parque Nacional dos Lagos de Plitvice',
    'Parque Nacional Banff',
    'Islas Galápagos'
  ];
  final TextEditingController _search = TextEditingController();

  Widget renderTextField(BuildContext context, TextEditingController ctrl){
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
          onPressed: (){
            print(ctrl.text);
          },
          icon: const Icon(
            Icons.search,
          ),
          label: const Text("")
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> locationList = [];
    locationList.add(renderTextField(context, _search));

    for (var i = 0; i < 3; i += 1) {
      locationList.add(Location(
        titles[i % 3],
        "Esse lugar é bonito: '${titles[i % 3]}'",
        imagePath: img[i % 3],
      ));
    }

    return SingleChildScrollView(
      child: Column(
        children: locationList,
      ),
    );
  }
}

class Location extends StatelessWidget {
  final String _name;
  final String _description;
  String imagePath;

  Location(this._name, this._description,
      {this.imagePath = 'image/OIP.jpg', Key? key})
      : super(key: key);

  String resizeString(int chlen, {String? text}) {
    String temp = (text != null) ? text : _name;
    if (temp.length > chlen) {
      return "${temp.substring(0, chlen)}...";
    }
    return temp;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(color: Colors.lightGreen),
      margin: const EdgeInsets.symmetric(vertical: 5),
      child: SizedBox(
        height: 90,
        child: Row(
          children: [
            Container(
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.black,
              ),
              margin: const EdgeInsets.only(left: 4),
              height: const Size.fromWidth(120).width,
              child: ClipOval(
                child: ConstrainedBox(
                  constraints:
                      const BoxConstraints(maxHeight: 90, maxWidth: 90),
                  child: Image.asset(
                    imagePath,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              width: MediaQuery.of(context).size.width - 114,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    resizeString(20),
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedOverflowBox(size: Size.fromHeight(3.0)),
                  Text(resizeString(60, text: _description))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
