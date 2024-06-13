import 'package:flutter/material.dart';
import 'package:flutter_template/presentation/screens/index.dart';
import 'package:provider/provider.dart';
import 'package:flutter_template/domain/use_cases/index.dart';
import 'package:flutter_template/infrastructure/data_sources/index.dart';
import 'package:flutter_template/infrastructure/repositories/index.dart';
import 'package:flutter_template/presentation/providers/index.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final brandDataSource = BrandDataSourceImpl();
  final brandRepository = BrandRepositoryImpl(brandDataSource);
  final brandUseCase = BrandUseCaseImpl(brandRepository);

  final checkDataSource = CheckDataSourceImpl();
  final checkRepository = CheckRepositoryImpl(checkDataSource);
  final checkUseCase = CheckUseCaseImpl(checkRepository);

  final followDataSource = FollowDataSourceImpl();
  final followRepository = FollowRepositoryImpl(followDataSource);
  final followUseCase = FollowUseCaseImpl(followRepository);

  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  runApp(MyApp(
    navigatorKey: navigatorKey,
    brandUseCase: brandUseCase,
    checkUseCase: checkUseCase,
    followUseCase: followUseCase,
  ));
}

class MyApp extends StatelessWidget {
  final GlobalKey<NavigatorState> navigatorKey;
  final BrandUseCase brandUseCase;
  final CheckUseCase checkUseCase;
  final FollowUseCase followUseCase;

  const MyApp({
    Key? key,
    required this.navigatorKey,
    required this.brandUseCase,
    required this.checkUseCase,
    required this.followUseCase,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => BrandProvider(brandUseCase),
        ),
        ChangeNotifierProvider(
          create: (_) => CheckProvider(checkUseCase),
        ),
        ChangeNotifierProvider(
          create: (_) => FollowProvider(followUseCase),
        ),
        ChangeNotifierProvider(
          create: (_) => FollowDetailProvider(followUseCase),
        ),
      ],
      child: MaterialApp(
        title: 'MecaniXpert-App',
        debugShowCheckedModeBanner: false,
        home: const WelcomeScreen(),
        navigatorKey: navigatorKey,
      ),
    );
  }
}
