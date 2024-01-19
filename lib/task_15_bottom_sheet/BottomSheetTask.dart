import 'package:flutter/material.dart';
import '../common/Constant_Strings.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';

class BottomSheetTask extends StatefulWidget {
  const BottomSheetTask({super.key});

  @override
  State<BottomSheetTask> createState() => _BottomSheetTaskState();
}

class _BottomSheetTaskState extends State<BottomSheetTask> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Center(child: Text(ConstantString.str_task_15_sub_title, style: GoogleFonts.acme(fontWeight: FontWeight.normal, fontSize: 20, decoration: TextDecoration.none, color: Colors.white),),),
        iconTheme: const IconThemeData(color: Colors.white,),
      ),
      body:Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(style: ElevatedButton.styleFrom(primary: Colors.red,),
              child: Text("Click to Open Bottom Sheet", style: GoogleFonts.acme(fontWeight: FontWeight.normal, fontSize: 18, decoration: TextDecoration.none, color: Colors.white),),
                onPressed: () => {
                      showModalBottomSheet(context: context, builder: (context) {
                          return Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.rectangle,
                              borderRadius: BorderRadius.circular(15),
                              color: Colors.red[50],
                            ),
                            //color: Colors.red[50],
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                ListTile(
                                  leading: const Icon(Icons.photo),
                                  title: const Text('Photo'),
                                  onTap: () {
                                    showToast("Photo");
                                    Navigator.pop(context);
                                  },
                                ),
                                ListTile(
                                  leading: const Icon(Icons.music_note),
                                  title: const Text('Music'),
                                  onTap: () {
                                    showToast("Music");
                                    Navigator.pop(context);
                                  },
                                ),
                                ListTile(
                                  leading: const Icon(Icons.videocam),
                                  title: const Text('Video'),
                                  onTap: () {
                                    showToast("Video");
                                    Navigator.pop(context);
                                  },
                                ),
                                ListTile(
                                  leading: const Icon(Icons.share),
                                  title: const Text('Share'),
                                  onTap: () {
                                    showToast("Share");
                                    Navigator.pop(context);
                                  },
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    }),
          ],
        ));
  }

  void showToast(String message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.indigo,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }
}