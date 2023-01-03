
class Recensement {
String? dateRecensement ;
String? sigleTypeEquipemnt; //sigle de TypeEquipement
String? nomCommercial ;
String? secteurCode ; // code du Secteur
String? activiteCommeciale ; // type de TypeActiviteCommerciale
String? localisation ;
String? numeroDePorte  ;
String? nom  ; // nom contribuable
String? prenom  ; // prenom contribuable
String? typePersonne ; // enumeration PHYSIQUE ou MORALE
String? sexe  ; //enumeration F ou M
String? nomsociete ;
String? email ;
String? telephone  ;
String? infosComplementaires ;
String? matriculeAgent; // matricule agent connecté
bool? estValide ; // false

Recensement({this.dateRecensement, this.sigleTypeEquipemnt, this.nomCommercial,
            this.secteurCode, this.activiteCommeciale, this.localisation,
            this.numeroDePorte, this.nom, this.prenom, this.typePersonne, this.sexe,
            this.nomsociete, this.email, this.telephone, this.infosComplementaires,
            this.matriculeAgent, this.estValide});

Recensement.fromJson(Map<String, dynamic> json) {
  dateRecensement = json['dateRecensement'];
  sigleTypeEquipemnt = json['sigleTypeEquipemnt'];
  nomCommercial = json['nomCommercial'];
  secteurCode = json['secteurCode'];
  activiteCommeciale = json['activiteCommeciale'];
  localisation = json['localisation'];
  numeroDePorte = json['numeroDePorte'];
  nom = json['nom'];
  prenom = json['prenom'];
  typePersonne = json['typePersonne'];
  sexe = json['sexe'];
  nomsociete = json['nomsociete'];
  email = json['email'];
  telephone = json['telephone'];
  infosComplementaires = json['infosComplementaires'];
  matriculeAgent = json['matriculeAgent'];
  estValide = json['estValide'];
}

Map<String, dynamic> toJson() {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['dateRecensement'] = dateRecensement;
  data['sigleTypeEquipemnt'] = sigleTypeEquipemnt;
  data['nomCommercial'] = nomCommercial;
  data['secteurCode'] = secteurCode;
  data['activiteCommeciale'] = activiteCommeciale;
  data['localisation'] = localisation;
  data['numeroDePorte'] = numeroDePorte;
  data['nom'] = nom;
  data['prenom'] = prenom;
  data['typePersonne'] = typePersonne;
  data['sexe'] = sexe;
  data['nomsociete'] = nomsociete;
  data['email'] = email;
  data['telephone'] = telephone;
  data['infosComplementaires'] = infosComplementaires;
  data['matriculeAgent'] = matriculeAgent;
  data['estValide'] = estValide;
  return data;
}
}