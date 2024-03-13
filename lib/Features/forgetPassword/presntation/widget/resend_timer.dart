import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mowaterApp/Features/forgetPassword/presntation/resetPassword/reset_passwor_cubit.dart';
import 'package:mowaterApp/core/constants/color.dart';
import 'package:mowaterApp/core/style/text_style.dart';

class ResendTimer extends StatefulWidget {
  final String email;

  const ResendTimer({
    Key? key,
    required this.email,
  }) : super(key: key);

  @override
  _ResendTimerState createState() => _ResendTimerState();
}

class _ResendTimerState extends State<ResendTimer> {
  late Timer _timer;
  int _secondsRemaining = 0;
  bool _canResend = false;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    const oneSecond = Duration(seconds: 1);
    _timer = Timer.periodic(oneSecond, (timer) {
      if (_secondsRemaining == 0) {
        setState(() {
          _timer.cancel();
          _canResend = true; // Enable resend button
        });
      } else {
        setState(() {
          _secondsRemaining--;
        });
      }
    });
    _secondsRemaining = 5; // Reset the timer duration
    _canResend = false; // Disable resend button initially
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _secondsRemaining > 0
            ? Text(
                "Resend in ${_secondsRemaining}s",
                style: TextStyles.text_16,
              )
            : Text(
                'I didn’t receive a code',
                style: TextStyles.text_16,
              ),
        const SizedBox(width: 8),
        InkWell(
          onTap:
              _canResend ? _resendCode : null, // Disable onTap if not allowed
          child: Text(
            'Resend',
            style: TextStyles.text_16.copyWith(
              fontWeight: FontWeight.bold,
              color: _canResend ? ColorApp.primeryColorDark : Colors.grey,
            ),
          ),
        )
      ],
    );
  }

  void _resendCode() async {
    setState(() {
      _canResend = false; // Disable resend button during the process
    });
    await BlocProvider.of<ResetPassworCubit>(context).sendresetPasswordCode(
      widget.email,
    );
    _startTimer(); // Restart the timer
  }

  @override
  void dispose() {
    _timer.cancel(); // Cancel the timer when the widget is disposed
    super.dispose();
  }
}
