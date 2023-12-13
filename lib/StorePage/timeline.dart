import 'package:flutter/material.dart';
import 'package:timelines/timelines.dart';

class ProcessTimelineWidget extends StatelessWidget {
  final int processIndex;
  final List<String> processes;

  ProcessTimelineWidget({
    Key? key,
    this.processIndex = 2, // Default value, change as needed
    this.processes = const [
      'Prospect',
      'Tour',
      'Offer',
      'Contract',
      'Settled'
    ], required String title, // Default values
  }) : super(key: key);

  // Define the colors
  static const Color completeColor = Color(0xff5e6172);
  static const Color inProgressColor = Color(0xff5ec792);
  static const Color todoColor = Color(0xffd1d2d7);

  Color getColor(int index) {
    if (index == processIndex) {
      return inProgressColor;
    } else if (index < processIndex) {
      return completeColor;
    } else {
      return todoColor;
    }
  }

  @override
  Widget build(BuildContext context) {
    double maxWidth = MediaQuery.of(context).size.width / processes.length;
    double itemExtent = maxWidth > 120 ? 120 : maxWidth;

    return Timeline.tileBuilder(
      theme: TimelineThemeData(
        direction: Axis.horizontal,
        connectorTheme: ConnectorThemeData(
          space: 30.0,
          thickness: 5.0,
        ),
      ),
      builder: TimelineTileBuilder.connected(
        connectionDirection: ConnectionDirection.before,
        itemExtentBuilder: (_, __) =>
            MediaQuery.of(context).size.width / processes.length,
        contentsBuilder: (context, index) => Padding(
          padding: const EdgeInsets.only(top: 15.0),
          child: Text(
            processes[index],
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: getColor(index),
            ),
          ),
        ),
        indicatorBuilder: (_, index) {
          var child;
          if (index == processIndex) {
            child = Padding(
              padding: const EdgeInsets.all(8.0),
              child: CircularProgressIndicator(
                strokeWidth: 3.0,
                valueColor: AlwaysStoppedAnimation(Colors.white),
              ),
            );
          } else if (index < processIndex) {
            child = Icon(
              Icons.check,
              color: Colors.white,
              size: 15.0,
            );
          } else {
            child = null;
          }

          return DotIndicator(
            size: 30.0,
            color: getColor(index),
            child: child,
          );
        },
        connectorBuilder: (_, index, type) => SolidLineConnector(
          color: getColor(index),
        ),
        itemCount: processes.length,
      ),
    );
  }
}
