import 'package:dependency_inject_fl/theme/random_colors.dart';
import 'package:flutter/material.dart';

class CustomPostWidget extends StatelessWidget {
  final String? id;
  final String? title;
  final int? colorIndex;
  const CustomPostWidget({
    Key? key,
    this.id,
    this.title,
    this.colorIndex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      height: 200,
      decoration: BoxDecoration(
        color: randomColors[colorIndex!],
        border: Border.all(
          width: 1.5,
          color: Colors.white,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            id ?? 'Id is null',
            softWrap: false,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontSize: 18,
              color: Colors.white,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          SizedBox(
            child: Expanded(
              child: Text(
                title ?? 'Tittle is null',
                style: const TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
