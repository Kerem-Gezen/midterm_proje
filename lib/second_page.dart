import 'package:flutter/material.dart';

class SecondPage extends StatefulWidget {
  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  List<String> yapilacaklar = [];
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('To-Do List'),
        backgroundColor: Colors.teal,
      ),
      body: Container(
        color: Color(0xFFFFF8E1),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(8),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: controller,
                      decoration: InputDecoration(
                        hintText: 'Yeni görev ekle',
                        filled: true,
                        fillColor: Colors.white70,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 8),
                  ElevatedButton(
                    child: Icon(Icons.add),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.teal,
                      padding: EdgeInsets.all(16),
                    ),
                    onPressed: () {
                      setState(() {
                        if (controller.text.isNotEmpty) {
                          yapilacaklar.add(controller.text);
                          controller.clear();
                        }
                      });
                    },
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: yapilacaklar.length,
                itemBuilder: (context, index) {
                  return Card(
                    color: Colors.grey.shade200,
                    margin: EdgeInsets.symmetric(vertical: 6, horizontal: 12),
                    child: ListTile(
                      leading: Icon(Icons.check_circle_outline, color: Colors.teal),
                      title: Text(
                        yapilacaklar[index],
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      trailing: IconButton(
                        icon: Icon(Icons.delete, color: Colors.red),
                        onPressed: () {
                          setState(() {
                            yapilacaklar.removeAt(index);
                          });
                        },
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}