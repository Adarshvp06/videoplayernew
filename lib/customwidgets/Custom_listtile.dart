import 'package:flutter/material.dart';

class CustomListtile extends StatelessWidget {
  CustomListtile(
      {super.key,
      required this.onTap,
      required this.thumbnail,
      required this.titletext,
      required this.timetext,
   
      this.dismissiblekey});
   final void Function()? onTap;
  final String? titletext;
  final String? timetext;
  final Widget? thumbnail;
  final String? dismissiblekey;
  
  @override
  Widget build(BuildContext context) {
    return Dismissible(
      direction: DismissDirection.endToStart,
      onDismissed: (direction) {
        if (direction == DismissDirection.endToStart) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              duration: const Duration(seconds: 1),
              behavior: SnackBarBehavior.floating,
              action: SnackBarAction(
                  textColor: Colors.black, label: "Undo", onPressed: () {}),
              content: const Text(
                "Item deleted",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              )));
        }
      },
      background: Card(
        color: Colors.red[400],
        child: const Padding(
          padding: EdgeInsets.only(right: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [Icon(Icons.delete)],
          ),
        ),
      ),
      key: Key(dismissiblekey!),
      child: ListTile(
        minLeadingWidth: 50,
        onTap: onTap,
        horizontalTitleGap: 20,
        leading: thumbnail,
        title: Text(
          titletext.toString(),
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
        subtitle: Text(timetext.toString(),
            style:
                const TextStyle(fontSize: 13, fontWeight: FontWeight.normal)),
        trailing: IconButton(
            highlightColor: Colors.orange,
            onPressed: () {},
            icon: const Icon(Icons.more_vert)),
      ),
    );
  }
}
