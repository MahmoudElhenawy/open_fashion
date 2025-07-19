import 'package:amimooo/core/utils/app_routers.dart';
import 'package:amimooo/core/utils/service_locator.dart';
import 'package:amimooo/features/auth/presentation/manger/registerr_cubit/register_cubit.dart';
import 'package:amimooo/features/home/data/repos/home_repo_impl.dart';
import 'package:amimooo/features/home/presentation/manger/card_product_cubit/product_cubit.dart';
import 'package:amimooo/features/home/presentation/manger/image_product_cubit/image_cubit.dart';
import 'package:amimooo/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  setupServiceLocator();
  runApp(const Animooo());
}

class Animooo extends StatelessWidget {
  const Animooo({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ProductCubit(
            getIt.get<HomeRepoImpl>(),
          )..fetchProducts(),
        ),
        BlocProvider(
          create: (context) => ImageCubit(
            getIt.get<HomeRepoImpl>(),
          )..fetchImageProducts(),
        ),
        BlocProvider(
          create: (context) => RegisterCubit(),
        )
      ],
      child: MaterialApp.router(
        routerConfig: AppRouters.router,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
