import 'package:flutter/material.dart';

class PrettyTextFieldDemo extends StatelessWidget {
  const PrettyTextFieldDemo({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    final controller = TextEditingController();
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: const Text('Pretty TextFormField ✨'),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(24),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 24),
                TextFormField(
                  controller: controller,
                  maxLength: 20,
                  autofocus: true,
                  onChanged: ((String? text) {
                    formKey.currentState?.validate();
                  }),
                  decoration: InputDecoration(
                    labelText: '사용자 이름',
                    hintText: '최소 3자 이상 입력해 주세요',
                    // prefixIcon: const Icon(Icons.person),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue.withValues(blue: 0.5), width: 2),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.red),
                    )
                  ),
                  validator: (String? value) {
                    if (value == null || value.trim().isEmpty) {
                      return '이 필드는 필수입니다.';
                    } else if (value.trim().length < 3) {
                      return '3자 이상 입력해 주세요.';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 24),
                ElevatedButton.icon(
                  icon: const Icon(Icons.check),
                  label: const Text('확인'),
                  onPressed: () {
                    final isValid = formKey.currentState?.validate() ?? false;
                    if (isValid) {
                      final name = controller.text.trim();
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Hello, $name! 🎉')),
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
