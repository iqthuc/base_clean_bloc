abstract class ICanTapService {
  bool get canTap;
  bool tapIfAvailable({
    required void Function() onTap,
    String? eventName,
    Map<String, Object>? parametters,
  });
}

class CanTapService implements ICanTapService {
  static final CanTapService instance = CanTapService._();
  CanTapService._();

  /// Khoảng thời gian tối thiểu giữa 2 lần tap (in milliseconds)
  int get durationCannotTap => 300;
  int get _currentTime => DateTime.now().millisecondsSinceEpoch;

  int _lastTap = 0;

  int get _notSendEventTime => 5000;
  int _lastSendEvent = 0;
  String _lastEventName = '';

  @override
  bool get canTap {
    final current = _currentTime;
    final diff = current - _lastTap;
    // Trường hợp đổi thời gian hệ thống lùi về phía sau (diff < 0) thì gán lại lastTap
    final bool = diff > durationCannotTap || diff < 0;
    if (bool) {
      _lastTap = current;
    }
    return bool;
  }

  @override
  bool tapIfAvailable({required void Function() onTap, String? eventName, Map<String, Object>? parametters}) {
    if (!canTap) {
      return false;
    }
    onTap.call();
    final bool = _currentTime - _lastSendEvent > _notSendEventTime;
    if (bool || _lastEventName != eventName) {
      _lastSendEvent = _currentTime;
      if (eventName != null && parametters != null) {
        // AnalyticsService.instance.logEventName(eventName, parameters: parametters);
        _lastEventName = eventName;
      } else if (eventName != null) {
        // AnalyticsService.instance.logViewStateName(eventName);
        _lastEventName = eventName;
      }
    }
    return true;
  }
}
