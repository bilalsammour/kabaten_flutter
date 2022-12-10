import 'package:kabaten/business/shared/view_model_exception.dart';
import 'package:kabaten/view/shared_widgets/app_consumer.dart';
import 'package:kabaten/generated/l10n.dart';
import 'package:kabaten/utils/form_validator.dart';
import 'package:kabaten/utils/navigation_manager.dart';
import 'package:kabaten/view/resources/app_resources.dart';
import 'package:kabaten/view/screens/auth/login/login_screen.dart';
import 'package:kabaten/business/auth/auth_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:kabaten/view/utils/dialogs_manager.dart';

class RegistrationContent extends StatefulWidget {
  const RegistrationContent({Key? key}) : super(key: key);

  @override
  State<RegistrationContent> createState() => _RegistrationContentState();
}

class _RegistrationContentState extends State<RegistrationContent> {
  final _formKey = GlobalKey<FormState>();

  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _passwordConfirmationController = TextEditingController();

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    _passwordConfirmationController.dispose();

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
          _buildEmail(),
          const SizedBox(height: AppDimensions.doubleMainSpace),
          _buildPassword(),
          const SizedBox(height: AppDimensions.doubleMainSpace),
          _buildPasswordConfirmation(),
          const SizedBox(height: AppDimensions.doubleMainSpace),
          _buildSubmit(),
          const SizedBox(height: AppDimensions.doubleMainSpace),
          _buildSecondaryLabel(),
          _buildSecondaryButton(),
        ],
      );

  Widget _buildTitle() => Center(
        child: Text(
          S.current.register,
          style: AppStyles.h1Bold(context),
        ),
      );

  Widget _buildEmail() => TextFormField(
        controller: _usernameController,
        keyboardType: TextInputType.emailAddress,
        autofillHints: const [AutofillHints.email],
        decoration: InputDecoration(
          labelText: S.current.email,
        ),
        validator: FormValidator.requiredEmail(),
      );

  Widget _buildPassword() => TextFormField(
        controller: _passwordController,
        keyboardType: TextInputType.text,
        autofillHints: const [AutofillHints.password],
        obscureText: true,
        decoration: InputDecoration(
          labelText: S.current.password,
        ),
        validator: FormValidator.password(),
      );

  Widget _buildPasswordConfirmation() => TextFormField(
        controller: _passwordConfirmationController,
        keyboardType: TextInputType.text,
        obscureText: true,
        decoration: InputDecoration(
          labelText: S.current.passwordConfirmation,
        ),
        validator: FormValidator.passwordConfirmation(
          controller: _passwordController,
        ),
      );

  Widget _buildSubmit() => ElevatedButton(
        onPressed: () => _submit(),
        child: Text(
          S.current.register,
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

  Future<void> _trySubmit() =>
      context.read<AuthViewModel>().signUpWithEmailAndPassword(
            username: _usernameController.text,
            password: _passwordController.text,
          );

  Widget _buildSecondaryLabel() => Center(
        child: Text(
          S.current.alreadyHaveAccount,
          style: AppStyles.p2(context),
        ),
      );

  Widget _buildSecondaryButton() => TextButton(
        onPressed: () => _navigateToMe(),
        child: Text(
          S.current.login,
        ),
      );

  Future _navigateToMe() => NavigationManager.pushClearBack(
        context,
        const LoginScreen(),
      );
}
