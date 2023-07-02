import 'package:flutter/cupertino.dart';
import 'package:kartal/kartal.dart';
import 'package:mycodingsetup/feature/view_model/home_form_view_model.dart';
import 'package:mycodingsetup/feature/views/home_form_view.dart';

mixin HomeFormViewMixin on State<HomeFormView> {
  final TextEditingController _computerController = TextEditingController();
  final TextEditingController _computerUrlController = TextEditingController();
  final TextEditingController _extensionsController = TextEditingController();
  final TextEditingController _settingValueController = TextEditingController();
  final TextEditingController _themeController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final ValueNotifier<bool> isButtonEnabledNotifier =
      ValueNotifier<bool>(false);
  late final HomeFormViewModel _homeFormViewModel;

  @override
  void initState() {
    super.initState();
    _homeFormViewModel = HomeFormViewModel(widget.user);
  }

  bool _isFormValidate = false;

  void onFormUpdate() {
    if (_formKey.currentState == null) return;
    if (_isFormValidate == true) return;
    if (!_formKey.currentState!.validate()) return;
    _isFormValidate = true;
    isButtonEnabledNotifier.value = true;
  }

  Future<void> onSavePressed() async {
    final response = await _homeFormViewModel.saveUserDataToBackend(
      HomeFormModel(
        computerName: _computerController.text,
        computerUrl: _computerUrlController.text,
        extensions: _extensionsController.text,
        settingValue: _settingValueController.text,
        theme: _themeController.text,
      ),
    );
    if (!mounted) return;
    await context.route.pop(response);
  }

  @override
  void dispose() {
    super.dispose();
    _computerController.dispose();
    _computerUrlController.dispose();
    _extensionsController.dispose();
    _settingValueController.dispose();
    _themeController.dispose();
  }

  GlobalKey<FormState> get formKey => _formKey;
  TextEditingController get computerController => _computerController;
  TextEditingController get computerUrlController => _computerUrlController;
  TextEditingController get extensionsController => _extensionsController;
  TextEditingController get settingValueController => _settingValueController;
  TextEditingController get themeController => _themeController;
}

final class HomeFormModel {
  HomeFormModel({
    required this.computerName,
    required this.computerUrl,
    required this.extensions,
    required this.settingValue,
    required this.theme,
  });

  final String computerName;
  final String computerUrl;
  final String extensions;
  final String settingValue;
  final String theme;
}
