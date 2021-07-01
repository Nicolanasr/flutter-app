import 'package:flutter/material.dart';

class VenderInfoTab extends StatelessWidget {
  String storeName = 'MK Electronics', vendorName = 'Maroun Karam';
  List<String> address = ['Jounieh', 'Kaslik', 'Sarba', 'Mount Lebanon'];
  double? ratings;

  VenderInfoTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Vendor Information',
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: Colors.blueGrey[900],
                  fontSize: 20)),
          const SizedBox(
            height: 15,
          ),
          Text('Store Name: $storeName', style: const TextStyle(fontSize: 15)),
          const SizedBox(
            height: 5,
          ),
          GestureDetector(
            onTap: () {},
            child: RichText(
                text: TextSpan(children: [
              const TextSpan(
                text: 'Vendor: ',
                style: TextStyle(fontSize: 15, color: Colors.black),
              ),
              TextSpan(
                  text: vendorName,
                  style: TextStyle(fontSize: 15, color: Colors.blue[700])),
            ])),
          ),
          const SizedBox(
            height: 5,
          ),
          const Text('Address: ',
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
          for (int i = 0; i < address.length; i++)
            Text(address[i], style: const TextStyle(fontSize: 15)),
          const SizedBox(
            height: 5,
          ),
          ratings == null
              ? const Text('No ratings found yet!',
                  style: TextStyle(fontSize: 15))
              : Text('ratings: : $ratings',
                  style: const TextStyle(fontSize: 15)),
        ],
      ),
    );
  }
}
