import 'package:flutter/material.dart';
import 'package:map_task/constants/app_constants.dart';

class DetailRow extends StatelessWidget {
  const DetailRow({
    Key? key,
    required this.text,
    required this.title,
    this.isIconic = false,
    this.isAddress = false,
  }) : super(key: key);

  final String title;
  final String? text;
  final bool isIconic;
  final bool isAddress;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment:
          isAddress ? CrossAxisAlignment.start : CrossAxisAlignment.center,
      children: [
        Text(
          title,
          style: AppContants.W600S14TG,
        ),
        isAddress ? const SizedBox(width: 10) : const Spacer(),
        isAddress ? Flexible(child: buildText()) : buildText(),
        if (isIconic) const Icon(Icons.star, color: AppContants.YELLOW),
      ],
    );
  }

  Text buildText() {
    return Text(
      text ?? "-",
      style: AppContants.W600S14B,
    );
  }
}
