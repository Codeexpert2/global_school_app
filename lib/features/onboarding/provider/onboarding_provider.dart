import 'package:hooks_riverpod/hooks_riverpod.dart';

class OnboardingState extends StateNotifier<int> {
  OnboardingState() : super(0);

  void setPage(int pageIndex) {
    state = pageIndex;
  }
}

final onboardingProvider = StateNotifierProvider<OnboardingState, int>((ref) {
  return OnboardingState();
});
