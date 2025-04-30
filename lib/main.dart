import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyWidget());
}

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  var counter = 1;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.grey.shade100,
        appBar: AppBar(
          title: Text(
            "Increment Decrement",
            style: GoogleFonts.poppins(color: Colors.white),
          ),
          backgroundColor: Colors.blue,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'COUNTER',
                style: GoogleFonts.poppins(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 20),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),

                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade300),
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.blue,
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    _buildCircleButton(Icons.remove, () {
                      if (counter < 1) return;
                      setState(() {
                        counter--;
                      });
                    }),
                    SizedBox(width: 20),

                    Container(
                      padding: EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 20,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        counter.toString(),
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                    SizedBox(width: 20),
                    _buildCircleButton(Icons.add, () {
                      setState(() {
                        counter++;
                      });
                    }),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCircleButton(IconData icon, VoidCallback onPressed) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(40), // Shadow color with opacity
            offset: Offset(4, 4), // Horizontal and vertical offset
            blurRadius: 10, // The spread of the shadow
            spreadRadius: 2, // How much the shadow spreads
          ),
        ],
      ),
      child: IconButton(
        icon: Icon(icon),
        onPressed: onPressed,
        splashRadius: 24,
      ),
    );
  }
}

//keterangan

// StatelessWidget (widget tanpa perubahan / tetap)
//    Widget ini tidak menyimpan data yang berubah ataupun memperngaruhi tampilan yang berubah pada widget.
//    Isinya tetap dari awal sampai akhir — kayak tulisan di tembok, tidak berubah kecuali dibongkar total.
// StatefulWidget (widget yang bisa berubah)
//    Widget ini menyimpan data (state) dan bisa berubah sesuai interaksi atau logikan dan dapat mempengaruhi tampilan widget.
//    Kayak papan tulis — bisa ditulis, dihapus, diubah kapan saja.
// set state
//    Fungsi yang digunakan dalam StatefulWidget untuk memperbarui UI ketika ada perubahan data.
