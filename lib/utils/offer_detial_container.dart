import "package:flutter/material.dart";

class OfferDetailContainer extends StatelessWidget {
  final bool isCompleted;
  final String title;
  final String description;
  final int reward;

  const OfferDetailContainer(
      {
        super.key,
        required this.isCompleted,
        required this.title,
        required this.description,
        required this.reward
      }
  );

  @override
  Widget build(BuildContext context) {

    Widget iconSelection() {
      if(isCompleted){
        return const  Icon(
          Icons.check_rounded,
          color: Colors.white,
        );
      } else {
        return const Icon(
          Icons.checklist,
          color: Colors.white,
        );
      }

    }

    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: isCompleted ? Colors.green : Colors.amber,
              width: 2,
            )
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        height: 30,
                        width: 30,
                        decoration: BoxDecoration(
                            color: isCompleted ? Colors.green : Colors.amber,
                            borderRadius: BorderRadius.circular(100)
                        ),
                        child: iconSelection(),
                      ),

                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text(
                          title,
                          style: TextStyle(color: Theme.of(context).colorScheme.onBackground,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),


                  Container(
                    height: 30,
                    decoration: BoxDecoration(
                        color: isCompleted ? Colors.green : Colors.amber,
                        borderRadius: BorderRadius.circular(100)
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Center(child: Text("${reward}")),
                    ),
                  )
                ],
              ),

              Text(
                description,
                style: TextStyle(
                  color: Colors.grey.shade700
                ),
              )

            ],
          ),
        ),
      ),
    );
  }
}
