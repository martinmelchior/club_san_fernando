import 'package:clubsanfernando/app/modules/csf/empleado/carnet/carnet_binding.dart';
import 'package:clubsanfernando/app/modules/csf/empleado/carnet/carnet_page.dart';
import 'package:clubsanfernando/app/modules/csf/empleado/home/empleado_home_binding.dart';
import 'package:clubsanfernando/app/modules/csf/empleado/home/empleado_home_page.dart';
import 'package:clubsanfernando/app/modules/csf/empleado/lectura_sin_control/lectura_sin_control_binding.dart';
import 'package:clubsanfernando/app/modules/csf/empleado/lectura_sin_control/lectura_sin_control_page.dart';
import 'package:clubsanfernando/app/modules/csf/empleado/leer_carnet/leer_carnet_socio_binding.dart';
import 'package:clubsanfernando/app/modules/csf/empleado/leer_carnet/leer_carnet_socio_page.dart';
import 'package:clubsanfernando/app/modules/csf/empleado/punto_de_control/punto_de_control_binding.dart';
import 'package:clubsanfernando/app/modules/csf/empleado/punto_de_control/punto_de_control_page.dart';
import 'package:clubsanfernando/app/modules/csf/empleado/tracking/tracking_binding.dart';
import 'package:clubsanfernando/app/modules/csf/empleado/tracking/tracking_page.dart';
import 'package:clubsanfernando/app/modules/genericos/close_session/close_session_binding.dart';
import 'package:clubsanfernando/app/modules/genericos/close_session/close_session_page.dart';
import 'package:clubsanfernando/app/modules/genericos/enviar123456/enviar123456_binding.dart';
import 'package:clubsanfernando/app/modules/genericos/enviar123456/enviar123456_page.dart';
import 'package:clubsanfernando/app/modules/genericos/home/home_binding.dart';
import 'package:clubsanfernando/app/modules/genericos/home/home_page.dart';
import 'package:clubsanfernando/app/modules/genericos/login/login_binding.dart';
import 'package:clubsanfernando/app/modules/genericos/login/login_page.dart';
import 'package:clubsanfernando/app/modules/genericos/password_change/password_change_binding.dart';
import 'package:clubsanfernando/app/modules/genericos/password_change/password_change_page.dart';
import 'package:clubsanfernando/app/modules/genericos/password_recovery/password_recovery_binding.dart';
import 'package:clubsanfernando/app/modules/genericos/password_recovery/password_recovery_page.dart';
import 'package:clubsanfernando/app/modules/genericos/redirect/redirect_binding.dart';
import 'package:clubsanfernando/app/modules/genericos/redirect/redirect_page.dart';
import 'package:clubsanfernando/app/modules/genericos/updater/updater_binding.dart';
import 'package:clubsanfernando/app/modules/genericos/updater/updater_page.dart';
import 'package:get/get.dart';

import 'routes_app.dart';


class AppPages {

  static final List<GetPage> pages = [
    
    //*  Clientes
    GetPage(name: AppRoutes.rHomeCliente, page: () => const HomePage(), binding: HomeBinding()),
    //*  Updater
    GetPage(name: AppRoutes.rUpdater,                  page: () => UpdaterPage(),              binding: UpdaterBinding()),
    GetPage(name: AppRoutes.rRedirect,                 page: () => RedirectPage(),             binding: RedirectBinding()),
    GetPage(name: AppRoutes.rLogin,                    page: () => LoginPage(),                binding: LoginBinding()),
    GetPage(name: AppRoutes.rCerrarSesion,             page: () => CloseSessionPage(),         binding: CloseSessionBinding()),
    GetPage(name: AppRoutes.rPasswordRecovery,         page: () => PasswordRecoveryPage(),     binding: PasswordRecoveryBinding()),
    GetPage(name: AppRoutes.rPasswordChange,           page: () => PasswordChangePage(),       binding: PasswordChangeBinding()),
    GetPage(name: AppRoutes.rEnviar123456,             page: () => Enviar123456Page(),         binding: Enviar123456Binding()),

    //* Club San Fernando
    GetPage(name: AppRoutes.rCSFEmpleadoHome,               page: () => const EmpleadoHomePage(),   binding: EmpleadoHomeBinding()),
    GetPage(name: AppRoutes.rCSFLecturaSinControl,          page: () => LecturaSinControlPage(),    binding: LecturaSinControlBinding()),
    GetPage(name: AppRoutes.rCSFValidarSocio,               page: () => LeerCarnetSocioPage(),      binding: LeerCarnetSocioBinding()),
    GetPage(name: AppRoutes.rCSFShowCarnetById,             page: () => const CarnetPage(),         binding: CarnetBinding()),
    GetPage(name: AppRoutes.rCSFSeleccionarPuntoDeControl,  page: () => PuntoDeControlPage(),       binding: PuntoDeControlBinding()),
    GetPage(name: AppRoutes.rCSFTrackingList,               page: () => TrackingPage(),             binding: TrackingBinding()),
  
  ];
}

