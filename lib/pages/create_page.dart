import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:patterns_block_real_api/blocs/create_page_cubit.dart';
import 'package:patterns_block_real_api/blocs/create_page_state.dart';
import 'package:patterns_block_real_api/views/view_of_create.dart';

class CreatePage extends StatefulWidget {
  const CreatePage({Key key}) : super(key: key);

  @override
  _CreatePageState createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage> {
  TextEditingController titleController = TextEditingController();
  TextEditingController bodyController = TextEditingController();
  bool isLoading = false;

  _finish(BuildContext context) {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      Navigator.pop(context, "result");
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CreatePageCubit(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Add contact'),
        ),
        body: BlocBuilder<CreatePageCubit, CreatePageState> (
          builder: (BuildContext context, CreatePageState state) {
            if (state is CreatePageLoading) {
              return viewOfCreate(context, titleController, bodyController, isLoading);
            }
            if (state is CreatePageLoaded) {
              _finish(context);
            }
            if (state is CreatePageError) {
              //
            }
            return viewOfCreate(context, titleController, bodyController, isLoading);
          },
        ),
      ),
    );
  }
}
