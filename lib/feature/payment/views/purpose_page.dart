import 'package:esewa_clone/feature/checkout/views/checkout_page.dart';
import 'package:esewa_clone/feature/payment/views/payment_amount_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import '../../../core/widgets/expanded_button.dart';

class PurposePage extends HookWidget {
  const PurposePage({Key? key, required this.amount, required this.qrResult})
      : super(key: key);

  final double amount;
  final Map<String, dynamic> qrResult;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const PaymentAmountAppBar(),
          Container(
            padding: const EdgeInsets.all(30),
            margin: const EdgeInsets.all(30),
            decoration: BoxDecoration(
              color: context.cardColor,
              borderRadius: BorderRadius.circular(30),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                'Send fund to'.text.xl2.make(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    qrResult['name'].toString().text.xl3.bold.make(),
                    '$amount'.text.xl3.make(),
                  ],
                ),
                qrResult['eSewa_id'].toString().text.xl2.gray300.make(),
                const Divider(),
                'Purpose'.text.xl3.make(),
                20.heightBox,
                const ChoiceChipRow(labels: ['Bill sharing', 'Family Expenses']),
                20.heightBox,
                const ChoiceChipRow(labels: ['Lend/borrow', 'Personal Use']),
                20.heightBox,
                'Remarks'.text.xl2.make(),
                TextFormField(
                  autovalidateMode: AutovalidateMode.always,
                  maxLines: 4,
                  validator: (str) => str.isEmptyOrNull ? 'Required' : null,
                  decoration: const InputDecoration(
                    filled: true,
                  ),
                ),
              ],
            ),
          ),
          const Expanded(child: SizedBox()),
          ExpandedButton(
            title: 'CONTINUE',
            onTap: () => context.push(
              (context) => CheckoutPage(qrResult: qrResult, amount: amount),
            ),
          ).px(30),
        ],
      ).py(30),
    );
  }
}

class ChoiceChipRow extends StatelessWidget {
  const ChoiceChipRow({
    Key? key,
    required this.labels,
  }) : super(key: key);

  final List<String> labels;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(
        labels.length,
        (i) => CustomChoiceChip(label: labels[i]),
      ),
    );
  }
}

class CustomChoiceChip extends HookWidget {
  const CustomChoiceChip({Key? key, required this.label}) : super(key: key);

  final String label;

  @override
  Widget build(BuildContext context) {
    final selected = useState<bool>(false);
    return ChoiceChip(
      label: Row(
        children: [
          Radio<bool>(
            value: true,
            groupValue: selected.value,
            onChanged: (val) {
              //already set by choice chip
            },
          ),
          SizedBox(
            width: 130,
            child: label.text.make(),
          ),
        ],
      ),
      selected: selected.value,
      onSelected: (val) => selected.value = val,
    );
  }
}
