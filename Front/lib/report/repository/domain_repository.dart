import 'dart:convert';
import 'package:accessibility_audit/config.dart';
import 'package:accessibility_audit/report/model/domain_model.dart';
import 'package:accessibility_audit/services/http_dio/http_request.dart';
import 'package:flutter/services.dart';


class  DomainRepository {
  final HttpRequest _http =
      HttpRequest();
 

  Future<List<DomainModel>> getGraph({Map<String, dynamic>? qsparam}) async {
   
    String estado = Config.estado.replaceAll(' ', "_");

    if (estado == "Todos"){
      estado = "all";
    }

    Map<String, dynamic> res = await _http.doGet(qsparam: qsparam, path: "graph/$estado"); 


    return res["data"]
        .map<DomainModel>(
            (r) => DomainModel.fromJson(r))
        .toList();
  }

  Future<List<DomainModel>> getAllDomains({Map<String, dynamic>? qsparam}) async {

   

    
    String estado = Config.estado.replaceAll(' ', "_");

    if (estado == "Todos"){
      estado = "all";
    }

    Map<String, dynamic> res = await _http.doGet(qsparam: qsparam, path: "domains/$estado"); 



    return res["data"]
        .map<DomainModel>(
            (r) => DomainModel.fromJson(r))
        .toList();
  }

    Future<int> getDomainCount({Map<String, dynamic>? qsparam}) async {
    // Obtém a quantidade de domínios
    List<DomainModel> domains = await getAllDomains(qsparam: qsparam);
    return domains.length;
  }
}
