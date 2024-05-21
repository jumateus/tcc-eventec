import 'package:flutter/material.dart';

class InserirEventoView extends StatefulWidget {
  @override
  _InserirEventoViewState createState() => _InserirEventoViewState();
}

class _InserirEventoViewState extends State<InserirEventoView> {
  TextEditingController nomeEventoController = TextEditingController();
  TextEditingController dataEventoController = TextEditingController();
  TextEditingController localEventoController = TextEditingController();
  bool eventoPago = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inserir Evento'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: nomeEventoController,
              decoration: InputDecoration(labelText: 'Nome do Evento'),
            ),
            SizedBox(height: 10),
            TextFormField(
              controller: dataEventoController,
              decoration: InputDecoration(labelText: 'Data do Evento'),
              readOnly: true,
              onTap: () async {
                DateTime? pickedDate = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime.now(),
                  lastDate: DateTime(2101),
                );
                if (pickedDate != null && pickedDate != DateTime.now()) {
                  setState(() {
                    dataEventoController.text =
                        "${pickedDate.day}/${pickedDate.month}/${pickedDate.year}";
                  });
                }
              },
            ),
            SizedBox(height: 10),
            TextField(
              controller: localEventoController,
              decoration: InputDecoration(labelText: 'Local do Evento'),
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Text('Evento Pago'),
                Checkbox(
                  value: eventoPago,
                  onChanged: (value) {
                    setState(() {
                      eventoPago = value!;
                    });
                  },
                ),
              ],
            ),
            SizedBox(height: 20),
            Row(
              children: [
                ElevatedButton(
                  onPressed: () {
                    _salvarEvento();
                  },
                  child: Text('OK'),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {
                    // Navigate back to the previous page
                    Navigator.pop(context);
                  },
                  child: Text('Cancelar'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _salvarEvento() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Evento salvo com sucesso!'),
        duration: Duration(seconds: 2),
      ),
    );
  }
}