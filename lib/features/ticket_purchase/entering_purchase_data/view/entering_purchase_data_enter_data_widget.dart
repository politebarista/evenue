part of '../entering_purchase_data_screen.dart';

// TODO: add more description for the user of what is happening on the screen
class _EnteringPurchaseDataEnterDataWidget extends StatefulWidget {
  const _EnteringPurchaseDataEnterDataWidget();

  @override
  State<_EnteringPurchaseDataEnterDataWidget> createState() =>
      _EnteringPurchaseDataEnterDataWidgetState();
}

class _EnteringPurchaseDataEnterDataWidgetState
    extends State<_EnteringPurchaseDataEnterDataWidget> {
  final double textFieldsBottomPadding = 16;
  late final GlobalKey<FormState> formKey;
  late final TextEditingController emailController,
      cardNumberController,
      cardExpirationDateController,
      cardCvvController,
      cardHolderNameController;

  @override
  void initState() {
    super.initState();
    formKey = GlobalKey<FormState>();
    emailController = TextEditingController()..text = context.read<UserStore>().user!.email;
    cardNumberController = TextEditingController();
    cardExpirationDateController = TextEditingController();
    cardCvvController = TextEditingController();
    cardHolderNameController = TextEditingController();
  }

  String? validateCardNumber(String? cardNumber) {
    const cardNumberWithSpacesLength = 19;
    final isCardNumberValid =
        cardNumber != null && cardNumber.length == cardNumberWithSpacesLength;
    return isCardNumberValid ? null : S.of(context).enteringPurchaseDataCardNumberValidateError;
  }

  String? validateExpirationDate(String? expirationDate) {
    const expirationDateWithCharacterLength = 5;
    final isExpirationDateValid = expirationDate != null &&
        expirationDate.length == expirationDateWithCharacterLength;
    return isExpirationDateValid ? null : S.of(context).enteringPurchaseDataCardExpirationDateValidateError;
  }

  String? validateCVV(String? cvv) {
    final isCvvValid = cvv != null && cvv.length == 3;
    return isCvvValid ? null : S.of(context).enteringPurchaseDataCardCVVValidateError;
  }

  String? validateCardHolderName(String? cardHolderName) {
    final fullNameRegExp = RegExp(r'^[A-Z]+\s[A-Z]+$');
    final isCardHolderNameValid = cardHolderName != null &&
        cardHolderName.trim().isNotEmpty &&
        fullNameRegExp.hasMatch(cardHolderName);
    return isCardHolderNameValid ? null : S.of(context).enteringPurchaseDataCardHolderValidateError;
  }

  String? validateEmail(String? email) {
    final isEmailValid = email != null &&
        email.trim().isNotEmpty &&
        EmailHelper.isEmailValid(email);
    return isEmailValid ? null : S.of(context).enteringPurchaseDataEmailValidateError;
  }

  void onSendDataButtonPressed() {
    final isDataValid = formKey.currentState!.validate();
    if (isDataValid) {
      context.read<EnteringPurchaseDataBloc>().add(
        EnteringPurchaseDataSendPurchaseDataEvent(
          BankCard(
            cardNumberController.text,
            cardExpirationDateController.text,
            cardCvvController.text,
            cardHolderNameController.text,
          ),
          emailController.text,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: IndentWidget(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: textFieldsBottomPadding,
                ),
                child: CustomTextField(
                  controller: cardNumberController,
                  label: S.of(context).enteringPurchaseDataCardNumberFieldLabel,
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    MaskTextInputFormatter(
                      mask: '#### #### #### ####',
                      filter: {'#': RegExp(r'[0-9]')},
                    ),
                  ],
                  validator: validateCardNumber,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: textFieldsBottomPadding),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Flexible(
                      child: CustomTextField(
                        controller: cardExpirationDateController,
                        label: S.of(context).enteringPurchaseDataCardExpirationDateFieldLabel,
                        keyboardType: TextInputType.number,
                        hintText: S.of(context).enteringPurchaseDataCardExpirationDateFieldHint,
                        inputFormatters: [
                          MaskTextInputFormatter(
                            mask: '##/##',
                            filter: {'#': RegExp(r'[0-9]')},
                          ),
                        ],
                        validator: validateExpirationDate,
                      ),
                    ),
                    SizedBox(width: 20),
                    Flexible(
                      child: CustomTextField(
                        controller: cardCvvController,
                        label: S.of(context).enteringPurchaseDataCardCVVFieldLabel,
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                          LengthLimitingTextInputFormatter(3),
                        ],
                        validator: validateCVV,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: textFieldsBottomPadding),
                child: CustomTextField(
                  controller: cardHolderNameController,
                  label: S.of(context).enteringPurchaseDataCardHolderFieldLabel,
                  keyboardType: TextInputType.name,
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z]|\s')),
                    UpperCaseTextInputFormatter(),
                  ],
                  validator: validateCardHolderName,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: textFieldsBottomPadding),
                child: CustomTextField(
                  controller: emailController,
                  label: S.of(context).enteringPurchaseDataEmailFieldLabel,
                  keyboardType: TextInputType.emailAddress,
                  validator: validateEmail,
                  enabled: false,
                ),
              ),
              EvenueButton(
                onTap: onSendDataButtonPressed,
                text: S.of(context).enteringPurchaseDataContinueButton,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
