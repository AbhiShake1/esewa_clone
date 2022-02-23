part of 'payment_amount_page.dart';

class PaymentAmountNumberButtonsArea extends HookWidget {
  const PaymentAmountNumberButtonsArea({Key? key, required this.qrResult})
      : super(key: key);

  final Map<String, dynamic> qrResult;

  @override
  Widget build(BuildContext context) {
    final controller = useTextEditingController(text: '');

    void _onNumberButtonPress(String numText) {
      int? number = int.tryParse(numText);
      if (number == null) {
        if (controller.text.isNotEmpty && !controller.text.contains('.')) {
          controller.text += '.';
        }
        return;
      }
      if (number != 0) {
        controller.text += '$number';
      } else if (!controller.text.isEmptyOrNull) {
        controller.text += '$number';
      }
    }

    return Flexible(
      child: Container(
        height: double.infinity,
        width: double.infinity,
        color: context.theme.appBarTheme.backgroundColor,
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                'Send Amount'.text.xl2.make(),
                SizedBox(
                  width: context.screenWidth / 2,
                  child: Form(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    child: ConstrainedBox(
                      constraints: const BoxConstraints(
                        maxHeight: 80,
                        minHeight: 80,
                      ),
                      child: TextFormField(
                        validator: (text) => text.isEmptyOrNull ? 'Required' : null,
                        readOnly: true,
                        controller: controller,
                        scrollPhysics: const BouncingScrollPhysics(),
                        textAlign: TextAlign.end,
                        style: const TextStyle(
                          fontSize: 50,
                        ),
                        decoration: InputDecoration(
                          hintText: '00.00',
                          hintTextDirection: TextDirection.ltr,
                          focusedBorder: const UnderlineInputBorder(),
                          prefixIcon: Icon(
                            Icons.attach_money_rounded,
                            size: 40,
                            color: context.accentColor,
                          ),
                          hintStyle: TextStyle(
                            fontWeight: FontWeight.w400,
                            overflow: TextOverflow.fade,
                            fontSize: 45,
                            color: Colors.grey.shade500.withOpacity(.8),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            20.heightBox,
            const Divider(height: 40),
            //need both i and j. i is incremented when widget is constructed
            //j combined with inner index (ii) gives values of these numbers.
            for (int i = 1, j = 1; i <= 9; j += 3)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: List.generate(
                  3,
                  (ii) => NumberButton(
                    onPressed: () => _onNumberButtonPress('${j + ii}'),
                    numberText: '${i++}',
                  ),
                ).map((r) => r.py(20)).toList(),
              ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ...[
                  NumberButton(
                    onPressed: () => _onNumberButtonPress('.'),
                    numberText: '.',
                  ),
                  NumberButton(
                    onPressed: () => _onNumberButtonPress('0'),
                    numberText: '0',
                  ),
                  NumberButton(
                    onPressed: () => controller.text = controller.text.eliminateLast,
                    numberText: 'x',
                  ),
                ].map((w) => w.py(20))
              ],
            ),
            ExpandedButton(
              title: 'CONTINUE',
              onTap: () {
                final amount = double.tryParse(controller.text);
                if (amount != null) {
                  context.push(
                    (context) => PurposePage(
                      amount: amount,
                      qrResult: qrResult,
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
