// ignore_for_file: must_be_immutable

import 'package:blue_thermal_printer/blue_thermal_printer.dart';
import 'package:flutter/material.dart';

import '../model/client.dart';

class PrintPage extends StatefulWidget {
  PrintPage({this.client, Key? key}) : super(key: key);
  Client? client;

  @override
  State<PrintPage> createState() => _PrintPageState();
}

class _PrintPageState extends State<PrintPage> {
  List<BluetoothDevice> devices = [];
  BluetoothDevice? selectedDevice;
  BlueThermalPrinter printer = BlueThermalPrinter.instance;

  @override
  void initState() {
    super.initState();
    getDevices();
  }

  void getDevices() async {
    devices = await printer.getBondedDevices();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Selectionner l\'imprimante '),
        backgroundColor: const Color(0xff2f7b5f),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DropdownButton<BluetoothDevice>(
              value: selectedDevice,
              hint: Text('Selectionner un terminal d\'impression'),
              items: devices
                  .map((e) => DropdownMenuItem(
                        child: Text(e.name!),
                        value: e,
                      ))
                  .toList(),
              onChanged: (device) {
                setState(() {
                  selectedDevice = device;
                });
              },
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
                onPressed: () {
                  printer.connect(selectedDevice!);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xff2f7b5f),
                ),
                child: const Text('Connecter')),
            ElevatedButton(
                onPressed: () {
                  printer.disconnect();
                },
                style: ElevatedButton.styleFrom(
                  primary: const Color(0xff2f7b5f),
                ),
                child: const Text('Deconnecter')),
            ElevatedButton(
                onPressed: () async {
                  if ((await printer.isConnected)!) {
                    printer.printNewLine();
                    //SIZE
                    // 0: Normal
                    // 1: Normal - Bold
                    // 2: Medium - Bold
                    // 4: Large - Bold

                    //ALIGN
                    // 0: left
                    // 1: center
                    // 2: right
                    printer.printCustom('INFORMATIONS EQUIPEMENT', 0, 1);
                    printer.printNewLine();
                    printer.printCustom('Reçu client', 0, 1);
                    printer.printNewLine();
                    printer.printCustom('Type: ${widget.client!.type}', 1, 1);
                    printer.printNewLine();
                    printer.printCustom(
                        'Activité Commerciale: ${widget.client!.acticCom}',
                        1,
                        1);
                    printer.printNewLine();
                    printer.printCustom(
                        'Secteur: ${widget.client!.secteur}', 1, 1);
                    printer.printNewLine();
                    printer.printCustom(
                        'Nom Commercial: ${widget.client!.nomCom}', 1, 1);
                    printer.printNewLine();
                    printer.printNewLine();
                    printer.printCustom('INFORMATIONS CONTRIBUABLE', 0, 1);
                    printer.printNewLine();
                    printer.printCustom('Nom: ${widget.client!.nom}', 1, 1);
                    printer.printNewLine();
                    printer.printCustom(
                        'Prenoms: ${widget.client!.prenom}', 1, 1);
                    printer.printNewLine();
                    printer.printCustom(
                        'Type Contribuable: ${widget.client!.typeContri}',
                        1,
                        1);
                    printer.printNewLine();
                    printer.printCustom('Sexe: ${widget.client!.sexe}', 1, 1);
                    printer.printNewLine();
                    printer.printCustom(
                        'Société: ${widget.client!.societe}', 1, 1);
                    printer.printNewLine();
                    printer.printCustom(widget.client!.dateRecens, 1, 1);
                    printer.printNewLine();
                    printer.printQRcode('Thermal Print Demo', 200, 200, 1);
                    printer.printNewLine();
                    printer.printCustom(
                        'S\'il vous plait, preservez le reçu !!!', 0, 1);
                    printer.printCustom('Merci à bientôt!!!', 0, 1);
                    printer.printNewLine();
                    printer.printNewLine();
                    printer.printNewLine();
                  }
                },
                style: ElevatedButton.styleFrom(
                  primary: const Color(0xff2f7b5f),
                ),
                child: const Text('Imprimer')),
          ],
        ),
      ),
    );
  }
}
