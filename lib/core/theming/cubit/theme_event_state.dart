import 'package:Mowater/core/theming/cubit/theme_event_cubit.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'theme_event_state.freezed.dart';

@freezed
class ThemeEventState with _$ThemeEventState {
  const factory ThemeEventState.initial() = _Initial;
  const factory ThemeEventState.themeChanged(ThemeData theme) = _ThemeChanged;

  // Add a private named constructor for the class
  const ThemeEventState._();

  // Add the getter for the theme
  ThemeData get theme {
    return when(
      initial: () => lightMode,
      themeChanged: (theme) => theme,
    );
  }
}
