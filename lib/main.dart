import 'package:data/data.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mpc_flutter/src/features/diary/diary.dart';
import 'package:mpc_flutter/src/utils/utils.dart';

void main() {
  runApp(ModularApp(module: AppModule(), child: const MpcApp()));
}

class AppModule extends Module {
  @override
  List<Module> get imports => [DataModule()];
}

class MpcApp extends StatelessWidget {
  const MpcApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) {
            return DiaryCubit(
              UploadImages(Modular.get<DiaryRepository>()),
              AddImage(Modular.get<DiaryRepository>()),
            );
          },
        ),
      ],
      child: MaterialApp(
        title: 'MPC',
        theme: AppTheme.themeData,
        home: const NewDiaryPage(),
      ),
    );
  }
}
