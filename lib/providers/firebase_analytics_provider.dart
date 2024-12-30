import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final firebaseAnalyticsProvider = Provider<FirebaseAnalytics>((ref) {
  FirebaseAnalytics analytics = FirebaseAnalytics.instance;
  return analytics;
});

final firebaseAnalyticsObserverProvider =
    Provider<FirebaseAnalyticsObserver>((ref) {
  final analytics = ref.watch(firebaseAnalyticsProvider);

  FirebaseAnalyticsObserver observer =
      FirebaseAnalyticsObserver(analytics: analytics);
  return observer;
});
