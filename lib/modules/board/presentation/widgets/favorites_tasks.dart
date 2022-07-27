import 'package:algoriza_task2/shared/cubit/cubit.dart';
import 'package:algoriza_task2/shared/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoritesTasksWidget extends StatefulWidget {
  const FavoritesTasksWidget({Key? key}) : super(key: key);

  @override
  State<FavoritesTasksWidget> createState() => _FavoritesTasksWidgetState();
}

class _FavoritesTasksWidgetState extends State<FavoritesTasksWidget> {
  @override
  Widget build(BuildContext context) {
    return  BlocConsumer<AppCubit,AppStates>(
        listener: (BuildContext context, AppStates state) {},
        builder: (BuildContext context,AppStates  state){


          var tasks = AppCubit.get(context).favTasks;

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
        Expanded(child: Text('${model['title']}')),
        const SizedBox(
          width: 20,
        ),
        PopupMenuButton(
          icon: const Icon(Icons.more_horiz_outlined,color: Colors.green,),
          itemBuilder: (BuildContext context) => <PopupMenuEntry>[
            PopupMenuItem(
              child: ListTile(
                leading: IconButton(
                    onPressed: (){
                      AppCubit.get(context).updateData(status: 'Completed', id: model['id'],);
                    },
                    icon: const Icon(Icons.done)),
                title:  TextButton(onPressed: (){
                  AppCubit.get(context).updateData(status: 'Completed', id: model['id'],);
                }, child: const Text('Completed'),),
              ),
            ),
            PopupMenuItem(
              child: ListTile(
                leading: IconButton(
                    onPressed: (){
                      AppCubit.get(context).updateData(status: 'UnCompleted', id: model['id'],);
                    },
                    icon: const Icon(Icons.undo)),
                title:  TextButton(onPressed: (){
                  AppCubit.get(context).updateData(status: 'UnCompleted', id: model['id'],);
                }, child: const Text('UnCompleted'),),
              ),
            ),
            PopupMenuItem(
              child: ListTile(
                leading: IconButton(
                    onPressed: (){
                      AppCubit.get(context).updateData(status: 'Favorite', id: model['id'],);
                    },
                    icon: const Icon(Icons.favorite)),
                title:  TextButton(onPressed: (){
                  AppCubit.get(context).updateData(status: 'Favorite', id: model['id'],);
                }, child: const Text('Favorite'),),
              ),
            ),
            PopupMenuItem(
              child: ListTile(
                leading: IconButton(
                    onPressed: (){
                      AppCubit.get(context).deleteTask(id: model['id'],);
                    },
                    icon: const Icon(Icons.delete)),
                title:  TextButton(onPressed: (){
                  AppCubit.get(context).deleteTask(id: model['id'],);
                }, child: const Text('Delete'),),
              ),
            ),
          ],
        ),
      ],
    ),
  );
}
