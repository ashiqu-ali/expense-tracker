import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:expense_tracker/controller/db_helper.dart';
import 'package:expense_tracker/pages/main_page.dart';
import 'package:expense_tracker/utils/style.dart';

class EditTransaction extends StatefulWidget {
  final Map<String, dynamic> editData;
  final int index;

  const EditTransaction({Key? key, required this.editData, required this.index}) : super(key: key);

  @override
  State<EditTransaction> createState() => _EditTransactionState();
}

class _EditTransactionState extends State<EditTransaction> {
  int? amount;
  String note = " ";
  String? type;
  String? category;
  DateTime? date;
  DbHelper dbHelper = DbHelper();
  List<String> months = [
    'Jan',
    'Feb',
    'Mar',
    'Apr',
    'May',
    'Jun',
    'Jul',
    'Aug',
    'Sep',
    'Oct',
    'Nov',
    'Dec',
  ];

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: date,
      firstDate: DateTime(2000),
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != date) {
      setState(() {
        date = picked;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    type = widget.editData['type'];
    category = widget.editData['category'];
    amount = widget.editData['amount'];
    note = widget.editData['note'];
    category = widget.editData['category'];
    date = widget.editData['date'];
    print(widget.editData);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: ListView(
            children: [
              SizedBox(height: medium),
              Text(
                'Edit Transaction',
                style: heading1,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: medium),
              Row(
                children: [
                  Expanded(
                    child: ChoiceChip(
                      label: Text('Income', style: heading2),
                      selectedColor: Colors.blueAccent,
                      selected: type == 'Income',
                      onSelected: (val) {
                        if (val) {
                          setState(() {
                            type = 'Income';
                            category = 'Salary';
                          });
                        }
                      },
                    ),
                  ),
                  Expanded(
                    child: ChoiceChip(
                      label: Text('Expense', style: heading2),
                      selectedColor: Colors.blueAccent,
                      selected: type == 'Expense',
                      onSelected: (val) {
                        if (val) {
                          setState(() {
                            type = 'Expense';
                            category = 'Fashion';
                          });
                        }
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(height: medium),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: white,
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 16, top: 4, bottom: 4),
                  child: DropdownButton<String>(
                    value: category,
                    onChanged: (String? newValue) {
                      if (newValue != null) {
                        setState(() {
                          category = newValue;
                        });
                      }
                    },
                    items: (type == 'Income'
                        ? ['Salary', 'Bonus', 'Other Income']
                        : ['Fashion', 'Fuel', 'Food', 'Health'])
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value, style: p2),
                      );
                    }).toList(),
                    style: const TextStyle(fontSize: 16),
                    hint: const Text('Category'),
                    icon: const Icon(Icons.arrow_drop_down),
                    iconSize: 24,
                    elevation: 16,
                    isExpanded: true,
                    dropdownColor: Colors.white,
                    underline: Container(),
                  ),
                ),
              ),
              SizedBox(height: small),
              TextField(
                enableSuggestions: false,
                autocorrect: false,
                cursorColor: accent,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.currency_rupee, color: icon),
                  fillColor: white,
                  filled: true,
                  hintText: amount != null ? amount.toString() : '',
                  hintStyle: p1,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                ),
                onChanged: (val) {
                  try {
                    // If val is null or empty, set amount to null
                    amount = int.parse(val);
                  } catch (e) {
                    print(e);
                  }
                },
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                keyboardType: TextInputType.number,
                style: p2,
              ),
              SizedBox(height: small),
              TextField(
                enableSuggestions: false,
                autocorrect: false,
                cursorColor: accent,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.description_outlined, color: icon),
                  fillColor: white,
                  filled: true,
                  hintText: note,
                  hintStyle: p1,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                ),
                style: p2,
                onChanged: (val) {
                  note = val;
                },
              ),
              SizedBox(height: small),
              Row(
                children: [
                  TextButton(
                    onPressed: () {
                      _selectDate(context);
                    },
                    style: ButtonStyle(
                      padding: MaterialStateProperty.all(EdgeInsets.zero),
                    ),
                    child: Row(
                      children: [
                        SizedBox(width: small),
                        const Icon(Icons.date_range, color: icon),
                        SizedBox(width: xsmall),
                        Text(
                          '${date?.day}-${months[date!.month - 1]}-${date?.year}',
                          style: p2,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: medium),
              Row(
                children: [
                  IconButton(
                      onPressed: () async {
                        print(widget.index);
                        try{
                          await dbHelper.deleteData(widget.index);
                          print("Delete Succesfully");
                          Navigator.push(context, MaterialPageRoute(builder: (context) => const MainPage()));
                        } catch(e) {
                          print(e);
                        }
                      },
                      icon: const Icon(Icons.delete_outline_rounded)
                  ),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () async {
                        print(amount);
                        print(type);
                        print(category);
                        print(date);
                        print(note);
                        try{
                            await dbHelper.updateData(
                                    widget.index,
                                    amount!,
                                    date!,
                                    note,
                                    category!,
                                    type!
                            );
                            Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const MainPage()),
                            );
                              print('value updated');
                        }catch(e){
                          print(e);
                        }
                        },
                      child: const Text('Update'),
                    ),
                  ),

                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}