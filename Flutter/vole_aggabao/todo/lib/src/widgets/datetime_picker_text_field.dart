import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateTimePickerTextField extends StatefulWidget {
  final String labelText;
  final void Function(DateTime selectedDateTime) onDateTimeChanged;
  final DateTime? initialValue;

  const DateTimePickerTextField({
    super.key,
    required this.labelText,
    required this.onDateTimeChanged,
    this.initialValue,
  });

  @override
  State<DateTimePickerTextField> createState() => _DateTimePickerTextFieldState();
}

class _DateTimePickerTextFieldState extends State<DateTimePickerTextField> {
  late DateTime _selectedDate;
  late TimeOfDay _selectedTime;
  final TextEditingController _textEditingController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _selectedDate = widget.initialValue ?? DateTime.now();
    _selectedTime = TimeOfDay.now();
    _textEditingController.text = _formatDateTime(_selectedDate, _selectedTime);
  }

  @override
  void dispose() {
    _textEditingController.dispose(); // Cleanup
    super.dispose();
  }

  String _formatDateTime(DateTime date, TimeOfDay time) {
    final dateTime = DateTime(
      date.year,
      date.month,
      date.day,
      time.hour,
      time.minute
    );
    return DateFormat('MMM d, yyyy hh:mm a').format(dateTime);
  }

  Future<void> _selectDateTime(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
    );
    if (pickedDate != null && pickedDate != _selectedDate) {
      final TimeOfDay? pickedTime = await showTimePicker(
        context: context,
        initialTime: _selectedTime,
      );
      if (pickedTime != null) {
        setState(() {
          _selectedDate = pickedDate;
          _selectedTime = pickedTime;
          _textEditingController.text = _formatDateTime(_selectedDate, _selectedTime);
          widget.onDateTimeChanged(DateTime(
            _selectedDate.year,
            _selectedDate.month,
            _selectedDate.day,
            _selectedTime.hour,
            _selectedTime.minute,
          ));
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _textEditingController,
      readOnly: true,
      onTap: () {
        _selectDateTime(context);
      },
      decoration: InputDecoration(
        labelText: widget.labelText,
        suffixIcon: IconButton(
          icon: Icon(Icons.calendar_today),
          onPressed: () {
            _selectDateTime(context);
          },
        ),
      ),
    );
  }
}
