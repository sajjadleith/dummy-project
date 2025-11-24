import 'package:flutter/material.dart';
import 'package:music_app/controllers/product_provider.dart';
import 'package:provider/provider.dart';

class SperatedList extends StatefulWidget {
  const SperatedList({super.key});

  @override
  State<SperatedList> createState() => _SperatedListState();
}

class _SperatedListState extends State<SperatedList> {
  @override
  Widget build(BuildContext context) {
    final prov = context.watch<ProductProvider>();

    if (prov.allProduct.isEmpty) {
      return SliverToBoxAdapter(
        child: Center(child: CircularProgressIndicator()),
      );
    }
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
            final data = prov.allProduct[index];
            return GestureDetector(
              onTap: () {
                prov.filteredByCategory(data.category);
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 120,
                    height: 120,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      image: DecorationImage(
                        image: NetworkImage(data.image),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(height: 8),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 7),
                      child: SizedBox(
                        width: 120,
                        child: Text(
                          data.category,
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
              ),
            );
          },
        ),
      ),
    );
  }
}
