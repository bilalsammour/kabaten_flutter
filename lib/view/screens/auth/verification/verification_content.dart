import 'package:kabaten/business/shared/view_model_exception.dart';
import 'package:kabaten/utils/navigation_manager.dart';
import 'package:kabaten/view/screens/home/home_screen.dart';
import 'package:kabaten/view/shared_widgets/app_consumer.dart';
import 'package:kabaten/generated/l10n.dart';
import 'package:kabaten/utils/form_validator.dart';
import 'package:kabaten/view/resources/app_resources.dart';
import 'package:kabaten/business/auth/auth_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:kabaten/view/utils/dialogs_manager.dart';

class VerificationContent extends StatefulWidget {
  const VerificationContent({Key? key}) : super(key: key);

  @override
  State<VerificationContent> createState() => _VerificationContentState();
}

class _VerificationContentState extends State<VerificationContent> {
  final _formKey = GlobalKey<FormState>();

  final _activationCodeController = TextEditingController();

  @override
  void dispose() {
    _activationCodeController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) => AppConsumer<AuthViewModel>(
        builder: (_, __) => _buildUi(),
      );

  Widget _buildUi() => CustomScrollView(
        slivers: [
          SliverFillRemaining(
            hasScrollBody: false,
            child: _buildForm(),
          ),
        ],
      );

  Widget _buildForm() => Form(
        key: _formKey,
        child: AutofillGroup(
          child: _buildContent(),
        ),
      );

  Widget _buildContent() => Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _buildTitle(),
          const SizedBox(height: AppDimensions.doubleMainSpace),
          _buildActivationCode(),
          const SizedBox(height: AppDimensions.doubleMainSpace),
          _buildSubmit(),
        ],
      );

  Widget _buildTitle() => Center(
        child: Text(
          S.current.activateYourAccount,
          style: AppStyles.h1Bold(context),
        ),
      );

  Widget _buildActivationCode() => TextFormField(
        controller: _activationCodeController,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          labelText: S.current.activationCode,
        ),
        validator: FormValidator.required(),
      );

  Widget _buildSubmit() => ElevatedButton(
        onPressed: () => _submit(),
        child: Text(
          S.current.activate,
        ),
      );

  Future<void> _submit() async {
    if (!_checkForm()) {
      return;
    }

    try {
      await _trySubmit();
    } on ViewModelException catch (e) {
      await DialogsManager.showOkDialog(
        context: context,
        message: e.error ?? '',
      );
    }
  }

  bool _checkForm() {
    if (_formKey.currentState?.validate() ?? false) {
      _formKey.currentState?.save();

      return true;
    } else {
      return false;
    }
  }

  Future<void> _trySubmit() => context
          .read<AuthViewModel>()
          .verify(
            activationCode: _activationCodeController.text.trim(),
          )
          .then(
        (_) async {
          await NavigationManager.pushClearBack(
            context,
            const HomeScreen(),
          );
        },
      );
}
