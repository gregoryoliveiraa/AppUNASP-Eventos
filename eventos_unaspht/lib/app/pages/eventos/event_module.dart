import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'event_bloc.dart';
import 'event_page.dart';

class EventModule extends ModuleWidget {
  @override
  List<Bloc> get blocs => [
        Bloc((i) => EventBloc()),
      ];

  @override
  List<Dependency> get dependencies => [];

  @override
  Widget get view => EventPage();

  static Inject get to => Inject<EventModule>.of();
}