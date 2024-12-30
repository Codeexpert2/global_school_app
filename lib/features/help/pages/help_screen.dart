import 'package:flutter/material.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:template/components/submit_button.dart';
import 'package:template/core/functions/validators.dart';

import '../providers/help_provider.dart';


class HelpScreen extends ConsumerWidget {
  const HelpScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final helpState = ref.watch(helpProvider);
    final helpNotifier = ref.read(helpProvider.notifier);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contact Us'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: helpState.formKey,
          child: Column(
            children: [
              SizedBox(
                height: 65,
                child: TextFormField(
                  autofocus: true,
                  autocorrect: true,
                  enableSuggestions: true,
                  focusNode: helpState.titleFocusNode,
                  controller: helpState.titleController,
                  decoration: const InputDecoration(
                    // labelText: 'Title',
                    // border: OutlineInputBorder(),
                    hintText: 'Enter Title',
                    // labelText: 'Email',
                    prefixIcon: Icon(Icons.email),
                  ),
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                  validator: userNameValidator,
                  onTapOutside: (event) {
                    FocusManager.instance.primaryFocus!.unfocus();
                  },
                  onFieldSubmitted: (_) =>
                      helpState.messageFocusNode.requestFocus(),
                ),
              ),
              const SizedBox(height: 16),
              TextFormField(
                autocorrect: true,
                enableSuggestions: true,
                focusNode: helpState.messageFocusNode,
                controller: helpState.messageController,
                keyboardType: TextInputType.multiline,
                textInputAction: TextInputAction.newline,
                validator: textAriaValidator,
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.all(16),
                  hintText: 'Enter Message',
                ),
                maxLength: 300,
                minLines: 5,
                maxLines: 7,
                onFieldSubmitted: (_) => helpNotifier.submit(),
              ),
              const SizedBox(height: 16),
              SubmitButton(
                text: 'Submit',
                isLoading: helpNotifier.isLoading,
                onPressed: helpNotifier.submit,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
