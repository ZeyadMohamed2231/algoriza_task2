import 'package:algoriza_task2/shared/components/constants.dart';
import 'package:algoriza_task2/shared/cubit/cubit.dart';
import 'package:algoriza_task2/shared/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class taskFolder{
  final int id;
  final String title;

  taskFolder({
  required this.id,
  required this.title,
  });

}




class AllTasksWidget extends StatelessWidget {
  // const AllTasksWidget({Key? key}) : super(key: key);


//
//   @override
//   State<AllTasksWidget> createState() => _AllTasksWidgetState();
// }
//
// class _AllTasksWidgetState extends State<AllTasksWidget> {

  List<String> items = ['Completed','UnCompleted','Favorite','Delete'];

  String? selectedItem = 'Completed';

  @override
  Widget build(BuildContext context) {

    return  BlocConsumer<AppCubit,AppStates>(
        listener: ( context,  state) {},
          builder: ( context,  state){
          var tasks = AppCubit.get(context).tasks;

          return ListView.separated(
              itemBuilder: (context,index) => buildUserItem(tasks[index]),
              separatorBuilder: (context,index) => Container(
                width: double.infinity,
                height: 1.0,
                color: Colors.grey[300],
              ),
              itemCount: tasks.length
          );
          }

      );

  }

  Widget buildUserItem(Map model) => Padding(
    padding: const EdgeInsets.all(20.0),
    child: Row(
      children:  [
        CircleAvatar(
          radius: 20.0,
          backgroundColor: Colors.green,
          child: Text(
            '${model['id']}',
            style: const TextStyle(
                fontSize: 25.0,
                fontWeight: FontWeight.bold,
                color: Colors.white
            ),
          ),
        ),
        const SizedBox(
          width: 20,
        ),
        Text('${model['title']}'),
        // const SizedBox(
        //   width: 180,
        // ),
        // IconButton(
        //     onPressed: (){
        //       // DropdownButton<String>(
        //       //   value: selectedItem,
        //       //   items: items.map((item) => DropdownMenuItem<String>(
        //       //       value: item,
        //       //       child: Text(item,style: TextStyle(fontSize: 24),),
        //       //     )
        //       //   ).toList(),
        //       //   onChanged: (item)=> setState(() => selectedItem = item),
        //       // );
        //     },
        //     icon: const Icon(
        //     Icons.more_horiz,
        //       color: Colors.green,
        // )),
      ],
    ),
  );
}
