import 'package:equatable/equatable.dart';
import '../../domain/entities/location.dart';

abstract class LocationState extends Equatable {
  const LocationState();

  @override
  List<Object?> get props => [];
}

class LocationInitial extends LocationState {}

class LocationLoading extends LocationState {}

class LocationsLoaded extends LocationState {
  final List<Location> locations;

  const LocationsLoaded({required this.locations});

  @override
  List<Object?> get props => [locations];
}

class LocationLoaded extends LocationState {
  final Location location;

  const LocationLoaded({required this.location});

  @override
  List<Object?> get props => [location];
}

class LocationError extends LocationState {
  final String message;

  const LocationError({required this.message});

  @override
  List<Object?> get props => [message];
}
