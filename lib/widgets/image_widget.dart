

import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddImageWidget extends StatelessWidget
{
  final String imageUri,text,imageUploadStatusIcon,imageURL;
  final Function onIconTap;
  final File _imageFile;
  AddImageWidget(this.imageUri,this.text,this.imageUploadStatusIcon,this.onIconTap,this._imageFile,this.imageURL);
  @override
  Widget build(BuildContext context) {
   return  Container(
       height: 60,
       width: double.infinity,
       margin: EdgeInsets.symmetric(horizontal: 24),
       decoration: BoxDecoration(
           borderRadius: BorderRadius.all(Radius.circular(12)),
           color: Color.fromRGBO(247,250,247,1),
           border: Border.all(color: Color.fromRGBO(84,88,90,0.14),width: 1.5)
       ),

       child: Row(
         children: <Widget>[
           Container(
               width:77,
               height: 60,
               padding: EdgeInsets.all(5),
               child:

               _imageFile==null?
               ClipRRect(
                   borderRadius: BorderRadius.circular(11),
                   child:imageURL!=''?Image.network(imageURL,fit: BoxFit.fill):Image.asset(imageUri,fit: BoxFit.fill)
               ):


               ClipRRect(
                   borderRadius: BorderRadius.circular(11),
                   child:Image.file(_imageFile,fit: BoxFit.fill)
               )





             /*  imageUri!=null && imageUri.contains('https')?

               ClipRRect(
                 borderRadius: BorderRadius.circular(11),
                 child: Image.network(imageUri,fit: BoxFit.fill)
               ):



               ClipRRect(
                 borderRadius: BorderRadius.circular(11),
                 child: _imageFile==null?Image.asset(imageUri,fit: BoxFit.fill):Image.file(_imageFile,fit: BoxFit.fill),
               )
*/
           ),

           SizedBox(width: 45),

           Text(
             text,
             style: TextStyle(
                 fontSize: 16,
                 fontFamily: 'OpenSans',
                 fontWeight: FontWeight.bold,
                 color: Color.fromRGBO(39,43,47,0.9)),
           ),

           Expanded(
             child: Container(),
           ),

         InkWell(
           onTap: (){
             onIconTap();

           },
           child:   Container(
             margin: EdgeInsets.only(right: 10),
             padding: EdgeInsets.all(13),
             width: 50,
             height: 50,
             child: Image.asset(imageUploadStatusIcon),
           ),
         )





         ],
       )
   );
  }

}