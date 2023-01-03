// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'client.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ClientAdapter extends TypeAdapter<Client> {
  @override
  final int typeId = 0;

  @override
  Client read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Client(
      type: fields[0] as String,
      acticCom: fields[1] as String,
      secteur: fields[2] as String,
      localisation: fields[3] as String,
      nomCom: fields[4] as String,
      numPorte: fields[5] as String,
      nom: fields[6] as String,
      prenom: fields[7] as String,
      typeContri: fields[8] as String,
      sexe: fields[9] as String,
      societe: fields[10] as String,
      telephone: fields[11] as String,
      email: fields[12] as String,
      dateRecens: fields[13] as String,
      infoCompl: fields[14] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Client obj) {
    writer
      ..writeByte(15)
      ..writeByte(0)
      ..write(obj.type)
      ..writeByte(1)
      ..write(obj.acticCom)
      ..writeByte(2)
      ..write(obj.secteur)
      ..writeByte(3)
      ..write(obj.localisation)
      ..writeByte(4)
      ..write(obj.nomCom)
      ..writeByte(5)
      ..write(obj.numPorte)
      ..writeByte(6)
      ..write(obj.nom)
      ..writeByte(7)
      ..write(obj.prenom)
      ..writeByte(8)
      ..write(obj.typeContri)
      ..writeByte(9)
      ..write(obj.sexe)
      ..writeByte(10)
      ..write(obj.societe)
      ..writeByte(11)
      ..write(obj.telephone)
      ..writeByte(12)
      ..write(obj.email)
      ..writeByte(13)
      ..write(obj.dateRecens)
      ..writeByte(14)
      ..write(obj.infoCompl);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ClientAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
