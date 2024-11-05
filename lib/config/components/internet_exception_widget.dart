import 'package:bloc_clean_code_project/config/components/round_button.dart';
import 'package:flutter/material.dart';

class InternetExceptionWidget extends StatelessWidget {
  final VoidCallback onPress;

  const InternetExceptionWidget({super.key, required this.onPress});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.sizeOf(context).height * .15,
        ),
        const Icon(
          Icons.cloud_off,
          color: Colors.red,
          size: 50,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 30),
          child: Center(
            child: Text(
              "We're unable to show results.\nPlease check you internet.",
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .displayMedium!
                  .copyWith(fontSize: 20),
            ),
          ),
        ),
        SizedBox(
          height: MediaQuery.sizeOf(context).height * .15,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: RoundButton(
            height: 50,
            title: "RETRY",
            onPress: onPress,
          ),
        )
      ],
    );
  }
}
