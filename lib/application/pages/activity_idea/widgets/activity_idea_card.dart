import 'package:bored_app/application/pages/activity_idea/widgets/activity_type_icon.dart';
import 'package:bored_app/application/pages/activity_idea/widgets/horizontal_data_bar.dart';
import 'package:bored_app/data/models/activity_idea_model.dart';
import 'package:flutter/material.dart';

class ActivityIdeaCard extends StatelessWidget {
  final ActivityIdeaModel activityIdea;
  const ActivityIdeaCard({super.key, required this.activityIdea});

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    final thirtyPercentOfWidth = MediaQuery.sizeOf(context).width * 0.3;
    return Container(
      constraints: BoxConstraints(maxWidth: (thirtyPercentOfWidth < 300) ? 300 : thirtyPercentOfWidth, minWidth: 300),
      decoration: BoxDecoration(
        color: themeData.colorScheme.primaryContainer,
        borderRadius: BorderRadius.circular(15),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            activityIdea.activity,
            textAlign: TextAlign.center,
            style: themeData.textTheme.displaySmall,
          ),
          const Padding(padding: EdgeInsets.symmetric(vertical: 5)),
          ActivityTypeIcon(type: activityIdea.type),
          const Padding(padding: EdgeInsets.symmetric(vertical: 5)),
          Text(
            '${activityIdea.participants} participants',
            style: themeData.textTheme.headlineMedium,
          ),
          const Padding(padding: EdgeInsets.symmetric(vertical: 5)),
          HorizontalDataBar(label: 'Accessibility', value: activityIdea.accessibility),
          const Padding(padding: EdgeInsets.symmetric(vertical: 5)),
          HorizontalDataBar(label: 'Price', value: activityIdea.price),
        ],
      ),
    );
  }
}
