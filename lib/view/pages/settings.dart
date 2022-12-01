import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:motorcycle/core/app/themes.dart';

import '../../core/bloc/theme/theme_cubit.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  late ThemeCubit themeCubit;
  bool _themeSwitchValue = false;

  void setDefaultValues() async {
    final theme = await themeCubit.currentTheme;
    setState(() => _themeSwitchValue = theme.toString() == Themes.darkID);
  }

  @override
  void initState() {
    themeCubit = BlocProvider.of<ThemeCubit>(context);
    setDefaultValues();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 7),
      child: Column(
        children: [
          const Divider(height: 2),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Theme',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              CupertinoSwitch(
                activeColor: const Color(0xFFC72159),
                value: _themeSwitchValue,
                onChanged: (value) async {
                  final themeName = value ? Themes.darkID : Themes.lightID;
                  setState(() => _themeSwitchValue = value);
                  await themeCubit.changeTheme(themeName);
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
