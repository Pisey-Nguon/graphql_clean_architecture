import 'package:equatable/equatable.dart';

abstract class LocationEvent extends Equatable {
  const LocationEvent();

  @override
  List<Object?> get props => [];
}

class GetLocationsEvent extends LocationEvent {
  final int page;

  const GetLocationsEvent({required this.page});

  @override
  List<Object?> get props => [page];
}

class GetLocationEvent extends LocationEvent {
  final String id;

  const GetLocationEvent({required this.id});

  @override
  List<Object?> get props => [id];
}
