part of '../confirm_purchase_screen.dart';

const _confirmationCodeLength = 6;

class _ConfirmPurchaseEnterCodeWidget extends StatefulWidget {
  const _ConfirmPurchaseEnterCodeWidget();

  @override
  State<_ConfirmPurchaseEnterCodeWidget> createState() => _ConfirmPurchaseEnterCodeWiderState();
}

class _ConfirmPurchaseEnterCodeWiderState extends State<_ConfirmPurchaseEnterCodeWidget> {
  late final TextEditingController confirmationCodeController;
  late final GlobalKey<FormState> formKey;

  @override
  void initState() {
    super.initState();
    confirmationCodeController = TextEditingController();
    formKey = GlobalKey<FormState>();
  }

  void onConfirmPurchaseButtonTap() {
    if (formKey.currentState!.validate()) {
      context.read<ConfirmPurchaseBloc>().add(
        ConfirmPurchaseSendCodeEvent(
          confirmationCodeController.text,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return IndentWidget(
      child: Form(
        key: formKey,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: 16),
              child: Text(S.of(context).confirmPurchaseTitle),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 16),
              child: Text(S.of(context).confirmPurchaseDescriptionWithoutEventName),
              // TODO: swap with
              // child: Text(S.of(context).confirmPurchaseDescription),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 16),
              child: CustomTextField(
                controller: confirmationCodeController,
                label: S.of(context).confirmPurchaseConfirmationCodeFieldLabel,
                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  LengthLimitingTextInputFormatter(_confirmationCodeLength),
                ],
                validator: (value) {
                  if (value == null || value.length != _confirmationCodeLength) {
                    return S.of(context).confirmPurchaseIncorrectConfirmationCodeError;
                  }

                  return null;
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 16),
              child: EvenueButton(
                onTap: onConfirmPurchaseButtonTap,
                text: S.of(context).confirmPurchaseConfirmButton,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
