import 'models/data.dart';

class Const {
  static List<Data> dataList = [
    Data.fromJsonBody("Medipass", "{\"type\":\"covidVaccinationCert\",\"date\":\"2022-10-12\"}"),
    Data.fromJsonBody("Medipass", "{\"name\":\"yjlee\",\"date\":\"2022-10-12\"}"),
  ];
}