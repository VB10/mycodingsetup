import 'package:flutter/cupertino.dart';
import 'package:kartal/kartal.dart';
import 'package:mycodingsetup/feature/models/user_detail.dart';
import 'package:mycodingsetup/feature/view_model/index.dart';

import 'package:mycodingsetup/feature/views/home/home_form_view.dart';

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
    _controlFirstUserDetail();
  }

  Future<void> _controlFirstUserDetail() async {
    final userDetail = await _homeFormViewModel.checkUserBasicInformation();
    if (userDetail == null) return;
    _updateControllerFromUserDetail(userDetail);
  }

  bool _isFormValidate = false;

  void onFormUpdate() {
    if (_formKey.currentState == null) return;
    if (_isFormValidate == true) return;
    if (!_formKey.currentState!.validate()) return;
    _isFormValidate = true;
    isButtonEnabledNotifier.value = true;
  }

  void _updateControllerFromUserDetail(UserDetail userDetail) {
    _computerController.text = userDetail.computer ?? '';
    _computerUrlController.text = userDetail.computerUrl ?? '';
    _extensionsController.text = userDetail.extensions?.join(',') ?? '';
    _settingValueController.text = userDetail.settingValue ?? '';
    _themeController.text = userDetail.theme ?? '';
  }

  /// When user filled all data then we are putting data to backend
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

  bool get isEmpty =>
      computerName.isEmpty ||
      computerUrl.isEmpty ||
      extensions.isEmpty ||
      settingValue.isEmpty ||
      theme.isEmpty;
}
