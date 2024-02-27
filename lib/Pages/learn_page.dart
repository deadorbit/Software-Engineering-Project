import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class LearnPage extends StatefulWidget {
  const LearnPage({super.key});

  @override
  State<LearnPage> createState() => _LearnPageState();
}

class _LearnPageState extends State<LearnPage> {

  String value = "";
  double $precent = 0.00;
  String $progress = "0%";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 25.0, right: 25.0, top: 50.0),
        child: Column(
          children: [
            LinearPercentIndicator(
              lineHeight: 40,
              percent: $precent,
              progressColor: Colors.green,
              backgroundColor: Colors.red,
              center: Text($progress),
            ),
            DropdownButton<String>(
              items: const [
                DropdownMenuItem<String>(
                  value: "Lorem ipsum dolor sit amet. Qui odit sint est eius perferendis eos impedit nihil. Ab esse totam cum doloremque similique et corrupti sunt ab illum error aut ipsam cupiditate et fugit doloribus. Eos recusandae necessitatibus aut reprehenderit maiores qui voluptatem pariatur et error ducimus eum quis beatae. Qui soluta recusandae qui aliquid porro in doloremque laborum ut ipsum nemo et aliquam iste eos similique architecto. Et voluptatem laborum quo esse eius qui repellat dolor ut voluptatem dicta 33 nesciunt minima est possimus totam qui eligendi repudiandae. Sit odit voluptatum ut ipsum nihil ut iusto aperiam id placeat praesentium ea aspernatur harum aut rerum aliquid ut ratione error. Est impedit quibusdam ut harum dolorem sit repellendus totam eum earum accusamus nam cupiditate ullam. Id magni voluptates et ipsam dolores hic dicta saepe sed quod vero sit praesentium optio est ipsam amet ex enim facere. Non voluptas distinctio non velit dolorem sed dicta voluptas et consequuntur corporis et architecto possimus aut sequi voluptates vel unde vero.",
                  child: Text("Learning the Basics"),
                ),
                DropdownMenuItem<String>(
                  value: "Lorem ipsum dolor sit amet. Qui odit sint est eius perferendis eos impedit nihil. Ab esse totam cum doloremque similique et corrupti sunt ab illum error aut ipsam cupiditate et fugit doloribus. Eos recusandae necessitatibus aut reprehenderit maiores qui voluptatem pariatur et error ducimus eum quis beatae. Qui soluta recusandae qui aliquid porro in doloremque laborum ut ipsum nemo et aliquam iste eos similique architecto. Et voluptatem laborum quo esse eius qui repellat dolor ut voluptatem dicta 33 nesciunt minima est possimus totam qui eligendi repudiandae. Sit odit voluptatum ut ipsum nihil ut iusto aperiam id placeat praesentium ea aspernatur harum aut rerum aliquid ut ratione error. Est impedit quibusdam ut harum dolorem sit repellendus totam eum earum accusamus nam cupiditate ullam. Id magni voluptates et ipsam dolores hic dicta saepe sed quod vero sit praesentium optio est ipsam amet ex enim facere. Non voluptas distinctio non velit dolorem sed dicta voluptas et consequuntur corporis et architecto possimus aut sequi voluptates vel unde vero.",
                  child: Text("Learning Better Trades"),
                ),
                DropdownMenuItem<String>(
                  value: "Lorem ipsum dolor sit amet. Qui odit sint est eius perferendis eos impedit nihil. Ab esse totam cum doloremque similique et corrupti sunt ab illum error aut ipsam cupiditate et fugit doloribus. Eos recusandae necessitatibus aut reprehenderit maiores qui voluptatem pariatur et error ducimus eum quis beatae. Qui soluta recusandae qui aliquid porro in doloremque laborum ut ipsum nemo et aliquam iste eos similique architecto. Et voluptatem laborum quo esse eius qui repellat dolor ut voluptatem dicta 33 nesciunt minima est possimus totam qui eligendi repudiandae. Sit odit voluptatum ut ipsum nihil ut iusto aperiam id placeat praesentium ea aspernatur harum aut rerum aliquid ut ratione error. Est impedit quibusdam ut harum dolorem sit repellendus totam eum earum accusamus nam cupiditate ullam. Id magni voluptates et ipsam dolores hic dicta saepe sed quod vero sit praesentium optio est ipsam amet ex enim facere. Non voluptas distinctio non velit dolorem sed dicta voluptas et consequuntur corporis et architecto possimus aut sequi voluptates vel unde vero.",
                  child: Text("Learning Advanced Trading"),
                ),
                DropdownMenuItem<String>(
                  value: "Lorem ipsum dolor sit amet. Qui odit sint est eius perferendis eos impedit nihil. Ab esse totam cum doloremque similique et corrupti sunt ab illum error aut ipsam cupiditate et fugit doloribus. Eos recusandae necessitatibus aut reprehenderit maiores qui voluptatem pariatur et error ducimus eum quis beatae. Qui soluta recusandae qui aliquid porro in doloremque laborum ut ipsum nemo et aliquam iste eos similique architecto. Et voluptatem laborum quo esse eius qui repellat dolor ut voluptatem dicta 33 nesciunt minima est possimus totam qui eligendi repudiandae. Sit odit voluptatum ut ipsum nihil ut iusto aperiam id placeat praesentium ea aspernatur harum aut rerum aliquid ut ratione error. Est impedit quibusdam ut harum dolorem sit repellendus totam eum earum accusamus nam cupiditate ullam. Id magni voluptates et ipsam dolores hic dicta saepe sed quod vero sit praesentium optio est ipsam amet ex enim facere. Non voluptas distinctio non velit dolorem sed dicta voluptas et consequuntur corporis et architecto possimus aut sequi voluptates vel unde vero.",
                  child: Text("Learning More Advanced Trading"),
                ),
                DropdownMenuItem<String>(
                  value: "Lorem ipsum dolor sit amet. Qui odit sint est eius perferendis eos impedit nihil. Ab esse totam cum doloremque similique et corrupti sunt ab illum error aut ipsam cupiditate et fugit doloribus. Eos recusandae necessitatibus aut reprehenderit maiores qui voluptatem pariatur et error ducimus eum quis beatae. Qui soluta recusandae qui aliquid porro in doloremque laborum ut ipsum nemo et aliquam iste eos similique architecto. Et voluptatem laborum quo esse eius qui repellat dolor ut voluptatem dicta 33 nesciunt minima est possimus totam qui eligendi repudiandae. Sit odit voluptatum ut ipsum nihil ut iusto aperiam id placeat praesentium ea aspernatur harum aut rerum aliquid ut ratione error. Est impedit quibusdam ut harum dolorem sit repellendus totam eum earum accusamus nam cupiditate ullam. Id magni voluptates et ipsam dolores hic dicta saepe sed quod vero sit praesentium optio est ipsam amet ex enim facere. Non voluptas distinctio non velit dolorem sed dicta voluptas et consequuntur corporis et architecto possimus aut sequi voluptates vel unde vero.",
                  child: Text("Learning Mastering Trading"),
                ),
              ],
              onChanged: (_value) => {
                print(_value.toString()),
                setState(() {
                  value = _value.toString();
                })
              },
              hint: Text("Select Trading Chapter"),
            ),
            Text(
              "$value",
            ),
            ElevatedButton.icon(
              onPressed: () => {
                setState(() {
                  $precent += 0.2;
                }),
              }, 
              icon: Icon(Icons.bookmark), 
              label: Text("All Done"),
            ),
          ]
        )
      ),
    );  
  }
}
