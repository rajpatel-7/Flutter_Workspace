import 'package:flutter/material.dart';

void main() {
  runApp(MyApp3());
}

class MyApp3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FeedbackForm(),
    );
  }
}

class FeedbackForm extends StatefulWidget {
  @override
  _FeedbackFormState createState() => _FeedbackFormState();
}

class _FeedbackFormState extends State<FeedbackForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _commentsController = TextEditingController();
  String _selectedRating = 'Excellent';
  bool _subscribe = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Feedback Form')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Rate our service:'),
              DropdownButtonFormField<String>(
                value: _selectedRating,
                items: ['Excellent', 'Good', 'Average', 'Poor']
                    .map((rating) => DropdownMenuItem(
                  value: rating,
                  child: Text(rating),
                ))
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    _selectedRating = value!;
                  });
                },
              ),
              SizedBox(height: 16.0),
              Text('Additional Comments:'),
              TextFormField(
                controller: _commentsController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                ),
                maxLines: 3,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your comments';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16.0),
              Row(
                children: [
                  Checkbox(
                    value: _subscribe,
                    onChanged: (value) {
                      setState(() {
                        _subscribe = value!;
                      });
                    },
                  ),
                  Text('Subscribe to newsletter')
                ],
              ),
              SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Feedback Submitted')),
                    );
                  }
                },
                child: Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
