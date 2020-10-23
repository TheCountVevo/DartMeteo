import 'dart:io';

import 'package:args/args.dart';

import 'class/GetMeteo.dart';

var cityFlag = "city";

ArgResults argResults;
main(List<String> arguments) {
  exitCode = 0;
  final parser = ArgParser()..addFlag(cityFlag, negatable: false, abbr: 'c');

  argResults = parser.parse(arguments);
  final cityName = argResults.rest;

  dweather(cityName, argResults[cityFlag] as bool);
}

Future dweather(List<String> cityInfo, bool flag) {
  if (cityInfo.isEmpty) {
    print("ERREUR ! Vous devez spécifier une ville valide !");
  } else {
    GetMeteo meteo = new GetMeteo(cityInfo[0].toString());
    meteo.meteo();
  }
}
