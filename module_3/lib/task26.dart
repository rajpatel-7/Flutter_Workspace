import 'package:flutter/material.dart';

void main() {
  runApp(InfiniteScrollApp());
}

class InfiniteScrollApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: InfiniteScrollScreen(),
    );
  }
}

class InfiniteScrollScreen extends StatefulWidget {
  @override
  _InfiniteScrollScreenState createState() => _InfiniteScrollScreenState();
}

class _InfiniteScrollScreenState extends State<InfiniteScrollScreen> {
  final List<int> _data = List.generate(20, (index) => index + 1); // Initial data
  final ScrollController _scrollController = ScrollController();
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent &&
        !_isLoading) {
      _loadMoreData();
    }
  }

  Future<void> _loadMoreData() async {
    setState(() {
      _isLoading = true;
    });

    await Future.delayed(Duration(seconds: 2));

    setState(() {
      final nextItems = List.generate(20, (index) => _data.length + index + 1);
      _data.addAll(nextItems);
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Infinite Scroll List'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              controller: _scrollController,
              itemCount: _data.length + 1,
              itemBuilder: (context, index) {
                if (index == _data.length) {
                  return _isLoading
                      ? Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Center(child: CircularProgressIndicator()),
                  )
                      : SizedBox.shrink();
                }
                return ListTile(
                  title: Text('Item ${_data[index]}'),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
