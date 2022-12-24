import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:simbo_1/pages/my_list_tile.dart';
import 'package:simbo_1/pages/recensement_step.dart';

import '../model/client.dart';

class Liste extends StatelessWidget {
  const Liste({super.key});

  @override
  Widget build(BuildContext context) {
    // final user = FirebaseAuth.instance.currentUser!;

    return Scaffold(
      backgroundColor: const Color(0xffeaeae8),
      appBar: AppBar(
        backgroundColor: const Color(0xff2f7b5f),
        toolbarHeight: 80,
        toolbarOpacity: 0.5,
        title: const Text('LISTES DES RECENSEMENTS'),
        titleTextStyle: const TextStyle(
          fontFamily: 'Segoe UI',
          fontSize: 20,
          letterSpacing: -0.24,
          fontWeight: FontWeight.w700,
        ),
        // centerTitle: true,
        //   leading: IconButton(
        //       onPressed: () => FirebaseAuth.instance.signOut(),
        //       icon: Image.asset('assets/images/deconnection.png')),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xff2f7b5f),
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => RecensementStep()));
        },
        child: const Icon(Icons.add),
      ),
      body: ValueListenableBuilder<Box<Client>>(
          valueListenable: Hive.box<Client>("client").listenable(),
          builder: (context, box, _) {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "LISTES DES RECENSEMENTS",
                    style: TextStyle(
                      color: Color(0xff2f7b5f),
                      fontSize: 26.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  const Divider(
                    height: 40.0,
                    thickness: 1.0,
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: box.values.length,
                      itemBuilder: (context, index) {
                        Client currentClient = box.getAt(index)!;
                        return MyListTile(currentClient, index);
                      },
                    ),
                  ),
                ],
              ),
            );
          }),
    );
  }
}
