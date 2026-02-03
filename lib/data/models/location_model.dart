import 'package:json_annotation/json_annotation.dart';

import '../../domain/entities/location.dart';
part 'location_model.g.dart';

@JsonSerializable()
class LocationModel extends Location {
  const LocationModel({
    required super.id,
    required super.name,
    required super.type,
    required super.dimension,
  });

  factory LocationModel.fromJson(Map<String, dynamic> json) => _$LocationModelFromJson(json);

  Map<String, dynamic> toJson() => _$LocationModelToJson(this);
}
