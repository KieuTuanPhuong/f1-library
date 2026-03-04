import 'package:template/helper/rk_validate.dart';

class RaceInfoResponse {
  String? api;
  String? url;
  int? total;
  int? season;
  int? round;
  Championship? championship;
  List<Race>? race;

  RaceInfoResponse({
    this.api,
    this.url,
    this.total,
    this.season,
    this.round,
    this.championship,
    this.race,
  });

  factory RaceInfoResponse.fromJson(Map<String, dynamic> json) =>
      RaceInfoResponse(
        api: RkValidate.parseStringFromJson(json["api"]),
        url: RkValidate.parseStringFromJson(json["url"]),
        total: RkValidate.parseIntOrNullFromJson(json["total"]),
        season: RkValidate.parseIntOrNullFromJson(json["season"]),
        round: RkValidate.parseIntOrNullFromJson(json["round"]),
        championship: json["championship"] == null
            ? null
            : Championship.fromJson(json["championship"]),
        race: json["race"] == null
            ? null
            : List<Race>.from(json["race"].map((x) => Race.fromJson(x))),
      );
}

class Championship {
  String? championshipId;
  String? championshipName;
  String? url;
  int? year;

  Championship({
    this.championshipId,
    this.championshipName,
    this.url,
    this.year,
  });

  factory Championship.fromJson(Map<String, dynamic> json) => Championship(
        championshipId: RkValidate.parseStringFromJson(json["championshipId"]),
        championshipName:
            RkValidate.parseStringFromJson(json["championshipName"]),
        url: RkValidate.parseStringFromJson(json["url"]),
        year: RkValidate.parseIntOrNullFromJson(json["year"]),
      );
}

class Race {
  String? raceId;
  String? championshipId;
  String? raceName;
  Schedule? schedule;
  int? laps;
  int? round;
  String? url;
  FastLap? fastLap;
  Circuit? circuit;
  dynamic winner;
  dynamic teamWinner;

  Race({
    this.raceId,
    this.championshipId,
    this.raceName,
    this.schedule,
    this.laps,
    this.round,
    this.url,
    this.fastLap,
    this.circuit,
    this.winner,
    this.teamWinner,
  });

  factory Race.fromJson(Map<String, dynamic> json) => Race(
        raceId: RkValidate.parseStringFromJson(json["raceId"]),
        championshipId: RkValidate.parseStringFromJson(json["championshipId"]),
        raceName: RkValidate.parseStringFromJson(json["raceName"]),
        schedule: json["schedule"] == null
            ? null
            : Schedule.fromJson(json["schedule"]),
        laps: RkValidate.parseIntOrNullFromJson(json["laps"]),
        round: RkValidate.parseIntOrNullFromJson(json["round"]),
        url: RkValidate.parseStringFromJson(json["url"]),
        fastLap: json["fast_lap"] == null
            ? null
            : FastLap.fromJson(json["fast_lap"]),
        circuit:
            json["circuit"] == null ? null : Circuit.fromJson(json["circuit"]),
        winner: json["winner"],
        teamWinner: json["teamWinner"],
      );
}

class Schedule {
  Session? race;
  Session? qualy;
  Session? fp1;
  Session? fp2;
  Session? fp3;
  Session? sprintQualy;
  Session? sprintRace;

  Schedule({
    this.race,
    this.qualy,
    this.fp1,
    this.fp2,
    this.fp3,
    this.sprintQualy,
    this.sprintRace,
  });

  factory Schedule.fromJson(Map<String, dynamic> json) => Schedule(
        race: json["race"] == null ? null : Session.fromJson(json["race"]),
        qualy: json["qualy"] == null ? null : Session.fromJson(json["qualy"]),
        fp1: json["fp1"] == null ? null : Session.fromJson(json["fp1"]),
        fp2: json["fp2"] == null ? null : Session.fromJson(json["fp2"]),
        fp3: json["fp3"] == null ? null : Session.fromJson(json["fp3"]),
        sprintQualy: json["sprintQualy"] == null
            ? null
            : Session.fromJson(json["sprintQualy"]),
        sprintRace: json["sprintRace"] == null
            ? null
            : Session.fromJson(json["sprintRace"]),
      );
}

class Session {
  String? date;
  String? time;

  Session({
    this.date,
    this.time,
  });

  factory Session.fromJson(Map<String, dynamic> json) => Session(
        date: RkValidate.parseStringFromJson(json["date"]),
        time: RkValidate.parseStringFromJson(json["time"]),
      );
}

class FastLap {
  String? fastLap;
  String? fastLapDriverId;
  String? fastLapTeamId;

  FastLap({
    this.fastLap,
    this.fastLapDriverId,
    this.fastLapTeamId,
  });

  factory FastLap.fromJson(Map<String, dynamic> json) => FastLap(
        fastLap: RkValidate.parseStringFromJson(json["fast_lap"]),
        fastLapDriverId:
            RkValidate.parseStringFromJson(json["fast_lap_driver_id"]),
        fastLapTeamId: RkValidate.parseStringFromJson(json["fast_lap_team_id"]),
      );
}

class Circuit {
  String? circuitId;
  String? circuitName;
  String? country;
  String? city;
  String? circuitLength;
  String? lapRecord;
  int? firstParticipationYear;
  int? corners;
  String? fastestLapDriverId;
  String? fastestLapTeamId;
  int? fastestLapYear;
  String? url;

  Circuit({
    this.circuitId,
    this.circuitName,
    this.country,
    this.city,
    this.circuitLength,
    this.lapRecord,
    this.firstParticipationYear,
    this.corners,
    this.fastestLapDriverId,
    this.fastestLapTeamId,
    this.fastestLapYear,
    this.url,
  });

  factory Circuit.fromJson(Map<String, dynamic> json) => Circuit(
        circuitId: RkValidate.parseStringFromJson(json["circuitId"]),
        circuitName: RkValidate.parseStringFromJson(json["circuitName"]),
        country: RkValidate.parseStringFromJson(json["country"]),
        city: RkValidate.parseStringFromJson(json["city"]),
        circuitLength: RkValidate.parseStringFromJson(json["circuitLength"]),
        lapRecord: RkValidate.parseStringFromJson(json["lapRecord"]),
        firstParticipationYear:
            RkValidate.parseIntOrNullFromJson(json["firstParticipationYear"]),
        corners: RkValidate.parseIntOrNullFromJson(json["corners"]),
        fastestLapDriverId:
            RkValidate.parseStringFromJson(json["fastestLapDriverId"]),
        fastestLapTeamId:
            RkValidate.parseStringFromJson(json["fastestLapTeamId"]),
        fastestLapYear:
            RkValidate.parseIntOrNullFromJson(json["fastestLapYear"]),
        url: RkValidate.parseStringFromJson(json["url"]),
      );
}
