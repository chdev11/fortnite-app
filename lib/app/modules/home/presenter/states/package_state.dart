import 'package:fortnite_app/app/modules/home/domain/errors/featured_error.dart';

abstract class IFeaturedState {}

class FeaturedReady extends IFeaturedState {}

class FeaturedLoading extends IFeaturedState {}

class FeaturedSuccess extends IFeaturedState {}

class FeaturedError extends IFeaturedState {
  final FeaturedException exception;

  FeaturedError(this.exception);
}
