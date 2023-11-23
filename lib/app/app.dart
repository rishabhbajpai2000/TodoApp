import 'package:todo_app/ui/bottom_sheets/notice/notice_sheet.dart';
import 'package:todo_app/ui/dialogs/info_alert/info_alert_dialog.dart';
import 'package:todo_app/ui/views/home/home_view.dart';
import 'package:todo_app/ui/views/startup/startup_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:todo_app/services/c_r_u_d_notes_service.dart';
import 'package:todo_app/ui/views/notes_home_page/notes_home_page_view.dart';
import 'package:todo_app/services/login_service.dart';
import 'package:todo_app/services/subscription_service.dart';
import 'package:todo_app/ui/views/login/login_view.dart';
import 'package:todo_app/ui/views/verifyotp/verifyotp_view.dart';
import 'package:todo_app/services/firebase_deep_link_service.dart';
// @stacked-import

@StackedApp(
  logger: StackedLogger(),
  routes: [
    MaterialRoute(page: HomeView),
    MaterialRoute(page: StartupView),
    MaterialRoute(page: NotesHomePageView),
    MaterialRoute(page: LoginView),
    MaterialRoute(page: VerifyotpView),
// @stacked-route
  ],
  dependencies: [
    LazySingleton(classType: BottomSheetService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: CRUDNotesService),
    LazySingleton(classType: LoginService),
    LazySingleton(classType: SubscriptionService),
    LazySingleton(classType: FirebaseDeepLinkService),
// @stacked-service
  ],
  bottomsheets: [
    StackedBottomsheet(classType: NoticeSheet),
    // @stacked-bottom-sheet
  ],
  dialogs: [
    StackedDialog(classType: InfoAlertDialog),
    // @stacked-dialog
  ],
)
class App {}
