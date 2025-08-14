// import 'package:flutter/material.dart';
// class MoneyManagment extends StatefulWidget {
//   const MoneyManagment({super.key});
//
//   @override
//   State<MoneyManagment> createState() => _MoneyManagmentState();
// }
//
// class _MoneyManagmentState extends State<MoneyManagment> with SingleTickerProviderStateMixin{
//
//   double _earning = 0;
//   double _expense = 0;
//   double _balance = 0;
//   final List<Map<String, dynamic>> _earningList = [];
//   final List<Map<String, dynamic>> _expenseList = [];
//
//   @override
//
//
//
//   //Add Balance
//
//   void _showAddBalanceDialog() {
//     final TextEditingController _amountController = TextEditingController();
//
//     showDialog(
//       context: context,
//       builder: (context) => AlertDialog(
//         title: const Text("Add Balance"),
//         content: TextField(
//           controller: _amountController,
//           keyboardType: TextInputType.number,
//           decoration: const InputDecoration(hintText: "Enter amount"),
//         ),
//         actions: [
//           TextButton(
//             onPressed: () => Navigator.pop(context),
//             child: const Text("Cancel"),
//           ),
//           ElevatedButton(
//             onPressed: () {
//               double amount = double.tryParse(_amountController.text) ?? 0;
//               if (amount > 0) {
//                 setState(() {
//                   _balance += amount;
//                   _earning += amount; // চাইলে শুধু balance-এও রাখতে পারো
//                 });
//               }
//               Navigator.pop(context);
//             },
//             child: const Text("Add"),
//           ),
//         ],
//       ),
//     );
//   }
//
//
//   //Remove Balance
//
//   void _showRemoveBalanceDialog() {
//     final TextEditingController _amountController = TextEditingController();
//
//     showDialog(
//       context: context,
//       builder: (context) => AlertDialog(
//         title: const Text("Remove Balance"),
//         content: TextField(
//           controller: _amountController,
//           keyboardType: TextInputType.number,
//           decoration: const InputDecoration(hintText: "Enter amount"),
//         ),
//         actions: [
//           TextButton(
//             onPressed: () => Navigator.pop(context),
//             child: const Text("Cancel"),
//           ),
//           ElevatedButton(
//             onPressed: () {
//               double amount = double.tryParse(_amountController.text) ?? 0;
//               if (amount > 0 && amount <= _balance) {
//                 setState(() {
//                   _balance -= amount;
//                   _expense += amount;
//                 });
//               }
//               Navigator.pop(context);
//             },
//             child: const Text("Remove"),
//           ),
//         ],
//       ),
//     );
//   }
//
//     @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//
//         title: const Text("Money Managment"),
//         backgroundColor: Colors.blue,
//         centerTitle: true,
//
//       ),
//       body: Column(
//         children: [
//           Row(
//             children: [
//               _SummaryCard(title: 'Earning', value: _earning, color: Colors.green, fontWeight: FontWeight.normal,  ),
//               _SummaryCard(title: 'Expense', value: _expense, color: Colors.red, fontWeight:FontWeight.normal ),
//               _SummaryCard(title: 'Balance', value: _balance, color: Colors.blueAccent, fontWeight: FontWeight.bold)
//             ],
//
//           ),
//           Row(
//             children: [
//               _BalanceCard(icon:Icons.add , title: 'Add Balance', color: Colors.green,onTap: _showAddBalanceDialog),
//               _BalanceCard(icon:Icons.remove_circle, title: 'Buy Item', color: Colors.red, onTap:_showRemoveBalanceDialog )
//             ],
//           ),
//           _buildList(_earningList, Colors.green, true),
//           _buildList(_expenseList, Colors.red, false),
//         ],
//       ),
//
//     );
//   }
// }
// Widget _SummaryCard({required String title,required double value,required Color color,required FontWeight fontWeight }){
//   return Expanded(
//     child: Card(
//       color:color,
//       child: Padding(
//         padding: const EdgeInsets.all(20.0),
//         child: Column(
//           children: [
//             Text(value.toString(),style: TextStyle(
//                 fontSize: 26,
//                 color: Colors.white,
//                 fontWeight: fontWeight
//             )
//             ),
//             Text(title,style: TextStyle(
//                 fontSize: 16,
//                 color: Colors.white,
//
//             ))
//
//           ],
//         ),
//       ),
//     ),
//   );
//
//
// }
// Widget _BalanceCard({required IconData icon, required String title, required Color color, required VoidCallback onTap}){
//   return   Expanded(
//     child: Padding(
//       padding: const EdgeInsets.all(50.0),
//       child: InkWell(
//         onTap: onTap,
//         child: Card(
//           color:color,
//           child: Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Column(
//               children: [
//                 Icon(icon,color: Colors.white,size: 32,),
//                 Text(title,style: TextStyle(color: Colors.white),)
//               ],
//             ),
//           ),
//         ),
//       ),
//     ),
//   );
//
// }
// Widget _buildList(List<Map<String,dynamic>>items, Color color,bool isEarning){
//   return Expanded(
//     child: ListView.builder(
//         itemCount: items.length,
//         itemBuilder: (context,index){
//           return Card(
//             child: ListTile(
//               leading: CircleAvatar(
//                 backgroundColor: color.withOpacity(0.2),
//               ),
//               title: Text(items[index]['title']),
//               subtitle: Text(items[index]['date'].toString()),
//               trailing: Text(
//                 '৳ ${items[index]['amount']}',
//                 style: TextStyle(
//                     color: color,
//                     fontWeight: FontWeight.bold
//                 ),
//               ),
//
//             ),
//           );
//         }),
//   );
// }


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

  // Add Balance
  void _showAddBalanceDialog() {
    final TextEditingController _amountController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Add Balance"),
        content: TextField(
          controller: _amountController,
          keyboardType: TextInputType.number,
          decoration: const InputDecoration(hintText: "Enter amount"),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Cancel"),
          ),
          ElevatedButton(
            onPressed: () {
              double amount = double.tryParse(_amountController.text) ?? 0;
              if (amount > 0) {
                setState(() {
                  _balance += amount;
                  _earning += amount;

                  final newEntry = {
                    'title': 'Balance Added',
                    'amount': amount,
                    'date': DateTime.now().toString().split('.')[0],
                    'type': 'earning'
                  };

                  _earningList.add(newEntry);
                  _transactions.add(newEntry);
                });
              }
              Navigator.pop(context);
            },
            child: const Text("Add"),
          ),
        ],
      ),
    );
  }

  // Remove Balance
  void _showRemoveBalanceDialog() {
    final TextEditingController _amountController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Remove Balance"),
        content: TextField(
          controller: _amountController,
          keyboardType: TextInputType.number,
          decoration: const InputDecoration(hintText: "Enter amount"),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Cancel"),
          ),
          ElevatedButton(
            onPressed: () {
              double amount = double.tryParse(_amountController.text) ?? 0;
              if (amount > 0 && amount <= _balance) {
                setState(() {
                  _balance -= amount;
                  _expense += amount;

                  final newEntry = {
                    'title': 'Item Purchased',
                    'amount': amount,
                    'date': DateTime.now().toString().split('.')[0],
                    'type': 'expense'
                  };

                  _expenseList.add(newEntry);
                  _transactions.add(newEntry);
                });
              }
              Navigator.pop(context);
            },
            child: const Text("Remove"),
          ),
        ],
      ),
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
                  onTap: _showAddBalanceDialog),
              _BalanceCard(
                  icon: Icons.remove_circle,
                  title: 'Buy Item',
                  color: Colors.red,
                  onTap: _showRemoveBalanceDialog)
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
            title: Text(item['title']),
            subtitle: Text(item['date'].toString()),
            trailing: Text(
              '৳ ${item['amount']}',
              style: TextStyle(color: color, fontWeight: FontWeight.bold),
            ),
          ),
        );
      },
    ),
  );
}
