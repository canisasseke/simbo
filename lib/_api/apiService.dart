
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:simbo_1/_api/dioClient.dart';
import 'package:simbo_1/_api/dioException.dart';
import 'package:simbo_1/_api/endpoints.dart';
import 'package:simbo_1/model/Secteur.dart';
import 'package:simbo_1/model/TypeActiviteCommerciale.dart';
import 'package:simbo_1/model/agent.dart';
import 'package:simbo_1/model/recensement.dart';
import 'package:simbo_1/model/typeEquipement.dart';

class ApiService {
  final DioClient _dioClient;
  ApiService(this._dioClient);

Future<List<TypeEquipement>> getAllTypeEquipemnts() async{
  try{
    final  response = await _dioClient.get(Endpoints.typeEquipements);
    List<TypeEquipement> equipmentTypes = (response.data as List)
        .map((e) => TypeEquipement.fromJson(e))
        .toList();
    return equipmentTypes;
  } on DioError catch (e) {
    final errorMessage = DioExceptions.fromDioError(e).toString();
    throw errorMessage;
  }
}

  Future<List<Secteur>> getAllSecteurs() async{
    try{
      final  response = await _dioClient.get(Endpoints.secteurs);
      List<Secteur> sectors = (response.data as List)
          .map((e) => Secteur.fromJson(e))
          .toList();
      return sectors;
    } on DioError catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      throw errorMessage;
    }
  }

  Future<List<TypeActiviteCommerciale>> getAllTypeActiviteCommerciale() async{
    try{
      final  response = await _dioClient.get(Endpoints.activiteCommerciales);
      List<TypeActiviteCommerciale> activities = (response.data as List)
          .map((e) => TypeActiviteCommerciale.fromJson(e))
          .toList();
      return activities;
    } on DioError catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      throw errorMessage;
    }
  }

  Future<Agent> getUserConnected(String username) async{
  String agentEndpoint = '/agents/$username/slim/byusername';
    try{
      final  response = await _dioClient.get(agentEndpoint);
      return  Agent.fromJson(response.data);
    } on DioError catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      throw errorMessage;
    }
  }

  Future<void> sendRecensement(List<Recensement> recensements) async{
  final resensementJson = recensements.map((e) => jsonEncode(e)).toList();
    try{
       await _dioClient.post(Endpoints.recensements, data: resensementJson);
    } on DioError catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      throw errorMessage;
    }
  }
}