import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../domain/usecases/get_location.dart';
import '../../domain/usecases/get_locations.dart';
import 'location_event.dart';
import 'location_state.dart';

@injectable
class LocationBloc extends Bloc<LocationEvent, LocationState> {
  final GetLocations getLocations;
  final GetLocation getLocation;

  LocationBloc({
    required this.getLocations,
    required this.getLocation,
  }) : super(LocationInitial()) {
    on<GetLocationsEvent>(_onGetLocations);
    on<GetLocationEvent>(_onGetLocation);
  }

  Future<void> _onGetLocations(
    GetLocationsEvent event,
    Emitter<LocationState> emit,
  ) async {
    emit(LocationLoading());
    final result = await getLocations(GetLocationsParams(page: event.page));
    result.fold(
      (failure) => emit(LocationError(message: failure.message)),
      (locations) => emit(LocationsLoaded(locations: locations)),
    );
  }

  Future<void> _onGetLocation(
    GetLocationEvent event,
    Emitter<LocationState> emit,
  ) async {
    emit(LocationLoading());
    final result = await getLocation(GetLocationParams(id: event.id));
    result.fold(
      (failure) => emit(LocationError(message: failure.message)),
      (location) => emit(LocationLoaded(location: location)),
    );
  }
}
