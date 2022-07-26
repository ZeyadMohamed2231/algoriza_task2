import 'package:algoriza_task2/shared/components/form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';


class AddTaskWidget extends StatefulWidget {
  const AddTaskWidget({Key? key}) : super(key: key);

  @override
  State<AddTaskWidget> createState() => _AddTaskWidgetState();
}

class _AddTaskWidgetState extends State<AddTaskWidget> {
TimeOfDay endTime = const TimeOfDay(hour: 10, minute: 30);
TimeOfDay startTime = const TimeOfDay(hour: 10, minute: 30);
String dropdownValue = 'One';
final items = ['1 day before',  '1 hour before',  '30 min before',  '10 min before'];
String? value;


final itemsRepeat = ['Weekly',  'Daily'];
String? valueRepeat;

DropdownMenuItem<String> buildMenuItem(String item) => DropdownMenuItem(
  value: item,
  child: Padding(
    padding: const EdgeInsets.all(8.0),
    child: Text(
      item,
      style: const TextStyle(
          color: Colors.grey,
          fontSize: 15
      ),
    ),
  ),
);


  late TextEditingController title;
  String finalDate = '22-3-2021';
  @override
  Widget build(BuildContext context) {
    title = TextEditingController();
    return Column(
      children:  [
        Padding(
           padding: const EdgeInsets.all(20.0),
           child: Container(
             alignment: Alignment.topLeft,
             child: const Text(
                 'Title',
               style: TextStyle(
                 fontWeight: FontWeight.bold,
                 fontSize: 18.0
               ),

             ),
           ),
         ),
        MyForm(
            height: 50,
            width: double.infinity,
            controller: title,
            textInputType: TextInputType.text,
            labelText: 'Design Team Meeting'),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Container(
            alignment: Alignment.topLeft,
            child: const Text(
              'Date',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0
              ),

            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20,right: 20),
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0,),
                color: Colors.grey[200]
            ),
            width: double.infinity,
            height: 50,
            child: Row(
              children:  [
                Padding(
                  padding: const EdgeInsets.only(left: 15.0),
                  child: TextButton(
                      child: Text(
                      finalDate,
                      style: const TextStyle(
                          color: Colors.grey
                      ),
                      ),
                    onPressed: (){
                      DatePicker.showDatePicker(context,
                          showTitleActions: true,
                          minTime: DateTime(2022, 3, 5),
                          maxTime: DateTime(2030, 6, 7), onChanged: (finalDate) {
                            debugPrint('change $finalDate');
                          }, onConfirm: (finalDate) {
                            debugPrint('confirm $finalDate');
                          }, currentTime: DateTime.now(), locale: LocaleType.en
                      );
                    },
                  ),
                ),
                const SizedBox(width: 200,),
                IconButton(
                  icon:const Icon(Icons.arrow_drop_down)
                    , onPressed: () {
                  DatePicker.showDatePicker(context,
                      showTitleActions: true,
                      minTime: DateTime(2022, 3, 5),
                      maxTime: DateTime(2030, 6, 7), onChanged: (finalDate) {
                        debugPrint('change $finalDate');
                      }, onConfirm: (finalDate) {
                        debugPrint('confirm $finalDate');
                      }, currentTime: DateTime.now(), locale: LocaleType.en
                  );
                },
                )
              ],
    )


          ),

        ),
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                alignment: Alignment.topLeft,
                child: const Text(
                  'Start Time',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0
                  ),

                ),
              ),
            ),
            const SizedBox(width: 50,),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Container(
                    alignment: Alignment.topLeft,
                    child: const Text(
                      'End Time',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0
                      ),

                    ),
                  ),
                ),

              ],
            ),
          ],
        ),
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0,),
                    color: Colors.grey[200]
                ),
                width: 140,
                height: 50,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextButton(
                      onPressed: () async{
                        TimeOfDay? newTime = await  showTimePicker(
                            context: context,
                            initialTime: startTime);
                        if(newTime == null) return;
                        setState(()=> startTime=newTime);
                      },
                      child: Text(
                        '${startTime.hour}:${startTime.minute} ${startTime.period.name.toUpperCase()}',
                        style: const TextStyle(
                            color: Colors.grey
                        ),
                      ),
                    ),
                    const SizedBox(width: 15,),
                    IconButton(onPressed: () async{
                      TimeOfDay? newTime = await  showTimePicker(
                          context: context,
                          initialTime: startTime);
                      if(newTime == null) return;
                      setState(()=> startTime=newTime);
                    },
                        icon: const Icon(
                          Icons.access_time_outlined,
                          color: Colors.grey,

                        )
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(width: 20,),
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0,),
                    color: Colors.grey[200]
                ),
                width: 140,
                height: 50,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                      TextButton(
                          onPressed: () async{
                            TimeOfDay? newTime = await  showTimePicker(
                                context: context,
                                initialTime: endTime);
                            if(newTime == null) return;
                            setState(()=> endTime=newTime);
                          },
                          child: Text(
                            '${endTime.hour}:${endTime.minute} ${endTime.period.name.toUpperCase()}',
                            style: const TextStyle(
                              color: Colors.grey
                            ),
                          ),
                      ),
                    const SizedBox(width: 15,),
                    IconButton(onPressed: () async{
                        TimeOfDay? newTime = await  showTimePicker(
                            context: context,
                            initialTime: endTime);
                        if(newTime == null) return;
                        setState(()=> endTime=newTime);
                    },
                        icon: const Icon(
                            Icons.access_time_outlined,
                          color: Colors.grey,

                        )
                    ),

                  ],
                ),

              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Container(
            alignment: Alignment.topLeft,
            child: const Text(
              'Remind',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0
              ),

            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20,right: 20),
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0,),
                color: Colors.grey[200]
            ),
            width: double.infinity,
            height: 50,
            child: DropdownButton<String>(
              hint: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                    '1 day before'
                ),
              ),
              isExpanded: true,
              value: value,
              items: items.map(buildMenuItem).toList(),
              onChanged: (value) => setState(()=>this.value = value),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Container(
            alignment: Alignment.topLeft,
            child: const Text(
              'Repeat',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0
              ),

            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20,right: 20),
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0,),
                color: Colors.grey[200]
            ),
            width: double.infinity,
            height: 50,
            child: DropdownButton<String>(
              hint: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                    'Weekly'
                ),
              ),
              isExpanded: true,
              value: valueRepeat,
              items: itemsRepeat.map(buildMenuItem).toList(),
              onChanged: (value) => setState(()=>this.valueRepeat = value),
            ),
          ),
        ),
        const SizedBox(height: 20,),
        SizedBox(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.only(left: 30.0,right: 30.0),
            child: FloatingActionButton.extended(
              onPressed: (){
                // Navigator.push(context, MaterialPageRoute(builder: (context) => const AddTaskScreen()),);
              },
              backgroundColor: Colors.green,
              label: const Text(
                  'Create a Task'
              ),
            ),
          ),
        ),
        






      ],
    );
  }
}
