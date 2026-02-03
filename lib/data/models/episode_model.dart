import 'package:json_annotation/json_annotation.dart';

import '../../domain/entities/episode.dart';

part 'episode_model.g.dart';

@JsonSerializable()
class EpisodeModel extends Episode {
  const EpisodeModel({
    required super.id,
    required super.name,
    required super.airDate,
    required super.episode,
  });

  factory EpisodeModel.fromJson(Map<String, dynamic> json) => _$EpisodeModelFromJson(json);

  Map<String, dynamic> toJson() => _$EpisodeModelToJson(this);
}
