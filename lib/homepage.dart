import 'package:flutter/material.dart';
import 'package:storyai/components/image_display.dart';
import 'package:storyai/components/submit_display.dart';
import 'package:storyai/service/api.dart';
import 'package:openai_dalle_wrapper/openai_dalle_wrapper.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final api = Api();

  String? imageUrl;
  bool isFetching = false;
  String? fetchError;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          if (fetchError != null)
            Text(
              fetchError!,
              style: const TextStyle(color: Colors.red, fontSize: 20),
            ),
          Expanded(
              flex: 2,
              child: Center(
                  child: ImageDisplay(
                imageUrl: imageUrl,
                isFetching: isFetching,
              ))),
          Expanded(
            flex: 1,
            child: Center(
              child: SubmitDisplay(
                onSubmit: (text) =>
                    submit(text), // Pass the submit function directly
              ),
            ),
          )
        ],
      ),
    );
  }

  Future<void> submit(String prompt) async {
    setState(() {
      fetchError = null;
      isFetching = true;
    });
    try {
      final result = await api.fetchDalleImageUrl(prompt);
      setState(() => imageUrl = result);
    } catch (e) {
      setState(() => fetchError = e.toString());
    } finally {
      setState(() => isFetching = false);
    }
  }
}
