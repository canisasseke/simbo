// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:simbo_1/pages/print_page.dart';
import 'package:simbo_1/pages/recensement_step.dart';

import '../model/client.dart';

class MyListTile extends StatefulWidget {
  MyListTile(this.client, this.index, {super.key});
  Client client;
  int index;

  @override
  State<MyListTile> createState() => _MyListTileState();
}

class _MyListTileState extends State<MyListTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12.0),
      width: double.infinity,
      padding: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        color: Colors.green.shade100,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  widget.client.type,
                  style: const TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              RecensementStep(client: widget.client)));
                },
                icon: const Icon(
                  Icons.edit,
                  color: Color(0xff2f7b5f),
                ),
              ),
              IconButton(
                onPressed: () {
                  widget.client.delete();
                },
                icon: const Icon(
                  Icons.delete,
                  color: Colors.red,
                ),
              ),

              //for printed
              IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => PrintPage(
                              client: widget.client,
                            )),
                  );
                },
                icon: const Icon(
                  Icons.print,
                  color: Colors.black,
                ),
              ),
            ],
          ),
          const Divider(
            color: Colors.black,
            height: 20.0,
            thickness: 1.0,
          ),
          Text(
            widget.client.acticCom,
            style: const TextStyle(
              fontSize: 16.0,
            ),
          ),
          const Divider(
            color: Colors.black,
            height: 20.0,
            thickness: 1.0,
          ),
          Text(
            widget.client.secteur,
            style: const TextStyle(
              fontSize: 16.0,
            ),
          ),
          const Divider(
            color: Colors.black,
            height: 20.0,
            thickness: 1.0,
          ),
          Text(
            widget.client.nomCom,
            style: const TextStyle(
              fontSize: 16.0,
            ),
          ),
          const Divider(
            color: Colors.black,
            height: 20.0,
            thickness: 1.0,
          ),
          Text(
            widget.client.nom,
            style: const TextStyle(
              fontSize: 16.0,
            ),
          ),
          const Divider(
            color: Colors.black,
            height: 20.0,
            thickness: 1.0,
          ),
          Text(
            widget.client.prenom,
            style: const TextStyle(
              fontSize: 16.0,
            ),
          ),
          const Divider(
            color: Colors.black,
            height: 20.0,
            thickness: 1.0,
          ),
          Text(
            widget.client.typeContri,
            style: const TextStyle(
              fontSize: 16.0,
            ),
          ),
          const Divider(
            color: Colors.black,
            height: 20.0,
            thickness: 1.0,
          ),
          Text(
            widget.client.sexe,
            style: const TextStyle(
              fontSize: 16.0,
            ),
          ),
          const Divider(
            color: Colors.black,
            height: 20.0,
            thickness: 1.0,
          ),
          Text(
            widget.client.societe,
            style: const TextStyle(
              fontSize: 16.0,
            ),
          ),
        ],
      ),
    );
  }
}
