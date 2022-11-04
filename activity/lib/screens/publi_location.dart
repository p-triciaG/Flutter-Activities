import 'package:activity/bloc/manage_location.dart';
import 'package:activity/models/location.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LocationExpand extends StatelessWidget {
  final Location item;
  const LocationExpand(this.item, {Key? key}) : super(key: key);

  deletePost(BuildContext context) {
    Navigator.pop(context);
    ManageLocationBloc b = BlocProvider.of<ManageLocationBloc>(context);
    b.add(DeleteLocationEvent(item.id!));
    Navigator.pop(context, 'OK');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(item.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(item.imagePath),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Text(item.subject),
            ),
            Text(item.description),
            ElevatedButton(
              onPressed: () => showDialog<String>(
                context: context,
                builder: (BuildContext context) => AlertDialog(
                  title: const Text('Atenção'),
                  content: const Text('Você está prestes a apagar essa publicação! Deseja continuar?'),
                  actions: <Widget>[
                    TextButton(
                      onPressed: () => Navigator.pop(context, 'Cancel'),
                      child: const Text('Cancelar'),
                    ),
                    TextButton(
                      onPressed: () => deletePost(context),
                      child: const Text('Continuar'),
                    ),
                  ],
                ),
              ),
              child: const Text("Apagar publicação")
            )
          ],
        ),
      ),
    );
  }
}