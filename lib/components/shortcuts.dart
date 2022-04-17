import 'package:quick_actions/quick_actions.dart';

class ShortcutItems {
  static final items = <ShortcutItem>[
    actionLength,
    actionVolume,
    actionWeight,
    actionTemperature,
  ];

  static final actionLength = const ShortcutItem(
    type: 'action_length',
    localizedTitle: 'See Length',
    icon: 'icon_length', // Alterar o nome do icon
  );

  static final actionVolume = const ShortcutItem(
    type: 'action_volume',
    localizedTitle: 'See Volume',
    icon: 'icon_volume', // Alterar o nome do icon
  );

  static final actionWeight = const ShortcutItem(
    type: 'action_Weight',
    localizedTitle: 'See Weight',
    icon: 'icon_weight', // Alterar o nome do icon
  );

  static final actionTemperature = const ShortcutItem(
    type: 'action_temperature',
    localizedTitle: 'See Temperature',
    icon: 'icon_temperature', // Alterar o nome do icon
  );
}
