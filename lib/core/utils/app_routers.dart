// lib/core/utils/app_routers.dart
import 'package:amimooo/features/auth/presentation/views/create_new_passward_view.dart';
import 'package:amimooo/features/auth/presentation/views/forget_passward_view.dart';
import 'package:amimooo/features/auth/presentation/views/login_view.dart';
import 'package:amimooo/features/auth/presentation/views/otp_verification_view.dart';
import 'package:amimooo/features/auth/presentation/views/sign_up_view.dart';
import 'package:amimooo/features/home/data/models/product_model.dart';
import 'package:amimooo/features/home/presentation/views/add_card_view.dart';
import 'package:amimooo/features/home/presentation/views/address_view.dart';
import 'package:amimooo/features/home/presentation/views/detiles_view.dart';
import 'package:amimooo/features/home/presentation/views/home_view.dart';
import 'package:amimooo/features/home/presentation/views/payment_success_view.dart';
import 'package:amimooo/features/home/presentation/views/place_order_view.dart';
import 'package:amimooo/features/splash/views/splash_view.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouters {
  static const homeView = '/homeView';
  static const loginView = '/LoginView';
  static const signupView = '/SignUpView';
  static const forgetPasswardView = '/ForgetPasswardView';
  static const otpVerificationView = '/OtpVerificationView';
  static const createNewPasswardView = '/CreateNewPasswardView';
  static const detilesView = '/DetilesView';
  static const placeOrderView = '/PlaceOrderView';
  static const addressView = '/AddressView';
  static const addCardView = '/AddCardView';
  static const paymentSuccessView = '/PaymentSuccessView';

  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: loginView,
        builder: (context, state) => const LoginView(),
      ),
      GoRoute(
        path: homeView,
        builder: (context, state) => const HomeView(),
      ),
      GoRoute(
        path: placeOrderView,
        builder: (context, state) {
          final totalPrice =
              state.extra is double ? state.extra as double : 0.0;
          return PlaceOrderView(totalPrice: totalPrice);
        },
      ),
      GoRoute(
        path: addressView,
        builder: (context, state) => const AddressView(),
      ),
      GoRoute(
        path: paymentSuccessView,
        builder: (context, state) {
          final paymentId = state.extra as String;
          return PaymentSuccessView(paymentId: paymentId);
        },
      ),
      GoRoute(
        path: addCardView,
        builder: (context, state) => const AddCardView(),
      ),
      GoRoute(
        path: signupView,
        builder: (context, state) => const SignupView(),
      ),
      GoRoute(
        path: forgetPasswardView,
        builder: (context, state) => const ForgetPasswardView(),
      ),
      GoRoute(
        path: otpVerificationView,
        builder: (context, state) => const OtpVerificationView(),
      ),
      GoRoute(
        path: createNewPasswardView,
        builder: (context, state) => const CreateNewPasswardView(),
      ),
      GoRoute(
        path: detilesView,
        builder: (context, state) {
          final product = state.extra as ProductModel;
          return DetilesView(product: product);
        },
      ),
    ],
  );
}
