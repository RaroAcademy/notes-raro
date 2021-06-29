import 'package:flutter/material.dart';

class CreatePage extends StatefulWidget {
  final String? title;
  final String? subtitle;
  CreatePage({
    Key? key,
    this.title,
    this.subtitle,
  }) : super(key: key);

  @override
  _CreatePageState createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage> {
  final formKey = GlobalKey<FormState>();
  var title;
  var subtitle;

  void validate() {
    final form = formKey.currentState;
    if (form!.validate()) {
      final map = Map<String, dynamic>();
      map.addAll({"title": title, "subtitle": subtitle});
      Navigator.pop(context, map);
    }
  }

  @override
  void initState() {
    title = widget.title;
    subtitle = widget.subtitle;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Create"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                initialValue: widget.title,
                onChanged: (value) {
                  title = value;
                },
                validator: (value) =>
                    value!.isEmpty ? "Title precisa ser preeenchido" : null,
                decoration: InputDecoration(labelText: "Title"),
              ),
              TextFormField(
                initialValue: widget.subtitle,
                validator: (value) =>
                    value!.isEmpty ? "SubTitle precisa ser preeenchido" : null,
                onChanged: (value) {
                  subtitle = value;
                },
                decoration: InputDecoration(labelText: "Subtitle"),
              ),
              SizedBox(
                height: 48,
              ),
              Row(
                children: [
                  Expanded(
                      child: ElevatedButton(
                          onPressed: () {
                            validate();
                          },
                          child: Text("Salvar"))),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
