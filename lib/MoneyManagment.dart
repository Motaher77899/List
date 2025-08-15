
import 'package:flutter/material.dart';

class MoneyManagment extends StatefulWidget {
  const MoneyManagment({super.key});

  @override
  State<MoneyManagment> createState() => _MoneyManagmentState();
}

class _MoneyManagmentState extends State<MoneyManagment>
    with SingleTickerProviderStateMixin {
  double _earning = 0;
  double _expense = 0;
  double _balance = 0;
  final List<Map<String, dynamic>> _earningList = [];
  final List<Map<String, dynamic>> _expenseList = [];
  final List<Map<String, dynamic>> _transactions = []; // merged list

  void _showAddBalanceSheet() {
    final TextEditingController _titleController = TextEditingController();
    final TextEditingController _amountController = TextEditingController();

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Padding(
          padding: EdgeInsets.only(
            left: 16,
            right: 16,
            top: 20,
            bottom: MediaQuery.of(context).viewInsets.bottom + 20,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text("Add Balance",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              const SizedBox(height: 10),
              TextField(
                controller: _titleController,
                decoration: const InputDecoration(
                  labelText: "Title",
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: _amountController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: "Amount",
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 15),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  minimumSize: const Size(double.infinity, 50),
                ),
                onPressed: () {
                  String title = _titleController.text.trim();
                  double amount =
                      double.tryParse(_amountController.text.trim()) ?? 0;

                  if (title.isNotEmpty && amount > 0) {
                    setState(() {
                      _balance += amount;
                      _earning += amount;

                      final newEntry = {
                        'title': title,
                        'amount': amount,
                        'date': DateTime.now().toString().split('.')[0],
                        'type': 'earning'
                      };

                      _earningList.add(newEntry);
                      _transactions.add(newEntry);
                    });
                    Navigator.pop(context);
                  }
                },
                child: const Text("Add",style: TextStyle(color: Colors.white)),
              ),
            ],
          ),
        );
      },
    );
  }

// Buy Item BottomSheet
  void _showBuyItemSheet() {
    final TextEditingController _titleController = TextEditingController();
    final TextEditingController _amountController = TextEditingController();

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Padding(
          padding: EdgeInsets.only(
            left: 16,
            right: 16,
            top: 20,
            bottom: MediaQuery.of(context).viewInsets.bottom + 20,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text("Buy Item",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              const SizedBox(height: 10),
              TextField(
                controller: _titleController,
                decoration: const InputDecoration(
                  labelText: "Item Name",
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: _amountController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: "Amount",
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 15),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  minimumSize: const Size(double.infinity, 50),

                ),
                onPressed: () {
                  String title = _titleController.text.trim();
                  double amount =
                      double.tryParse(_amountController.text.trim()) ?? 0;

                  if (title.isNotEmpty && amount > 0 && amount <= _balance) {
                    setState(() {
                      _balance -= amount;
                      _expense += amount;

                      final newEntry = {
                        'title': title,
                        'amount': amount,
                        'date': DateTime.now().toString().split('.')[0],
                        'type': 'expense'
                      };

                      _expenseList.add(newEntry);
                      _transactions.add(newEntry);
                    });
                    Navigator.pop(context);
                  }
                },
                child: const Text("Buy",style: TextStyle(color: Colors.white),),
              ),
            ],
          ),
        );
      },
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Money Management"),
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),
      body: Column(
        children: [
          Row(
            children: [
              _SummaryCard(
                  title: 'Earning',
                  value: _earning,
                  color: Colors.green,
                  fontWeight: FontWeight.normal),
              _SummaryCard(
                  title: 'Expense',
                  value: _expense,
                  color: Colors.red,
                  fontWeight: FontWeight.normal),
              _SummaryCard(
                  title: 'Balance',
                  value: _balance,
                  color: Colors.blueAccent,
                  fontWeight: FontWeight.bold)
            ],
          ),
          Row(
            children: [
              _BalanceCard(
                  icon: Icons.add,
                  title: 'Add Balance',
                  color: Colors.green,
                  onTap: _showAddBalanceSheet),
              _BalanceCard(
                  icon: Icons.remove_circle,
                  title: 'Buy Item',
                  color: Colors.red,
                  onTap: _showBuyItemSheet)
            ],
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              "All Transactions",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          _buildTransactionList(_transactions),
        ],
      ),
    );
  }
}

// Summary Card
Widget _SummaryCard(
    {required String title,
      required double value,
      required Color color,
      required FontWeight fontWeight}) {
  return Expanded(
    child: Card(
      color: color,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Text(value.toString(),
                style: TextStyle(
                    fontSize: 26, color: Colors.white, fontWeight: fontWeight)),
            Text(title,
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                ))
          ],
        ),
      ),
    ),
  );
}

// Action Buttons
Widget _BalanceCard(
    {required IconData icon,
      required String title,
      required Color color,
      required VoidCallback onTap}) {
  return Expanded(
    child: Padding(
      padding: const EdgeInsets.all(50.0),
      child: InkWell(
        onTap: onTap,
        child: Card(
          color: color,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Icon(
                  icon,
                  color: Colors.white,
                  size: 32,
                ),
                Text(
                  title,
                  style: const TextStyle(color: Colors.white),
                )
              ],
            ),
          ),
        ),
      ),
    ),
  );
}

// All Transactions List
Widget _buildTransactionList(List<Map<String, dynamic>> transactions) {
  return Expanded(
    child: ListView.builder(
      itemCount: transactions.length,
      itemBuilder: (context, index) {
        final item = transactions[index];
        final isEarning = item['type'] == 'earning';
        final color = isEarning ? Colors.green : Colors.red;

        return Card(
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: color.withOpacity(0.2),
              child: Icon(
                isEarning ? Icons.arrow_downward : Icons.arrow_upward,
                color: color,
              ),
            ),
            title: Text(item['title'],style:TextStyle(fontSize: 20) ,),
            subtitle: Text(item['date'].toString()),
            trailing: Text(
              '৳ ${item['amount']}',
              style: TextStyle(color: color, fontWeight: FontWeight.bold,fontSize: 20),
            ),
          ),
        );
      },
    ),
  );
}
