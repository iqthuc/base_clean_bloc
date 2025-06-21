import 'package:base_clean_bloc/features/example/domain/entity/player/player_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'player.freezed.dart';
part 'player.g.dart';

@freezed
abstract class Player extends PlayerEntity with _$Player {
  Player._();
  factory Player({
    int? id,
    String? firstName,
    String? heightFeet,
    String? heightInches,
    String? lastName,
    String? position,
    Team? team,
    String? weightPounds,
  }) = _Player;

  factory Player.fromJson(Map<String, dynamic> json) => _$PlayerFromJson(json);
}

@freezed
abstract class Team extends TeamEntity with _$Team {
  Team._();
  factory Team({
    int? id,
    String? abbreviation,
    String? city,
    String? conference,
    String? division,
    String? fullName,
    String? name,
  }) = _Team;

  factory Team.fromJson(Map<String, dynamic> json) => _$TeamFromJson(json);
}
