import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:study_riverpod_hive_credit_card/data/models/task.dart';
import 'package:study_riverpod_hive_credit_card/utils/extensions.dart';
import 'package:study_riverpod_hive_credit_card/widgets/circle_container.dart';

class TaskTile extends StatelessWidget {
  const TaskTile({
    super.key,
    required this.task,
    this.onCompleted,
  });

  final Task task;

  final Function(bool?)? onCompleted;

  @override
  Widget build(BuildContext context) {
    final style = context.textTheme;
    final colors = context.colorScheme;

    final textDecoration =
        task.isCompleted ? TextDecoration.lineThrough : TextDecoration.none;
    final fontWeight = task.isCompleted ? FontWeight.normal : FontWeight.bold;
    final double iconOpacity = task.isCompleted ? 0.3 : 0.5;
    final double backgroundOpacity = task.isCompleted ? 0.1 : 0.3;

    return Padding(
      padding: const EdgeInsets.only(left: 16, top: 10, bottom: 10),
      child: Row(
        children: [
          CircleContainer(
            borderColor: task.category.color,
            color: task.category.color.withOpacity(backgroundOpacity),
            child: Icon(
              task.category.icon,
              color: task.category.color.withOpacity(iconOpacity),
            ),
          ),
          const Gap(16),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                task.title,
                style: style.titleMedium?.copyWith(
                  fontWeight: fontWeight,
                  fontSize: 20,
                  decoration: textDecoration,
                ),
              ),
              Text(
                task.time,
                style: style.titleMedium?.copyWith(
                  decoration: textDecoration,
                ),
              ),
            ],
          )),
          Checkbox(
            value: task.isCompleted,
            onChanged: onCompleted,
            checkColor: colors.surface,
            // fillColor: MaterialStateProperty.resolveWith<Color>(
            //   (Set<MaterialState> states) {
            //     if (states.contains(MaterialState.disabled)) {
            //       return colors.primary;
            //     }
            //     return colors.primary;
            //   },
            // ),
          ),
        ],
      ),
    );
  }
}
