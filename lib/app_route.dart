import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'core/not_found_screen.dart';
import 'features/add_doctor/presentation/add_doctor.dart';
import 'features/appointment/presentation/appointmet.dart';
import 'features/auth/presentation/screen/login_screen.dart';
import 'features/cancel_appointmet/presentation/cancel_appointment.dart';
import 'features/home_screen/home_screen_view.dart';
import 'features/landing/presentation/screen/landing_Screen.dart';
import 'features/list_doctor/presentation/doctor_details.dart';
import 'features/list_doctor/presentation/list_doctor.dart';
import 'features/prescription_upload/presentation/prescription_upload.dart';
import 'features/report_upload/presentation/report_upload.dart';

class AppRoute {
  static String home = '/consol';

  static String login = '/';
  static String addDoctor = '/consol/addDoctor';
  static String listDoctor = '/consol/listDoctor';
  static String detailsDoctor = '/consol/detailsDoctor';
  static String appoinments = '/consol/appoinments';
  static String cancledAppoinments = '/consol/cancledAppoinments';
  static String prescriptionUpload = '/consol/prescriptionUpload';
  static String reportUpload = '/consol/reportUpload';
}

final GoRouter router = GoRouter(
  initialLocation: '/',
  debugLogDiagnostics: true,
  errorBuilder: (context, state) => const NotFoundScreen(),
  routes: [
    GoRoute(
      path: "/",
      pageBuilder: pageBuilder(const LoginScreen()),
      
    ),
    migo,
  ],
);

final ShellRoute migo = ShellRoute(
    builder: (context, state, child) => LandingScreen(child: child),
    routes: [
      GoRoute(
        path: "/consol",
        pageBuilder: pageBuilder(const HomeScreenView()),
      ),
      GoRoute(
        path: "/consol/appoinments",
        pageBuilder: pageBuilder(const AppointmentView()),
      ),
      GoRoute(
        path: "/consol/cancledAppoinments",
        pageBuilder: pageBuilder(const CancelAppointmet()),
      ),
      GoRoute(
        path: "/consol/addDoctor",
        pageBuilder: pageBuilder(const AddDoctor()),
      ),
      GoRoute(
        path: "/consol/listDoctor",
        pageBuilder: pageBuilder(const ListDoctor()),
      ),
      GoRoute(
        path: "/consol/detailsDoctor",
        pageBuilder: pageBuilder(DoctorDetails()),
      ),
      GoRoute(
        path: "/consol/prescriptionUpload",
        pageBuilder: pageBuilder(const PrescriptionUpload()),
      ),
      GoRoute(
        path: "/consol/reportUpload",
        pageBuilder: pageBuilder(const ReportUpload()),
      ),
    ]);

Page<T> Function(BuildContext, GoRouterState) pageBuilder<T>(
  final Widget child,
) =>
    (context, state) => SnapPage(child: child);

class SnapPage<T> extends CustomTransitionPage<T> {
  SnapPage({required super.child, super.arguments})
      : super(
          transitionsBuilder: (_, __, ___, child) => child,
          transitionDuration: Duration.zero,
          reverseTransitionDuration: Duration.zero,
        );
}
