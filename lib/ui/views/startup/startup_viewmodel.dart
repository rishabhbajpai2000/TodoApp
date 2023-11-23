import 'package:stacked/stacked.dart';
import 'package:todo_app/app/app.locator.dart';
import 'package:todo_app/app/app.router.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:todo_app/services/login_service.dart';
import 'package:todo_app/services/subscription_service.dart';

class StartupViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _loginService = locator<LoginService>();
  final _subscriptionService = locator<SubscriptionService>();

  // Place anything here that needs to happen before we get into the application
  Future runStartupLogic() async {
    await Future.delayed(const Duration(seconds: 3));

    // This is where you can make decisions on where your app should navigate when
    // you have custom startup logic

    // _navigationService.replaceWithHomeView();
    bool hasLoggedInUser = await _loginService.isLoggedIn();

    if (hasLoggedInUser) {
      await _subscriptionService.handleSubscriptionApproval();
    }

    hasLoggedInUser
        ? _navigationService.replaceWith(Routes.notesHomePageView)
        : _navigationService.replaceWith(Routes.loginView);
  }
}
