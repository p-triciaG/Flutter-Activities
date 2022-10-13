import 'package:flutter/material.dart';

class SearchInput extends StatelessWidget {
  TextEditingController ctrl;
  Function e;
  SearchInput(this.ctrl, this.e, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: ctrl,
      onChanged: (value) => e(),
      decoration: InputDecoration(
        hintText: "Pesquise por título ou conteúdo",
        prefixIcon: const Icon(Icons.search),
        suffixIcon: IconButton(
          icon: const Icon(Icons.clear),
          onPressed: () {
            ctrl.clear();
            e();
          },
        ),
      ),
    );
  }
}