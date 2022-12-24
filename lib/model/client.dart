import 'package:hive/hive.dart';

part 'client.g.dart';

@HiveType(typeId: 0)
class Client extends HiveObject {
  @HiveField(0)
  late String type;

  @HiveField(1)
  late String acticCom;

  @HiveField(2)
  late String secteur;

  @HiveField(3)
  late String localisation;

  @HiveField(4)
  late String nomCom;

  @HiveField(5)
  late String numPorte;

  @HiveField(6)
  late String nom;

  @HiveField(7)
  late String prenom;

  @HiveField(8)
  late String typeContri;

  @HiveField(9)
  late String sexe;

  @HiveField(10)
  late String societe;

  @HiveField(11)
  late String telephone;

  @HiveField(12)
  late String email;

  @HiveField(13)
  late String dateRecens;

  @HiveField(14)
  late String infoCompl;

  Client(
      {required this.type,
      required this.acticCom,
      required this.secteur,
      required this.localisation,
      required this.nomCom,
      required this.numPorte,
      required this.nom,
      required this.prenom,
      required this.typeContri,
      required this.sexe,
      required this.societe,
      required this.telephone,
      required this.email,
      required this.dateRecens,
      required this.infoCompl});
}
