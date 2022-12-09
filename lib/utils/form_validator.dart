import 'package:kabaten/generated/l10n.dart';
import 'package:flutter/material.dart';

class FormValidator {
  static const String passwordPattern =
      r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*]).{8,}$';
  static const String personPattern = r'^([a-zA-Z ]{3,30}\\s*)+\$';

  static FormFieldValidator<T> requiredObject<T>({String? errorMessage}) {
    errorMessage ??= S.current.fieldRequired;

    return (value) {
      if (value == null) {
        return errorMessage;
      } else {
        return null;
      }
    };
  }

  static FormFieldValidator<String> required({String? errorMessage}) {
    errorMessage ??= S.current.fieldRequired;

    return (value) {
      value ??= '';

      if (value.isEmpty) {
        return errorMessage;
      } else {
        return null;
      }
    };
  }

  static FormFieldValidator<String> min({
    required double min,
    String? errorMessage,
  }) {
    errorMessage ??= S.current.errorInvalidInput;

    return (value) {
      value ??= '';

      if (value.trim().isEmpty) {
        return null;
      } else {
        final dValue = _toDouble(value);

        if (dValue < min) {
          return errorMessage;
        } else {
          return null;
        }
      }
    };
  }

  static FormFieldValidator<String> max({
    required double max,
    String? errorMessage,
  }) {
    errorMessage ??= S.current.errorInvalidInput;

    return (value) {
      value ??= '';

      if (value.trim().isEmpty) {
        return null;
      } else {
        final dValue = _toDouble(value);

        if (dValue > max) {
          return errorMessage;
        } else {
          return null;
        }
      }
    };
  }

  static FormFieldValidator<String> requiredEmail({
    String? requiredMessage,
    String? emailMessage,
  }) =>
      compose([
        required(errorMessage: requiredMessage),
        email(errorMessage: emailMessage),
      ]);

  static FormFieldValidator<String> email({String? errorMessage}) {
    errorMessage ??= S.current.emailValidation;

    return (value) {
      value ??= '';

      if (value.isEmpty) {
        return null;
      } else {
        final emailRegex = RegExp(
          r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$",
        );

        if (emailRegex.hasMatch(value)) {
          return null;
        } else {
          return errorMessage;
        }
      }
    };
  }

  static FormFieldValidator<String> minLength({
    required int minLength,
    String? errorMessage,
  }) {
    errorMessage ??= S.current.errorInvalidInput;

    return (value) {
      value ??= '';

      if (value.isEmpty) return null;

      if (value.length < minLength) {
        return errorMessage;
      } else {
        return null;
      }
    };
  }

  static FormFieldValidator<String> maxLength({
    required int maxLength,
    String? errorMessage,
  }) {
    errorMessage ??= S.current.errorInvalidInput;

    return (value) {
      value ??= '';

      if (value.isEmpty) return null;

      if (value.length > maxLength) {
        return errorMessage;
      } else {
        return null;
      }
    };
  }

  static FormFieldValidator<String> patternString({
    required String pattern,
    String? errorMessage,
  }) =>
      patternRegExp(
        pattern: RegExp(pattern),
        errorMessage: errorMessage,
      );

  static FormFieldValidator<String> patternRegExp({
    required RegExp pattern,
    String? errorMessage,
  }) {
    errorMessage ??= S.current.errorInvalidInput;

    return (value) {
      value ??= '';

      if (value.isEmpty) {
        return null;
      }

      if (pattern.hasMatch(value)) {
        return null;
      } else {
        return errorMessage;
      }
    };
  }

  static FormFieldValidator<String> person({
    String? requiredMessage,
    String? minMessage,
    String? patternMessage,
  }) =>
      compose(
        [
          required(errorMessage: S.current.fieldRequired),
          minLength(minLength: 3, errorMessage: S.current.errorInvalidInput),
        ],
      );

  static FormFieldValidator<String> password({
    String? requiredMessage,
    String? minMessage,
    String? patternMessage,
  }) =>
      compose(
        [
          required(errorMessage: S.current.passwordRequired),
          minLength(minLength: 8, errorMessage: S.current.passwordValidation),
        ],
      );

  static FormFieldValidator<String> passwordConfirmation({
    required TextEditingController controller,
    String? errorMessage,
  }) {
    errorMessage ??= S.current.errorNotMatchPassword;

    return (value) {
      value ??= '';

      if (value != controller.text) {
        return errorMessage;
      } else {
        return null;
      }
    };
  }

  static FormFieldValidator<String> compose(
    List<FormFieldValidator<String>> validators,
  ) =>
      (value) {
        for (final validator in validators) {
          final result = validator(value);

          if (result != null) {
            return result;
          }
        }
        return null;
      };

  static double _toDouble(String value) {
    value = value.replaceAll(' ', '').replaceAll(',', '');

    return double.parse(value);
  }
}
