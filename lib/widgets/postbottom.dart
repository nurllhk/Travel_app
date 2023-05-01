import 'package:flutter/material.dart';

class postbottom extends StatelessWidget {
  const postbottom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 20, right: 20, top: 20),
      height: MediaQuery.of(context).size.height / 2.4,
      decoration: BoxDecoration(
          color: Color(0xFFEDF2F0),
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(35), topRight: Radius.circular(35))),
      child: ListView(
        children: [
          Padding(
            padding: EdgeInsets.only(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Paris, Fransa",
                      style:
                          TextStyle(fontSize: 23, fontWeight: FontWeight.w600),
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.star,
                          color: Colors.amberAccent,
                        ),
                        Text(
                          "4.8",
                          style: TextStyle(
                              fontWeight: FontWeight.w700, fontSize: 15),
                        )
                      ],
                    )
                  ],
                ),
                SizedBox(
                  height: 27,
                ),
                Text(
                  "Paris daima dünyanin en romantik sehirlerinden biri olarak"
                      " kabul edilmistir. Paris'in nüfusu banliyöleri ile birlikte "
                      "yaklasik 12 milyon civarindadir. Sehir merkezinin nüfusu ise"
                      " 2,3 milyon civarindadir. Sen Nehri çevresine kurulu olan sehir"
                      " Avrupa'nin en popüler yerlerinden biridir. Paris'te yer alan "
                      "birçok ünlü уар UNESCO Dünya Mirasi Listesi'nde yer almaktadir.",
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 17,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
