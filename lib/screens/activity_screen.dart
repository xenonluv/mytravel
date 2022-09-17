import 'package:flutter/material.dart';
import 'package:mytravel/models/activity_model.dart';
import 'package:mytravel/widgets/custom_header.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class ActivitiesScreen extends StatelessWidget {
  const ActivitiesScreen({Key? key}) : super(key: key);

  static const routeName = '/activities';

  @override
  Widget build(BuildContext context) {
    List<Activity> activities = Activity.activities;
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return SingleChildScrollView(
      child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 50,),
          const CustomHeader(title: 'Activities'),
          MasonryGridView.count(
            shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.all(10.0),
              itemCount: 9,
              crossAxisCount: 2,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              itemBuilder: (context, index) {
              Activity activity = activities[index];
                return Column(
                  children: [
                    Container(
                      height: 200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.0),
                        image: DecorationImage(
                          image: NetworkImage(activity.imgeUrl),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Text(
                      activity.title,
                      maxLines: 3,
                      style: Theme
                          .of(context)
                          .textTheme
                          .bodySmall!
                          .copyWith(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ],
                );
              },
          ),
        ],
      ),
    );
  }
}
