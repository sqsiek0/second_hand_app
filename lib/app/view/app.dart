import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:second_hand_app/app/bloc/app_bloc.dart';
import 'package:second_hand_app/app/constants/enum/enums.dart';
import 'package:second_hand_app/app/services/supabase_functions.dart';
import 'package:second_hand_app/l10n/l10n.dart';
import 'package:second_hand_app/onboarding/view/onboarding_page.dart';
import 'package:second_hand_app/onboarding/view/widgets/initial_page.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        ),
        useMaterial3: true,
      ),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      home: BlocProvider(
        create: (context) => AppBloc(supabaseFunctions: SupabaseFunctions())
          ..add(
            AppCheckSesion(),
          ),
        child: BlocBuilder<AppBloc, AppState>(
          builder: (context, state) {
            switch (state.appState) {
              case AppStateEnum.initial:
                return const InitialPage();
              case AppStateEnum.unautorized:
                return const OnBoardingPage();
              case AppStateEnum.autorized:
                return Material(
                  child: InkWell(
                    onTap: () =>
                        context.read<AppBloc>().add(AppLogoutUserEvent()),
                    child: const Text('Zalogowany'),
                  ),
                );
            }
          },
        ),
      ),
    );
  }
}
