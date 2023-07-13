import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:mycodingsetup/feature/models/index.dart';

import 'package:mycodingsetup/feature/views/home/mixin/home_form_view_mixin.dart';

class HomeFormView extends StatefulWidget {
  const HomeFormView({required this.user, super.key});
  final User user;
  @override
  State<HomeFormView> createState() => _HomeFormViewState();
}

class _HomeFormViewState extends State<HomeFormView> with HomeFormViewMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.user.name ?? '',
        ),
        actions: [
          if (widget.user.photo.ext.isNotNullOrNoEmpty)
            CircleAvatar(
              backgroundImage: NetworkImage(widget.user.photo!),
            ),
        ],
      ),
      body: Form(
        key: formKey,
        onChanged: onFormUpdate,
        child: SingleChildScrollView(
          child: Column(
            children: [
              _FormController(
                userNameController: computerController,
                hint: 'Computer name',
              ),
              _FormController(
                userNameController: computerUrlController,
                hint: 'Computer url',
              ),
              _FormController(
                userNameController: extensionsController,
                hint: 'Extensions',
              ),
              _FormController(
                userNameController: settingValueController,
                hint: 'Setting value',
              ),
              _FormController(
                userNameController: themeController,
                hint: 'Theme',
              ),
              ValueListenableBuilder(
                valueListenable: isButtonEnabledNotifier,
                builder: (context, value, child) {
                  return ElevatedButton(
                    onPressed: !value ? null : onSavePressed,
                    child: const Text('Save'),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}

class _FormController extends StatelessWidget {
  const _FormController({
    required TextEditingController userNameController,
    required this.hint,
  }) : _userNameController = userNameController;

  final TextEditingController _userNameController;
  final String hint;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.padding.onlyTopLow,
      child: TextFormField(
        controller: _userNameController,
        maxLines: null,
        validator: (value) => value!.isEmpty ? 'Cannot be empty' : null,
        decoration: InputDecoration(
          hintText: hint,
          border: const OutlineInputBorder(),
        ),
      ),
    );
  }
}
