import 'dart:io';

import 'package:excel/excel.dart';

const String excelPath =
    "./docs/weather_api/기상청41_단기예보 조회서비스_오픈API활용가이드_격자_위경도(2411).xlsx";
const String sheetName = "최종 업데이트 파일_20241031";

void fromExcelDoc() {
  var bytes = File(excelPath).readAsBytesSync();
  var excel = Excel.decodeBytes(bytes);
  var sheet = excel.sheets[sheetName];

  if (sheet == null) {
    print("$sheetName not found");
    return;
  }

  for (var row in sheet.rows.sublist(1)) {
    var coordinate = Coordinate.fromData(row);
    print(coordinate.toString());
  }
}

class Coordinate {
  final int locationCode;
  final String level1;
  final String? level2;
  final String? level3;
  final int nx;
  final int ny;
  final num longitude;
  final num latitude;

  Coordinate._inner({
    required this.locationCode,
    required this.level1,
    required this.level2,
    required this.level3,
    required this.nx,
    required this.ny,
    required this.longitude,
    required this.latitude,
  });

  factory Coordinate.fromData(List<Data?> row) {
    CellValue? locationCode = row[1]?.value;
    CellValue? level1 = row[2]?.value;
    CellValue? level2 = row[3]?.value;
    CellValue? level3 = row[4]?.value;
    CellValue? nx = row[5]?.value;
    CellValue? ny = row[6]?.value;
    CellValue? longitude = row[13]?.value;
    CellValue? latitude = row[14]?.value;

    return Coordinate._inner(
      locationCode: int.parse(locationCode.toString()),
      level1: level1.toString(),
      level2: level2.toString(),
      level3: level3.toString(),
      nx: int.parse(nx.toString()),
      ny: int.parse(ny.toString()),
      longitude: num.parse(longitude.toString()),
      latitude: num.parse(latitude.toString()),
    );
  }

  @override
  String toString() {
    return "$level1 $level2 $level3 $latitude $longitude";
  }
}
