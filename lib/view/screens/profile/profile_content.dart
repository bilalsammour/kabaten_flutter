import 'package:flutter/material.dart';
import 'package:kabaten/business/profile/profile_view_model.dart';
import 'package:kabaten/business/shared/view_model_exception.dart';
import 'package:kabaten/generated/l10n.dart';
import 'package:kabaten/models/user/user_model.dart';
import 'package:kabaten/utils/form_validator.dart';
import 'package:kabaten/view/resources/app_resources.dart';
import 'package:kabaten/view/utils/dialogs_manager.dart';
import 'package:provider/provider.dart';

class ProfileContent extends StatefulWidget {
  final UserModel item;

  const ProfileContent({
    super.key,
    required this.item,
  });

  @override
  State<ProfileContent> createState() => _ProfileContentState();
}

class _ProfileContentState extends State<ProfileContent> {
  final _formKey = GlobalKey<FormState>();

  final _fullNameController = TextEditingController();
  final _genderController = TextEditingController();
  final _phoneNumberController = TextEditingController();
  final _bioController = TextEditingController();

  @override
  void initState() {
    super.initState();

    _fullNameController.text = widget.item.fullName;
    _genderController.text = widget.item.gender;
    _phoneNumberController.text = widget.item.phoneNumber;
    _bioController.text = widget.item.bio;
  }

  @override
  void dispose() {
    _fullNameController.dispose();
    _genderController.dispose();
    _phoneNumberController.dispose();
    _bioController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) => SingleChildScrollView(
        child: Column(
          children: [
            //UserImage(item: widget.item),
            Form(
              key: _formKey,
              child: _buildFormContent(),
            ),
          ],
        ),
      );

  Widget _buildFormContent() => Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextFormField(
            controller: _fullNameController,
            textCapitalization: TextCapitalization.words,
            keyboardType: TextInputType.name,
            autofillHints: const [AutofillHints.name],
            decoration: InputDecoration(
              labelText: S.current.fullName,
            ),
            validator: FormValidator.person(),
          ),
          const SizedBox(height: AppDimensions.mainSpace),
          TextFormField(
            controller: _genderController,
            textCapitalization: TextCapitalization.words,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              labelText: S.current.gender,
            ),
            validator: FormValidator.required(),
          ),
          const SizedBox(height: AppDimensions.mainSpace),
          TextFormField(
            controller: _phoneNumberController,
            textCapitalization: TextCapitalization.sentences,
            keyboardType: TextInputType.phone,
            autofillHints: const [AutofillHints.telephoneNumber],
            decoration: InputDecoration(
              labelText: S.current.phoneNumber,
            ),
            validator: FormValidator.required(),
          ),
          const SizedBox(height: AppDimensions.mainSpace),
          TextFormField(
            controller: _bioController,
            textCapitalization: TextCapitalization.sentences,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              labelText: S.current.bio,
            ),
          ),
          const SizedBox(height: AppDimensions.doubleMainSpace),
          ElevatedButton.icon(
            onPressed: () => _save(),
            icon: const Icon(
              AppIcons.save,
            ),
            label: Text(
              S.current.save,
            ),
          ),
          const SizedBox(height: AppDimensions.mainSpace),
          TextButton(
            onPressed: () => _onDelete(),
            child: Text(
              S.current.deleteAccount,
            ),
          ),
        ],
      );

  Future<void> _save() async {
    if (!_checkForm()) {
      return;
    }

    final viewModel = context.read<ProfileViewModel>();
    final model = viewModel.item;

    if (model == null) {
      return;
    }

    final newModel = model.copyWith(
      fullName: _fullNameController.text.trim(),
      gender: _genderController.text,
      phoneNumber: _phoneNumberController.text.trim(),
      bio: _bioController.text.trim(),
    );

    await viewModel.update(
      id: model.id,
      item: newModel,
      updateLocally: true,
      loading: true,
    );
  }

  bool _checkForm() {
    if (_formKey.currentState?.validate() ?? false) {
      _formKey.currentState?.save();

      return true;
    } else {
      return false;
    }
  }

  Future<void> _onDelete() async {
    try {
      final viewModel = context.read<ProfileViewModel>();
      final model = viewModel.item;

      if (model == null) {
        return;
      }

      await viewModel.delete(id: model.id);
    } on ViewModelException catch (e) {
      await DialogsManager.showOkDialog(
        context: context,
        message: e.error ?? '',
      );
    }
  }
}
