import 'package:doctorhunt/core/utils/constants.dart';
import 'package:doctorhunt/core/utils/custom_button.dart';
import 'package:doctorhunt/core/utils/responsive_extension.dart';
import 'package:doctorhunt/feature/home/data/models/appointment_model.dart';
import 'package:doctorhunt/feature/home/data/models/reminder_model.dart';
import 'package:doctorhunt/feature/home/presentation/widgets/time_circle.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:table_calendar/table_calendar.dart';

class AppointmentCalendarView extends StatefulWidget {
  const AppointmentCalendarView({super.key});

  @override
  State<AppointmentCalendarView> createState() =>
      _AppointmentCalendarViewState();
}

class _AppointmentCalendarViewState extends State<AppointmentCalendarView> {
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  List<AppointmentModel> appointments = [
    AppointmentModel(appointmentHour: 10.0, appointmentTime: "AM"),
    AppointmentModel(appointmentHour: 12.0, appointmentTime: "AM"),
    AppointmentModel(appointmentHour: 2.0, appointmentTime: "PM"),
    AppointmentModel(appointmentHour: 10.0, appointmentTime: "AM"),
    AppointmentModel(appointmentHour: 12.0, appointmentTime: "AM"),
    AppointmentModel(appointmentHour: 2.0, appointmentTime: "PM"),
  ];

  List<ReminderModel> reminders = [
    ReminderModel(time: 10.0, title: "Min"),
    ReminderModel(time: 30.0, title: "Min"),
    ReminderModel(time: 1.0, title: "Hour"),
    ReminderModel(time: 10.0, title: "Min"),
    ReminderModel(time: 30.0, title: "Min"),
    ReminderModel(time: 1.0, title: "Hour"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Appointment", style: context.responsiveHeadLineMedium),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TableCalendar(
              firstDay: DateTime.utc(2010, 10, 16),
              lastDay: DateTime.utc(2030, 3, 14),
              focusedDay: _focusedDay,
              selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
              onDaySelected: (selectedDay, focusedDay) {
                setState(() {
                  _selectedDay = selectedDay;
                  _focusedDay = focusedDay;
                });
                // Show appointment dialog when a day is selected
                _showAppointmentDialog(selectedDay);
              },
              availableCalendarFormats: const {CalendarFormat.month: "Month"},
              weekendDays: const [DateTime.friday, DateTime.saturday],
              calendarStyle: const CalendarStyle(
                selectedDecoration: BoxDecoration(
                  color: primaryColor,
                  shape: BoxShape.circle,
                ),
                todayDecoration: BoxDecoration(
                  color: Colors.blueAccent,
                  shape: BoxShape.circle,
                ),
              ),
              headerStyle: HeaderStyle(
                titleTextStyle: context.responsiveHeadLineLarge.copyWith(
                  fontSize: 20,
                ),
                titleCentered: true,
                formatButtonDecoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            if (_selectedDay != null)
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'Selected: ${_selectedDay!.day}/${_selectedDay!.month}/${_selectedDay!.year}',
                  style: context.responsiveHeadLineMedium,
                ),
              ),
          ],
        ),
      ),
    );
  }

  void _showAppointmentDialog(DateTime selectedDay) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Available Time",
                style: context.responsiveHeadLineMedium.copyWith(fontSize: 20),
              ),
              TimeCircle(
                items: appointments,
                itemHour: (item) {
                  return item.appointmentHour.toString();
                },
                itemTime: (item) {
                  return item.appointmentTime.toString();
                },
              ),
              Text(
                "Reminder Me Before",
                style: context.responsiveHeadLineMedium.copyWith(fontSize: 20),
              ),
              TimeCircle(
                items: reminders,
                itemHour: (value) {
                  return value.time.toString();
                },
                itemTime: (itemTime) {
                  return itemTime.title.toString();
                },
              ),
              SizedBox(height: context.smallSpacing),
              Center(
                child: CustomButton(title: "Confirm", onPressed: () {
                  
                }),
              ),
            ],
          ),
        );
      },
    );
  }
}
