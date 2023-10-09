import 'package:flutter/material.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          ListTile(
            leading: const Icon(Icons.contacts),
            title: const Text('Contact'),
            onTap: (){
              Navigator.of(context).pop();
              Navigator.pushNamed(context, '/');
            },
          ),
          ListTile(
            leading: const Icon(Icons.browse_gallery),
            title: const Text('Gallery'),
            onTap: (){
              Navigator.of(context).pop();
              Navigator.pushNamed(context, '/gallery');
            },
          ),
        ],
      ),
    );
  }
}