
import 'package:flutter/material.dart';

import 'main.dart';

class Ticket {
  DateTime date;
  int count;
  bool isCancelled;

  Ticket({
    required this.date,
    required this.count,
    this.isCancelled = false,
  });
}


class TicketsPage extends StatefulWidget {

  final List<Ticket> tickets;

  const TicketsPage({super.key, required this.tickets});



  @override

  State<TicketsPage> createState() => _TicketsPageState();

}



class _TicketsPageState extends State<TicketsPage> with SingleTickerProviderStateMixin {

  late TabController _tabController;



  @override

  void initState() {

    _tabController = TabController(length: 2, vsync: this);

    super.initState();

  }



  void _cancelTicket(Ticket ticket) {

    setState(() {

      ticket.isCancelled = true;

    });

  }



  Widget _buildTicketCard(Ticket ticket) {

    return Card(

      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),

      child: ListTile(

        title: Text("Event Name"),

        subtitle: Text("${ticket.date.toLocal().toString().split(' ')[0]}\n${ticket.count} tickets"),

        trailing: ticket.isCancelled

            ? const Text("Cancelled", style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold))

            : ElevatedButton(

          onPressed: () => _cancelTicket(ticket),

          style: ElevatedButton.styleFrom(backgroundColor: Colors.deepPurple),

          child: const Text("Cancel"),

        ),

      ),

    );

  }



  @override

  Widget build(BuildContext context) {

    final now = DateTime.now();

    final upcoming = widget.tickets.where((t) => t.date.isAfter(now)).toList();

    final past = widget.tickets.where((t) => !t.date.isAfter(now)).toList();



    return Scaffold(

      backgroundColor: const Color(0xFFF7F2FC),

      appBar: AppBar(

        title: const Text("Tickets"),

        backgroundColor: Colors.deepPurple,

        bottom: TabBar(

          controller: _tabController,

          indicatorColor: Colors.white,

          tabs: const [

            Tab(text: "Upcoming"),

            Tab(text: "Past"),

          ],

        ),

      ),

      body: TabBarView(

        controller: _tabController,

        children: [

          ListView(children: upcoming.map(_buildTicketCard).toList()),

          ListView(children: past.map(_buildTicketCard).toList()),

        ],

      ),

    );

  }

}

