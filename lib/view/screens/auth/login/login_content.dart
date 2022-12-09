import 'package:kabaten/business/auth/auth_view_model.dart';
import 'package:kabaten/business/shared/view_model_exception.dart';
import 'package:kabaten/generated/l10n.dart';
import 'package:kabaten/utils/form_validator.dart';
import 'package:kabaten/utils/navigation_manager.dart';
import 'package:kabaten/view/resources/app_resources.dart';
import 'package:kabaten/view/screens/home/home_screen.dart';
import 'package:kabaten/view/shared_widgets/app_consumer.dart';
import 'package:kabaten/view/utils/dialogs_manager.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginContent extends StatefulWidget {
  const LoginContent({Key? key}) : super(key: key);

  @override
  State<LoginContent> createState() => _LoginContentState();
}

class _LoginContentState extends State<LoginContent> {
  final _formKey = GlobalKey<FormState>();

  final _usernameController = TextEditingController(text: 'test@yst9.com');
  final _passwordController = TextEditingController(text: 'string2@A');

  @override
  void initState() {
    super.initState();

    Future.delayed(
      Duration.zero,
      () => context.read<AuthViewModel>().signOut(),
    );
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();

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
          const SizedBox(height: AppDimensions.mainSpace),
          _buildEmail(),
          const SizedBox(height: AppDimensions.doubleMainSpace),
          _buildPassword(),
          const SizedBox(height: AppDimensions.quarterSpace),
          _buildForgotPassword(),
          const SizedBox(height: AppDimensions.doubleMainSpace),
          _buildSubmit(),
          const SizedBox(height: AppDimensions.doubleMainSpace),
          _buildSecondary(),
        ],
      );

  Widget _buildTitle() => Center(
        child: Text(
          S.current.login,
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

  Widget _buildForgotPassword() => TextButton(
      child: Text(
        S.current.forgotYourPassword,
        style: AppStyles.p1Bold(context).copyWith(
          color: AppColors.plainOn,
        ),
      ),
      onPressed: () {});

  Widget _buildSubmit() => ElevatedButton(
        onPressed: () => _submit(),
        child: Text(
          S.current.login,
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
    } catch (_) {
      await DialogsManager.showOkDialog(
        context: context,
        message: S.current.errorSystem,
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
          .signInWithEmailAndPassword(
            username: _usernameController.text,
            password: _passwordController.text,
          )
          .then((_) async {
        await NavigationManager.pushClearBack(
          context,
          const HomeScreen(),
        );
      });

  Widget _buildSecondary() => Column(
        children: [
          _buildSecondaryLabel(),
          _buildSecondaryButton(),
        ],
      );

  Widget _buildSecondaryLabel() => Center(
        child: Text(
          S.current.doNotHaveAccount,
          style: AppStyles.p2(context),
        ),
      );

  Widget _buildSecondaryButton() => TextButton(
        onPressed: () => _navigateToMe(),
        child: Text(
          S.current.createAccount,
          style: AppStyles.p1Bold(context).copyWith(
            color: AppColors.plainOn,
          ),
        ),
      );

  Future _navigateToMe() async {}
}
