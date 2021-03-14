import 'package:dartmazing/Colors/Colors.dart';
import 'package:dartmazing/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'Routes/routes.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      theme: ThemeData(
        brightness: Brightness.light,
        backgroundColor: backgroundLight,
        textTheme: TextTheme(
          headline6: TextStyle(color: titleLight),
          subtitle2: TextStyle(color: subtitleLight),
          button: TextStyle(color: linkLight),
        ),
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        backgroundColor: backgroundDark,
        textTheme: TextTheme(
          headline6: TextStyle(color: titleDark),
          subtitle2: TextStyle(color: subtitleDark),
          button: TextStyle(color: linkDark),
        ),
      ),
      themeMode: ThemeMode.system,
      initialRoute: Routes.Feed,
      routes: RouterManager.routes(),
    )
  );
}