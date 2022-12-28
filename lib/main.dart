import 'package:flutter/material.dart';
import 'package:homework_13/business/flutter_bloc/models/cart_action.dart';

import 'package:homework_13/ui/provider/provider.dart';
import 'package:homework_13/ui/riverpod/riverpod.dart';
import 'package:homework_13/ui/hooks_riverpod/hooks_riverpod.dart';

import 'package:homework_13/ui/bloc/bloc.dart';
import 'package:homework_13/ui/flutter_bloc/flutter_bloc.dart';

import 'package:homework_13/ui/redux/flutter_redux.dart';

import 'package:homework_13/ui/mobx/mobx.dart';

// Simple State Management
// void main() => runApp(const Provider());

// flutter_riverpod
// void main() => runApp(const Riverpod());

// hooks_riverpod.dart
// void main() => runApp(const HooksRiverpod());

// bloc
// void main() => runApp(const BlocStream());

// flutter_bloc
void main() => runApp(FlutterBloc(cartAction: CartAction()));

// redux
// void main() => runApp(const FlutterRedux());

// mobx
// void main() => runApp(const MobX());
