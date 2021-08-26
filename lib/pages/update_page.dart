import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:patterns_block_real_api/blocs/update_page_cubit.dart';
import 'package:patterns_block_real_api/blocs/update_page_state.dart';
import 'package:patterns_block_real_api/model/contact_model.dart';
import 'package:patterns_block_real_api/views/view_of_update.dart';

class UpdatePage extends StatefulWidget {

  Contact contact;
  UpdatePage(this.contact, {Key key}) : super(key: key);

  @override
  _UpdatePageState createState() => _UpdatePageState();
}

class _UpdatePageState extends State<UpdatePage> {
  TextEditingController titleController = TextEditingController();
  TextEditingController bodyController = TextEditingController();
  bool isLoading = false;

  @override
  void initState() {
    super.initState();

    titleController.text = widget.contact.username;
    bodyController.text = widget.contact.phoneNumber;
  }

  _finish(BuildContext context) {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      Navigator.pop(context, "result");
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UpdatePageCubit(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Update contact'),
        ),
        body: BlocBuilder<UpdatePageCubit, UpdatePageState> (
          builder: (BuildContext context, UpdatePageState state) {
            if (state is UpdatePageLoading) {
              return viewOfUpdate(context, titleController, bodyController, widget.contact.id, isLoading);
            }

            if (state is UpdatePageLoaded) {
              _finish(context);
            }

            if (state is UpdatePageError) {
              //
            }

            return viewOfUpdate(context, titleController, bodyController, widget.contact.id, isLoading);
          },
        ),
      ),
    );
  }
}
