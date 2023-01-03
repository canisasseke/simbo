// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Secteur.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Secteur _$SecteurFromJson(Map<String, dynamic> json) => Secteur(
      id: json['id'] as int?,
      designation: json['designation'] as String?,
      description: json['description'] as String?,
      code: json['code'] as String?,
      sigle: json['sigle'] as String?,
      collectiviteCode: json['collectiviteCode'] as String?,
    );

Map<String, dynamic> _$SecteurToJson(Secteur instance) => <String, dynamic>{
      'id': instance.id,
      'designation': instance.designation,
      'description': instance.description,
      'code': instance.code,
      'sigle': instance.sigle,
      'collectiviteCode': instance.collectiviteCode,
    };
