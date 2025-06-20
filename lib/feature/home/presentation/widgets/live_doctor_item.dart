import 'package:flutter/material.dart';

class LiveDoctorItem extends StatelessWidget {
  const LiveDoctorItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 130,
      height: 150,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(
            "https://th.bing.com/th/id/OIP.l96BdnBni68Vv9r_AgP7UgHaHa?w=187&h=187&c=7&r=0&o=7&dpr=1.3&pid=1.7&rm=3",
          ),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
