// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Dartmazing`
  String get aplicationName {
    return Intl.message(
      'Dartmazing',
      name: 'aplicationName',
      desc: '',
      args: [],
    );
  }

  /// `BEST REPOSITORIES`
  String get bestRepositories {
    return Intl.message(
      'BEST REPOSITORIES',
      name: 'bestRepositories',
      desc: '',
      args: [],
    );
  }

  /// `Renowned repositories`
  String get renownedRepositories {
    return Intl.message(
      'Renowned repositories',
      name: 'renownedRepositories',
      desc: '',
      args: [],
    );
  }

  /// `The best tools`
  String get bestTools {
    return Intl.message(
      'The best tools',
      name: 'bestTools',
      desc: '',
      args: [],
    );
  }

  /// `UPDATED REPOSITORIES`
  String get updatedRepositories {
    return Intl.message(
      'UPDATED REPOSITORIES',
      name: 'updatedRepositories',
      desc: '',
      args: [],
    );
  }

  /// `The latest updates`
  String get theLatestUpdates {
    return Intl.message(
      'The latest updates',
      name: 'theLatestUpdates',
      desc: '',
      args: [],
    );
  }

  /// `Most updated repositories`
  String get mostUpdatedRepositories {
    return Intl.message(
      'Most updated repositories',
      name: 'mostUpdatedRepositories',
      desc: '',
      args: [],
    );
  }

  /// `stars`
  String get stars {
    return Intl.message(
      'stars',
      name: 'stars',
      desc: '',
      args: [],
    );
  }

  /// `Last update`
  String get lastUpdate {
    return Intl.message(
      'Last update',
      name: 'lastUpdate',
      desc: '',
      args: [],
    );
  }

  /// `forks`
  String get forks {
    return Intl.message(
      'forks',
      name: 'forks',
      desc: '',
      args: [],
    );
  }

  /// `issues`
  String get issues {
    return Intl.message(
      'issues',
      name: 'issues',
      desc: '',
      args: [],
    );
  }

  /// `Try again`
  String get tryAgain {
    return Intl.message(
      'Try again',
      name: 'tryAgain',
      desc: '',
      args: [],
    );
  }

  /// `An error has occurred, pull to try again`
  String get anErrorHappened {
    return Intl.message(
      'An error has occurred, pull to try again',
      name: 'anErrorHappened',
      desc: '',
      args: [],
    );
  }

  /// `See repository`
  String get seeRepository {
    return Intl.message(
      'See repository',
      name: 'seeRepository',
      desc: '',
      args: [],
    );
  }

  /// `Most popular`
  String get topRepos {
    return Intl.message(
      'Most popular',
      name: 'topRepos',
      desc: '',
      args: [],
    );
  }

  /// `Last updates`
  String get lastUpdated {
    return Intl.message(
      'Last updates',
      name: 'lastUpdated',
      desc: '',
      args: [],
    );
  }

  /// `See more`
  String get seeMore {
    return Intl.message(
      'See more',
      name: 'seeMore',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'pt', countryCode: 'BR'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
