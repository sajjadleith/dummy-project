import 'package:flutter/material.dart';

import '../app-constain.dart';

class SperatedList extends StatefulWidget {
  const SperatedList({super.key});

  @override
  State<SperatedList> createState() => _SperatedListState();
}

class _SperatedListState extends State<SperatedList> {
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        padding: EdgeInsets.only(left: 20),
        width: MediaQuery.of(context).size.width,
        height: 180,
        child: ListView.separated(
          separatorBuilder: (context, index) {
            return SizedBox(width: 10);
          },
          itemCount: 5,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 120,
                  height: 120,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    image: DecorationImage(
                      image: AssetImage(
                        "${AppConstain.imgs[index]}",
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(height: 8),
                Padding(
                  padding: const EdgeInsets.only(left: 7),
                  child: Expanded(
                    child: SizedBox(
                      width:120,
                      child: Text(
                        "${AppConstain.quotes[index]}",
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
