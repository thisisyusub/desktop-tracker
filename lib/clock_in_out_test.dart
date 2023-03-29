import 'package:flutter/material.dart';
import 'package:flutter_desktop_sleep/flutter_desktop_sleep.dart';

import 'os_log.dart';

class ClockInOutTest extends StatefulWidget {
  const ClockInOutTest({super.key});

  @override
  State<ClockInOutTest> createState() => _ClockInOutTestState();
}

class _ClockInOutTestState extends State<ClockInOutTest> {
  final _logs = ValueNotifier<List<OsLogData>>([]);

  @override
  void initState() {
    super.initState();

    final db = MyDatabase();
    db.select(db.osLog).get().then(
      (logs) {
        _logs.value = [...logs];
      },
    );

    FlutterDesktopSleep flutterDesktopSleep = FlutterDesktopSleep();
    flutterDesktopSleep.setWindowSleepHandler(
      (String? s) async {
        if (s != null) {
          try {
            await db.into(db.osLog).insert(
                  OsLogCompanion.insert(
                    title: s,
                    logDate: DateTime.now().toIso8601String(),
                  ),
                );
          } catch (e, s) {
            print('$e => $s');
          }

          final logs = await db.select(db.osLog).get();
          setState(() {
            _logs.value = [];
            _logs.value = [...logs];
          });

          if (s == 'terminate_app') {
            flutterDesktopSleep.terminateApp();
          }
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ValueListenableBuilder<List<OsLogData>>(
          valueListenable: _logs,
          builder: (context, logs, _) {
            return ListView.builder(
              itemBuilder: (context, index) {
                final log = logs[index];

                return ListTile(
                  title: Text(log.title),
                  subtitle: Text(
                      '${log.logDate.substring(0, 10)}  ${log.logDate.substring(11, 16)}'),
                );
              },
              itemCount: logs.length,
            );
          }),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
