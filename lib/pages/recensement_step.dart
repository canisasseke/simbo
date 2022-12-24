// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/intl.dart';
import 'package:simbo_1/pages/liste.dart';

import '../model/client.dart';

class RecensementStep extends StatefulWidget {
  RecensementStep({this.client, Key? key}) : super(key: key);
  Client? client;
  @override
  _RecensementStepState createState() => _RecensementStepState();
}

class _RecensementStepState extends State<RecensementStep> {

  String? valueChoose;
  List itemsList = ["1","2","3","4"];

  int _currentStep = 0;
  StepperType stepperType = StepperType.vertical;
  DateTime dateTime = new DateTime.now();
  DateFormat formatter = new DateFormat('yyyy-MM-dd H:m');

  @override
  Widget build(BuildContext context) {
    TextEditingController type = TextEditingController(
        text: widget.client == null ? null : widget.client!.type);
    TextEditingController activCom = TextEditingController(
        text: widget.client == null ? null : widget.client!.acticCom);
    TextEditingController sect = TextEditingController(
        text: widget.client == null ? null : widget.client!.secteur);
    TextEditingController local = TextEditingController(
        text: widget.client == null ? null : widget.client!.localisation);
    TextEditingController nomCommercial = TextEditingController(
        text: widget.client == null ? null : widget.client!.nomCom);
    TextEditingController numPortes = TextEditingController(
        text: widget.client == null ? null : widget.client!.numPorte);
    TextEditingController nomC = TextEditingController(
        text: widget.client == null ? null : widget.client!.nom);
    TextEditingController prenomC = TextEditingController(
        text: widget.client == null ? null : widget.client!.prenom);
    TextEditingController typeCont = TextEditingController(
        text: widget.client == null ? null : widget.client!.typeContri);
    TextEditingController sexes = TextEditingController(
        text: widget.client == null ? null : widget.client!.sexe);
    TextEditingController societes = TextEditingController(
        text: widget.client == null ? null : widget.client!.societe);
    TextEditingController telephones = TextEditingController(
        text: widget.client == null ? null : widget.client!.telephone);
    TextEditingController emails = TextEditingController(
        text: widget.client == null ? null : widget.client!.email);
    // TextEditingController datRecens = TextEditingController(
    //     text: widget.client == null ? null : widget.client!.dateRecens);
    TextEditingController infoComp = TextEditingController(
        text: widget.client == null ? null : widget.client!.infoCompl);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('ENREGISTREMENT RECENSEMENT'),
        backgroundColor: Color.fromRGBO(27, 81, 104, 0.4),
        centerTitle: true,
      ),
      body: Theme(
        data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(primary: Color.fromRGBO(91, 202, 167, 0.4))),
        child: Column(
          children: [
            Expanded(
              child: Stepper(
                type: StepperType.horizontal,
                physics: const ScrollPhysics(),
                currentStep: _currentStep,
                onStepTapped: (step) => tapped(step),
                onStepContinue: continued,
                onStepCancel: cancel,
                controlsBuilder: (context, details) {
                  //final isLastStep = _currentStep == getSteps().length - 1;
                  return Container(
                    margin: const EdgeInsets.only(top: 50),
                    child: Row(
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            onPressed: continued,
                            style: ElevatedButton.styleFrom(
                                fixedSize: const Size(100, 50),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15))),
                            //child: Text(isLastStep ? 'CONFIRM' : 'NEXT'),
                            child: const Text('NEXT'),
                          ),
                        ),
                        const SizedBox(width: 12),
                        if (_currentStep != 0)
                          Expanded(
                            child: ElevatedButton(
                              onPressed: cancel,
                              style: ElevatedButton.styleFrom(
                                  fixedSize: const Size(100, 50),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15))),
                              child: const Text('BACK'),
                            ),
                          ),
                      ],
                    ),
                  );
                },
                steps: <Step>[
                  Step(
                    title: new Text('Equipement'),
                    content: Column(
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                'Type*',
                                style: TextStyle(
                                  fontFamily: 'Ubuntu',
                                  fontSize: 17,
                                  color: Color(0xff050505),
                                ),
                                softWrap: false,
                              ),
                            ),
                          ],
                        ),
                        Container(
                          height: 55,
                          padding: const EdgeInsets.only(top: 3, left: 15),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                blurRadius: 10,
                              ),
                            ],
                          ),
                          child: DropdownButton(
                            // controller: type,
                            hint: Text("Choisissez-en un"),
                            icon: Icon(Icons.arrow_drop_down),
                            iconSize: 30,
                            isExpanded: true,
                            underline: SizedBox(),
                            value: valueChoose,
                            onChanged: (newvalue){
                              setState(() {
                                valueChoose = newvalue as String?;
                              });
                            },
                            items: itemsList.map((valueItem) {
                              return DropdownMenuItem(
                                value: valueItem,
                                child: Text(valueItem),
                              );
                            }).toList(),
                          ),
                        ),

                        ////               ACTIVITE COMMERCIALE           ////
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                'Activité commerciale*',
                                style: TextStyle(
                                  fontFamily: 'Ubuntu',
                                  fontSize: 17,
                                  color: Color(0xff050505),
                                ),
                                softWrap: false,
                              ),
                            ),
                          ],
                        ),
                        Container(
                          height: 55,
                          padding: const EdgeInsets.only(top: 3, left: 15),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                blurRadius: 10,
                              ),
                            ],
                          ),
                          child: DropdownButton(
                            hint: Text("Choisissez-en un"),
                            icon: Icon(Icons.arrow_drop_down),
                            iconSize: 30,
                            isExpanded: true,
                            underline: SizedBox(),
                            value: valueChoose,
                            onChanged: (newvalue){
                              setState(() {
                                valueChoose = newvalue as String?;
                              });
                            },
                            items: itemsList.map((valueItem) {
                              return DropdownMenuItem(
                                value: valueItem,
                                child: Text(valueItem),
                              );
                            }).toList(),
                          ),
                        ),
                        ////               SECTEUR           ////
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                'Secteur*',
                                style: TextStyle(
                                  fontFamily: 'Ubuntu',
                                  fontSize: 17,
                                  color: Color(0xff050505),
                                ),
                                softWrap: false,
                              ),
                            ),
                          ],
                        ),
                        Container(
                          height: 55,
                          padding: const EdgeInsets.only(top: 3, left: 15),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                blurRadius: 10,
                              ),
                            ],
                          ),
                          child: DropdownButton(
                            hint: Text("Choisissez-en un"),
                            icon: Icon(Icons.arrow_drop_down),
                            iconSize: 30,
                            isExpanded: true,
                            underline: SizedBox(),
                            value: valueChoose,
                              onChanged: (newvalue){
                                setState(() {
                                  valueChoose = newvalue as String?;
                                });
                              },
                              items: itemsList.map((valueItem) {
                                return DropdownMenuItem(
                                  value: valueItem,
                                  child: Text(valueItem),
                                );
                              }).toList(),
                              ),
                        ),

                        ////               LOCALISATION           ////
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                'Localisation',
                                style: TextStyle(
                                  fontFamily: 'Ubuntu',
                                  fontSize: 17,
                                  color: Color(0xff050505),
                                ),
                                softWrap: false,
                              ),
                            ),
                          ],
                        ),
                        Container(
                          height: 55,
                          padding: const EdgeInsets.only(top: 3, left: 15),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                blurRadius: 10,
                              ),
                            ],
                          ),
                          child: const TextField(
                            //controller: local,
                              autofocus: false,
                              style:
                              TextStyle(fontSize: 15.0, color: Colors.black),
                              decoration: InputDecoration(
                               // hintText: "Choisissez-en un",
                                  border: InputBorder.none,
                                  contentPadding: const EdgeInsets.all(0),
                                  hintStyle: TextStyle(fontSize: 15.0),
                                  errorStyle: TextStyle(
                                      color: Colors.black26, fontSize: 15.0))
                          ),
                        ),

                        ////               NOM COMMERCIAL           ////
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                'Nom commercial',
                                style: TextStyle(
                                  fontFamily: 'Ubuntu',
                                  fontSize: 17,
                                  color: Color(0xff050505),
                                ),
                                softWrap: false,
                              ),
                            ),
                          ],
                        ),
                        Container(
                          height: 55,
                          padding: const EdgeInsets.only(top: 3, left: 15),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                blurRadius: 10,
                              ),
                            ],
                          ),
                          child: const TextField(
                            //controller: nomCommercial,
                              autofocus: false,
                              style:
                              TextStyle(fontSize: 15.0, color: Colors.black),
                              decoration: InputDecoration(
                                //hintText: "Choisissez-en un",
                                  border: InputBorder.none,
                                  contentPadding: const EdgeInsets.all(0),
                                  hintStyle: TextStyle(fontSize: 20.0),
                                  errorStyle: TextStyle(
                                      color: Colors.black26, fontSize: 15.0))
                          ),
                        ),

                        ////               NUMERO DE PORTE           ////
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                'Numero de porte',
                                style: TextStyle(
                                  fontFamily: 'Ubuntu',
                                  fontSize: 17,
                                  color: Color(0xff050505),
                                ),
                                softWrap: false,
                              ),
                            ),
                          ],
                        ),
                        Container(
                          height: 55,
                          padding: const EdgeInsets.only(top: 3, left: 15),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                blurRadius: 10,
                              ),
                            ],
                          ),
                          child: const TextField(
                            //controller: numPortes,
                              autofocus: false,
                              style:
                              TextStyle(fontSize: 15.0, color: Colors.black),
                              decoration: InputDecoration(
                                //hintText: "Choisissez-en un",
                                  border: InputBorder.none,
                                  contentPadding: const EdgeInsets.all(0),
                                  hintStyle: TextStyle(fontSize: 20.0),
                                  errorStyle: TextStyle(
                                      color: Colors.black26, fontSize: 15.0))
                          ),
                        ),
                      ],
                    ),
                    isActive: _currentStep >= 0,
                    state: _currentStep >= 0
                        ? StepState.complete
                        : StepState.disabled,
                  ),
                  Step(
                    title: new Text('Contribuable'),
                    content: Column(
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                'Nom*',
                                style: TextStyle(
                                  fontFamily: 'Ubuntu',
                                  fontSize: 17,
                                  color: Color(0xff050505),
                                ),
                                softWrap: false,
                              ),
                            ),
                          ],
                        ),
                        Container(
                          height: 55,
                          padding: const EdgeInsets.only(top: 3, left: 15),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                blurRadius: 10,
                              ),
                            ],
                          ),
                          child: const TextField(
                            //controller: nomC,
                            autofocus: false,
                              style:
                              TextStyle(fontSize: 15.0, color: Colors.black),
                            decoration: InputDecoration(
                              //hintText: "Choisissez-en un",
                                border: InputBorder.none,
                                contentPadding: const EdgeInsets.all(0),
                                hintStyle: TextStyle(fontSize: 20.0),
                                errorStyle: TextStyle(
                                    color: Colors.black26, fontSize: 15.0))
                          ),
                        ),



                        ////               PRENOMS          ////
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                'Prénoms*',
                                style: TextStyle(
                                  fontFamily: 'Ubuntu',
                                  fontSize: 17,
                                  color: Color(0xff050505),
                                ),
                                softWrap: false,
                              ),
                            ),
                          ],
                        ),
                        Container(
                          height: 55,
                          padding: const EdgeInsets.only(top: 3, left: 15),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                blurRadius: 10,
                              ),
                            ],
                          ),
                          child: const TextField(
                            //controller: prenomC,
                              autofocus: false,
                              style:
                              TextStyle(fontSize: 15.0, color: Colors.black),
                              decoration: InputDecoration(
                                //hintText: "Choisissez-en un",
                                  border: InputBorder.none,
                                  contentPadding: const EdgeInsets.all(0),
                                  hintStyle: TextStyle(fontSize: 20.0),
                                  errorStyle: TextStyle(
                                      color: Colors.black26, fontSize: 15.0))
                          ),
                        ),
                        
                        ////               TYPE CONTRIBUABLE           ////
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                'Type contribuable*',
                                style: TextStyle(
                                  fontFamily: 'Ubuntu',
                                  fontSize: 17,
                                  color: Color(0xff050505),
                                ),
                                softWrap: false,
                              ),
                            ),
                          ],
                        ),
                        Container(
                          height: 55,
                          padding: const EdgeInsets.only(top: 3, left: 15),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                blurRadius: 10,
                              ),
                            ],
                          ),
                          child: DropdownButton(
                            hint: Text("Choisissez-en un"),
                            icon: Icon(Icons.arrow_drop_down),
                            iconSize: 30,
                            isExpanded: true,
                            underline: SizedBox(),
                            value: valueChoose,
                            onChanged: (newvalue){
                              setState(() {
                                valueChoose = newvalue as String?;
                              });
                            },
                            items: itemsList.map((valueItem) {
                              return DropdownMenuItem(
                                value: valueItem,
                                child: Text(valueItem),
                              );
                            }).toList(),
                          ),
                        ),

                        ////               SEXE           ////
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                'Sexe',
                                style: TextStyle(
                                  fontFamily: 'Ubuntu',
                                  fontSize: 17,
                                  color: Color(0xff050505),
                                ),
                                softWrap: false,
                              ),
                            ),
                          ],
                        ),
                        Container(
                          height: 55,
                          padding: const EdgeInsets.only(top: 3, left: 15),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                blurRadius: 10,
                              ),
                            ],
                          ),
                          child: DropdownButton(
                            hint: Text("Choisissez-en un"),
                            icon: Icon(Icons.arrow_drop_down),
                            iconSize: 30,
                            isExpanded: true,
                            underline: SizedBox(),
                            value: valueChoose,
                            onChanged: (newvalue){
                              setState(() {
                                valueChoose = newvalue as String?;
                              });
                            },
                            items: itemsList.map((valueItem) {
                              return DropdownMenuItem(
                                value: valueItem,
                                child: Text(valueItem),
                              );
                            }).toList(),
                          ),
                        ),

                        ////               SOCIETE          ////
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                'Nom commercial',
                                style: TextStyle(
                                  fontFamily: 'Ubuntu',
                                  fontSize: 17,
                                  color: Color(0xff050505),
                                ),
                                softWrap: false,
                              ),
                            ),
                          ],
                        ),
                        Container(
                          height: 55,
                          padding: const EdgeInsets.only(top: 3, left: 15),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                blurRadius: 10,
                              ),
                            ],
                          ),
                          child: const TextField(
                            //controller: nomCommercial,
                              autofocus: false,
                              style:
                              TextStyle(fontSize: 15.0, color: Colors.black),
                              decoration: InputDecoration(
                                //hintText: "Choisissez-en un",
                                  border: InputBorder.none,
                                  contentPadding: const EdgeInsets.all(0),
                                  hintStyle: TextStyle(fontSize: 20.0),
                                  errorStyle: TextStyle(
                                      color: Colors.black26, fontSize: 15.0))
                          ),
                        ),

                        ////               TELEPHONE           ////
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                'Telephone',
                                style: TextStyle(
                                  fontFamily: 'Ubuntu',
                                  fontSize: 17,
                                  color: Color(0xff050505),
                                ),
                                softWrap: false,
                              ),
                            ),
                          ],
                        ),
                        Container(
                          height: 55,
                          padding: const EdgeInsets.only(top: 3, left: 15),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                blurRadius: 10,
                              ),
                            ],
                          ),
                          child: const TextField(
                            //controller: telephones,
                              autofocus: false,
                              style:
                              TextStyle(fontSize: 15.0, color: Colors.black),
                              decoration: InputDecoration(
                                //hintText: "Choisissez-en un",
                                  border: InputBorder.none,
                                  contentPadding: const EdgeInsets.all(0),
                                  hintStyle: TextStyle(fontSize: 20.0),
                                  errorStyle: TextStyle(
                                      color: Colors.black26, fontSize: 15.0))
                          ),
                        ),

                        ////               EMAIL           ////
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                'Email',
                                style: TextStyle(
                                  fontFamily: 'Ubuntu',
                                  fontSize: 17,
                                  color: Color(0xff050505),
                                ),
                                softWrap: false,
                              ),
                            ),
                          ],
                        ),
                        Container(
                          height: 55,
                          padding: const EdgeInsets.only(top: 3, left: 15),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                blurRadius: 10,
                              ),
                            ],
                          ),
                          child: const TextField(
                            //controller: emails,
                              autofocus: false,
                              style:
                              TextStyle(fontSize: 15.0, color: Colors.black),
                              decoration: InputDecoration(
                                //hintText: "Choisissez-en un",
                                  border: InputBorder.none,
                                  contentPadding: const EdgeInsets.all(0),
                                  hintStyle: TextStyle(fontSize: 20.0),
                                  errorStyle: TextStyle(
                                      color: Colors.black26, fontSize: 15.0))
                          ),
                        ),
                      ],
                    ),
                    isActive: _currentStep >= 0,
                    state: _currentStep >= 1
                        ? StepState.complete
                        : StepState.disabled,
                  ),
                  Step(
                      title: const Text("Divers"),
                      content: Column(
                        children: [
                          const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              'INFORMATIONS COMPLEMENTAIRE',
                              style: TextStyle(
                                fontFamily: 'Ubuntu',
                                fontSize: 17,
                                color: Color(0xff050505),
                              ),
                              softWrap: false,
                            ),
                          ),
                          Container(
                            height: 55,
                            padding: const EdgeInsets.only(top: 3, left: 15),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.1),
                                  blurRadius: 10,
                                ),
                              ],
                            ),
                            child: const TextField(
                              //controller: infoComp,
                                autofocus: false,
                                style:
                                TextStyle(fontSize: 15.0, color: Colors.black),
                                decoration: InputDecoration(
                                  //hintText: "Choisissez-en un",
                                    border: InputBorder.none,
                                    contentPadding: const EdgeInsets.all(0),
                                    hintStyle: TextStyle(fontSize: 20.0),
                                    errorStyle: TextStyle(
                                        color: Colors.black26, fontSize: 15.0))
                            ),
                          ),
                          RawMaterialButton(
                            onPressed: () async {
                              //delete or update saving
                              var newClient = Client(
                                type: type.text,
                                acticCom: activCom.text,
                                secteur: sect.text,
                                localisation: local.text,
                                nomCom: nomCommercial.text,
                                numPorte: numPortes.text,
                                nom: nomC.text,
                                prenom: prenomC.text,
                                typeContri: typeCont.text,
                                sexe: sexes.text,
                                societe: societes.text,
                                telephone: telephones.text,
                                email: emails.text,
                                dateRecens:
                                    formatter.format(dateTime).toString(),
                                infoCompl: infoComp.text,
                              );
                              Box<Client> clientbox =
                                  Hive.box<Client>("client");
                              //for update
                              if (widget.client != null) {
                                widget.client!.type = newClient.type;
                                widget.client!.acticCom = newClient.acticCom;
                                widget.client!.secteur = newClient.secteur;
                                widget.client!.localisation =
                                    newClient.localisation;
                                widget.client!.nomCom = newClient.nomCom;
                                widget.client!.numPorte = newClient.numPorte;
                                widget.client!.nom = newClient.nom;
                                widget.client!.prenom = newClient.prenom;
                                widget.client!.typeContri =
                                    newClient.typeContri;
                                widget.client!.sexe = newClient.sexe;
                                widget.client!.societe = newClient.societe;
                                widget.client!.telephone = newClient.telephone;
                                widget.client!.email = newClient.email;
                                widget.client!.dateRecens =
                                    formatter.format(dateTime).toString();
                                widget.client!.infoCompl = newClient.infoCompl;
                                widget.client!.save();
                                //if there are error
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => const Liste()));
                              } else {
                                //for add
                                await clientbox.add(newClient);
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => const Liste()));
                              }
                            },
                            fillColor: const Color(0xff2f7b5f),
                            child: Text(
                              widget.client == null
                                  ? "Enregistrer "
                                  : "Actualiser ",
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ))
                ],
              ),
            ),
          ],
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   child: Icon(Icons.list),
      //   onPressed: switchStepsType,
      // ),
    );
  }

  // switchStepsType() {
  //   setState(() => stepperType == StepperType.vertical
  //       ? stepperType = StepperType.horizontal
  //       : stepperType = StepperType.vertical);
  // }

  tapped(int step) {
    setState(() => _currentStep = step);
  }

  continued() {
    _currentStep < 2 ? setState(() => _currentStep += 1) : null;
  }

  cancel() {
    _currentStep > 0 ? setState(() => _currentStep -= 1) : null;
  }
}
