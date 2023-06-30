import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'theme_state.dart';
part 'theme_event.dart';

class ThemeBloc extends HydratedBloc<ThemeEvent, ThemeState> {
  String? fontFamily = 'Nunito';

  ThemeBloc()
      : super(const SetThemeState(
          themeMode: ThemeMode.system,
          showOutlines: false,
          cornerRadius: 5,
          primaryColor: Color(0xff3FA796),
          fontFamily: 'Nunito',
          readTabFirst: true,
          useMaterialYou: true,
        )) {
    on<ChangeThemeEvent>((event, emit) {
      fontFamily = event.fontFamily;

      emit(const ChangingThemeState());

      emit(SetThemeState(
        themeMode: event.themeMode,
        showOutlines: event.showOutlines,
        cornerRadius: event.cornerRadius,
        primaryColor: event.primaryColor,
        fontFamily: fontFamily,
        readTabFirst: event.readTabFirst,
        useMaterialYou: event.useMaterialYou,
      ));
    });
  }

  @override
  ThemeState? fromJson(Map<String, dynamic> json) {
    final themeState = json['theme_state'] as int?;
    final showOutlines = json['show_outlines'] as bool?;
    final cornerRadius = json['corner_radius'] as double?;
    final primaryColor = json['primary_color'] as int?;
    final fontFamily = json['font_family'] as String?;
    final readTabFirst = json['read_tab_first'] as bool?;
    final useMaterialYou = json['use_material_you'] as bool?;

    switch (themeState) {
      case 1:
        return SetThemeState(
          themeMode: ThemeMode.light,
          showOutlines: showOutlines ?? false,
          cornerRadius: cornerRadius ?? 5,
          primaryColor: Color(primaryColor ?? 0xff2146C7),
          fontFamily: fontFamily ?? 'Nunito',
          readTabFirst: readTabFirst ?? true,
          useMaterialYou: useMaterialYou ?? true,
        );
      case 2:
        return SetThemeState(
          themeMode: ThemeMode.dark,
          showOutlines: showOutlines ?? false,
          cornerRadius: cornerRadius ?? 5,
          primaryColor: Color(primaryColor ?? 0xff2146C7),
          fontFamily: fontFamily ?? 'Nunito',
          readTabFirst: readTabFirst ?? true,
          useMaterialYou: useMaterialYou ?? true,
        );
      default:
        return SetThemeState(
          themeMode: ThemeMode.system,
          showOutlines: showOutlines ?? false,
          cornerRadius: cornerRadius ?? 5,
          primaryColor: Color(primaryColor ?? 0xff2146C7),
          fontFamily: fontFamily ?? 'Nunito',
          readTabFirst: readTabFirst ?? true,
          useMaterialYou: useMaterialYou ?? true,
        );
    }
  }

  @override
  Map<String, dynamic>? toJson(ThemeState state) {
    if (state is SetThemeState) {
      switch (state.themeMode) {
        case ThemeMode.light:
          return {
            'theme_state': 1,
            'show_outlines': state.showOutlines,
            'corner_radius': state.cornerRadius,
            'primary_color': state.primaryColor.value,
            'font_family': state.fontFamily,
            'read_tab_first': state.readTabFirst,
            'use_material_you': state.useMaterialYou,
          };
        case ThemeMode.dark:
          return {
            'theme_state': 2,
            'show_outlines': state.showOutlines,
            'corner_radius': state.cornerRadius,
            'primary_color': state.primaryColor.value,
            'font_family': state.fontFamily,
            'read_tab_first': state.readTabFirst,
            'use_material_you': state.useMaterialYou,
          };
        case ThemeMode.system:
          return {
            'theme_state': 0,
            'show_outlines': state.showOutlines,
            'corner_radius': state.cornerRadius,
            'primary_color': state.primaryColor.value,
            'font_family': state.fontFamily,
            'read_tab_first': state.readTabFirst,
            'use_material_you': state.useMaterialYou,
          };
      }
    } else {
      return {
        'theme_state': 0,
        'show_outlines': false,
        'corner_radius': 5,
        'primary_color': null,
        'font_family': null,
        'read_tab_first': null,
        'use_material_you': null,
        'locale': null,
      };
    }
  }
}
