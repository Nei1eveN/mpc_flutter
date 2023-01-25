import 'package:fpdart/fpdart.dart';

/// Template for creating use cases
///
/// [T] can be in any type of response
/// [Params] can be in any type of passable parameters or
/// use [Unit] if you are not going to pass anything
abstract class BaseUseCase<T, Params> {
  const BaseUseCase();

  /// Method containing your [T] and [Params]
  ///
  /// Returns an [Either] between your [T] and [Exception]
  ///
  /// To consume:
  ///
  /// ```
  /// final response = await YourUseCase(YourParams);
  ///
  /// response.fold((yourType) {
  ///   /// do your thing here
  /// }, (exception) {
  ///   /// do your thing here
  /// });
  /// ```
  ///
  /// Example 1:
  ///
  /// ```
  /// final GetPublicAppTokenUseCase getPublicAppToken;
  ///
  /// final response = await getPublicAppToken(unit);
  ///
  /// response.fold((token) {
  ///   /// do your thing here
  /// }, (exception) {
  ///   /// do your thing here
  /// });
  /// ```
  ///
  /// Example 2:
  ///
  /// ```
  /// final ValidateAccessCodeUseCase validateAccessCode;
  ///
  /// final response = await validateAccessCode('123456');
  ///
  /// response.fold((entity) {
  ///   /// do your thing here
  /// }, (exception) {
  ///   /// do your thing here
  /// });
  /// ```
  Future<Either<T, Exception>> call(Params params);
}
