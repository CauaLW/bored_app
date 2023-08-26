import 'package:bored_app/application/pages/activity_idea/cubit/activity_idea_cubit.dart';
import 'package:bored_app/application/pages/activity_idea/widgets/activity_idea_card.dart';
import 'package:bored_app/data/models/activity_idea_model.dart';
import 'package:bored_app/injection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ActivityIdeaWrapperProvider extends StatelessWidget {
  const ActivityIdeaWrapperProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => serviceLocator<ActivityIdeaCubit>(),
      child: const ActivityIdea(),
    );
  }
}

class ActivityIdea extends StatelessWidget {
  const ActivityIdea({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Center(
          child: BlocBuilder<ActivityIdeaCubit, ActivityIdeaState>(
            builder: (context, state) {
              if (state is ActivityIdeaStateInitial) {
                return Text(
                  'Bored?\n Get an idea tapping the button below!',
                  textAlign: TextAlign.center,
                  style: themeData.textTheme.displaySmall,
                );
              }

              if (state is ActivityIdeaStateLoading) {
                return const CircularProgressIndicator();
              }

              if (state is ActivityIdeaStateLoaded) {
                return ActivityIdeaCard(activityIdea: state.activityIdea as ActivityIdeaModel);
              }

              if (state is ActivityIdeaStateError) {
                return Text(
                  state.errorMessage,
                  textAlign: TextAlign.center,
                  style: themeData.textTheme.displaySmall!.copyWith(color: themeData.colorScheme.error),
                );
              }

              return const SizedBox();
            },
          ),
        ),
        const Padding(padding: EdgeInsets.symmetric(vertical: 50)),
        ElevatedButton(
          onPressed: () {
            BlocProvider.of<ActivityIdeaCubit>(context).requestIdea();
          },
          child: const Text('Get Idea'),
        ),
      ],
    );
  }
}
