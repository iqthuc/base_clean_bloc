import 'package:base_clean_bloc/common/utils/can_tap_services.dart/can_tap_services.dart';

mixin ButtonMixin {
  bool get canTap => CanTapService.instance.canTap;
  bool tapIfAvailable({
    required void Function() onTap,
    String? eventName,
    Map<String, Object>? parametters,
  }) =>
      CanTapService.instance.tapIfAvailable(onTap: onTap, eventName: eventName, parametters: parametters);
}
