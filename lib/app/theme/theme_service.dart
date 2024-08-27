import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:live_chat/app/theme/theme_enum.dart';
import 'package:live_chat/base/utils/light_model.dart';

class ThemeService extends GetxController {
  /// SharedPreferences instance

  /// All supported languages should be reflected here.
  // final List<LanguageEnum> supportedLanguages;

  RxBool isDarkMode = false.obs;

  RxBool isSystemDarkMode = false.obs;

  RxBool followSystem = true.obs; // Dark mode following system

  final Rx<ThemeEnum> _themesEnum =
      ThemeEnum.defaultThemeE.obs; // Initialize to blueDelight theme
  // final Rx<LanguageEnum> language = LanguageEnum.enUS.obs;

  ThemeService();

  factory ThemeService.obtain(){
    return Get.find<ThemeService>();
  }

  @override
  void onInit() {
    super.onInit();
    _loadAppServiceSettings();

    // 监听系统深色模式的变化
    WidgetsBinding.instance.platformDispatcher.onPlatformBrightnessChanged =
        () {
      isSystemDarkMode.value =
          WidgetsBinding.instance.platformDispatcher.platformBrightness ==
              Brightness.dark;
      if (followSystem.value) {
        // 如果跟随系统，则根据系统深色模式更新暗黑模式
        isDarkMode.value = isSystemDarkMode.value;
        saveFollowSystem();
        saveDarkMode();
      }
      _updateTheme();
    };

    _updateTheme();
  }

  // Load status from SharedPreferences
  Future<void> _loadAppServiceSettings() async {
    // Load theme
    var themeEnumString = await storageKV.getString(key: 'themeEnum');

    // Load dark mode state
    var isDarkModeValue = await storageKV.getBool('isDarkMode');

    // Load follow system state
    var followSystemValue = await storageKV.getBool('followSystem');

    followSystem.value = followSystemValue??false;

    if (themeEnumString != null) {
      ThemeEnum themeEnum = ThemeEnum.values
          .firstWhere((e) => e.toString() == themeEnumString);

      if (isDarkModeValue != null) {
        isDarkMode.value = isDarkModeValue;
      }

      // Update color theme
      setColorTheme(themeEnum);
    }
    // 检查系统深色模式状态
    isSystemDarkMode.value =
        WidgetsBinding.instance.platformDispatcher.platformBrightness ==
            Brightness.dark;

  }

  /// Get the current theme data,
  /// which is generally used for application
  /// initialization.
  ThemeData get currentTheme {
    return getThemeData(_themesEnum.value);
  }

  ThemeEnum get currentThemeEnum => _themesEnum.value;


  /// Set a new color theme
  /// - themeEnum: Enumeration value representing language theme.
  void setColorTheme(ThemeEnum themeEnum) {
    _themesEnum.value = themeEnum;
    _updateTheme();
    saveColorTheme();
  }

  void _updateTheme() {
    Get.changeTheme(getThemeData(_themesEnum.value));
    Get.forceAppUpdate();
  }

  void setDarkMode() {
    followSystem.value = false;
    isDarkMode.value = true;
    _updateTheme();
    saveFollowSystem();
    saveDarkMode();
  }

  void setLightMode() {
    followSystem.value = false;
    isDarkMode.value = false;
    _updateTheme();
    saveFollowSystem();
    saveDarkMode();
  }

  /// Toggle dark mode
  void toggleDarkMode() {
    followSystem.value = false;
    isDarkMode.value = !isDarkMode.value;
    // Update dark mode
    setColorTheme(_themesEnum.value);
    saveFollowSystem();
    saveDarkMode();
  }


  /// Save color theme state
  Future<void> saveColorTheme() async {
    storageKV.setString('themeEnum', _themesEnum.value.toString());
  }

  /// Save dark mode state
  Future<void> saveDarkMode() async {
    storageKV.setBool('isDarkMode', isDarkMode.value);
  }

  /// Save follow system state
  Future<void> saveFollowSystem() async {
    storageKV.setBool('followSystem', followSystem.value);
  }

}
