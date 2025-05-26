import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
class TicketBookingPage extends StatefulWidget {
  @override
  _TicketBookingPageState createState() => _TicketBookingPageState();
}

class _TicketBookingPageState extends State<TicketBookingPage> {
  int _ticketCount = 1;
  DateTime? _selectedDate;

  void _incrementTicket() {
    setState(() {
      _ticketCount++;
    });
  }

  void _decrementTicket() {
    setState(() {
      if (_ticketCount > 0) _ticketCount--;
    });
  }

  void _selectDate() async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF8F6FB),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 60.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Book Ticket',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Color(0xFF4B2E83),
              ),
            ),
            SizedBox(height: 40),

            // Date Picker
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Select Date',
                style: TextStyle(
                  fontSize: 18,
                  color: Color(0xFF4B2E83),
                ),
              ),
            ),
            GestureDetector(
              onTap: _selectDate,
              child: Container(
                margin: EdgeInsets.only(top: 10),
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.grey.shade400),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: [
                    Icon(Icons.calendar_today, size: 18, color: Colors.grey),
                    SizedBox(width: 10),
                    Text(
                      _selectedDate == null
                          ? 'Tap to pick a date'
                          : DateFormat('yMMMd').format(_selectedDate!),
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey.shade700,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(height: 30),

            // Number of Tickets
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Number of Tickets',
                style: TextStyle(
                  fontSize: 18,
                  color: Color(0xFF4B2E83),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.grey.shade400),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: _decrementTicket,
                    child: Container(
                      padding:
                      EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Text(
                        '-',
                        style: TextStyle(
                          fontSize: 20,
                          color: Color(0xFF4B2E83),
                        ),
                      ),
                    ),
                  ),
                  Spacer(),
                  Text(
                    '$_ticketCount',
                    style: TextStyle(
                      fontSize: 20,
                      color: Color(0xFF4B2E83),
                    ),
                  ),
                  Spacer(),
                  GestureDetector(
                    onTap: _incrementTicket,
                    child: Container(
                      padding:
                      EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Text(
                        '+',
                        style: TextStyle(
                          fontSize: 20,
                          color: Color(0xFF4B2E83),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            Spacer(),

            // Book Now Button
            ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text(
                    'Successfully booked $_ticketCount ticket(s) for ${_selectedDate != null ? DateFormat('yMMMd').format(_selectedDate!) : 'No Date'}',
                  ),
                ));
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF4B2E83),
                padding:
                EdgeInsets.symmetric(horizontal: 100.0, vertical: 18.0),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0)),
              ),
              child: Text(
                'Book Now',
                style: TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
