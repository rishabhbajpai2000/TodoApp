import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:todo_app/app/app.locator.dart';
import 'package:todo_app/app/app.router.dart';
// import 'package:todo_app/services/login_service.dart';
import 'package:todo_app/ui/views/verify_o_t_p/verify_o_t_p_view.form.dart';
// import 'package:todo_app/ui/views/verifyotp/verifyotp_view.form.dart';

import '../../../services/login_service_service.dart';

class VerifyotpViewModel extends FormViewModel {
  final String mobileNumber;

  VerifyotpViewModel(this.mobileNumber);

  final _loginService = locator<LoginService>();
  final _navigationService = locator<NavigationService>();

  String text = '000000';

  verifyOTP() async {
    await _loginService.verifyOTP(mobileNumber, oTPNumberValue!);
    _navigationService.clearStackAndShow(Routes.notesHomePageView);
    //_navigationService.replaceWithStartupView();
  }
}
