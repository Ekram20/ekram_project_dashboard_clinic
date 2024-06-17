import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ekram_project_dashboard_clinic/models/appColors.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:fluttertoast/fluttertoast.dart';
class SubscribeToTheSystemScreen extends StatefulWidget {
  

  @override
  State<SubscribeToTheSystemScreen> createState() => _SubscribeToTheSystemScreenState();
}

class _SubscribeToTheSystemScreenState extends State<SubscribeToTheSystemScreen> {
  
  final FirebaseStorage _storage = FirebaseStorage.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final GlobalKey<FormState> _formKey =GlobalKey<FormState>();

 

  late String clinicName;
  late String CertificateNumber;
  dynamic licenseImage;
  late String phoneNumber;
  bool status = false;
  bool isSee = false;

  pickImage()async{
    FilePickerResult? result = await FilePicker.platform.
    pickFiles(allowMultiple: false , type: FileType.image);
    if(result!=null){
      setState(() {
          licenseImage=result.files.first.bytes;
          
      });
    }
  }

 _uploadsubscribetToStorge(dynamic image)async{
    Reference ref =_storage.ref().child('Supscription');

    UploadTask uploadTask = ref.putData(image);

      TaskSnapshot snapshot = await uploadTask;
      String downloadUrl =await snapshot.ref.getDownloadURL();
      return downloadUrl;
  }
  __uploadsubscribetToFireStore()async{
    
    if(licenseImage!=null ){
      EasyLoading.show();
      String imageUrl =await _uploadsubscribetToStorge(licenseImage);
      await _firestore.collection('Supscription').doc().set({
        'licenseImage' : imageUrl,
        'clinicName' : clinicName,
        'CertificateNumber' : CertificateNumber,
        'phoneNumber' : phoneNumber,
        'status': status,
        'isSee' : isSee,
      }).whenComplete(() {

        EasyLoading.dismiss();
        setState(() {
         Fluttertoast.showToast(
        msg: "The request has been sent successfully",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Color.fromARGB(255, 83, 192, 73),
        textColor: Colors.white,
        fontSize: 16.0
    );
          licenseImage =null;
          _formKey.currentState!.reset();//clear the text field
        });
      })
      ;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SingleChildScrollView(
        child:Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                 Row(
                   children: [
                    Container(
                      child: Image.asset(
                        'images/logo.png',
                      width: MediaQuery.of(context).size.width/8,
                      height:MediaQuery.of(context).size.height/8 ,
                      ),
                    ),
                   Align(
                    alignment: Alignment.center,
                     child: Container(
                      height: 50,
                      width: 340,
                          child: Text(
                            ' مرحبا بك في تطبيق عيادتي',
                           
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            color: AppColors.primaryColor.shade200,
                            fontFamily: 'ElMessiri',
                            fontSize: 32,
                          ),
                          ),
                        ),
                   ),
                   ],
                 ),
                 Divider(
                     color: AppColors.greyColor.shade100,
                   ),
                     Container(
                        child: Text('Subscribe To The System ',
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          color: AppColors.primaryColor.shade200,
                          fontFamily: 'ElMessiri',
                          fontSize: 24,
                        ),
                        ),
                      ),
                   Divider(
                     color: AppColors.greyColor.shade100,
                   ),
                  
                    SizedBox(height: 20,),
                   Container(
                        height: MediaQuery.of(context).size.height /2,
                        width: MediaQuery.of(context).size.width /3,
                        decoration: BoxDecoration(
                          color: AppColors.greyColor.shade100,
                          border: Border.all(
                            color: AppColors.greyColor.shade600
                          ),
                          //borderRadius: BorderRadius.circular(10)
                        ),
                        child:licenseImage!=null 
                        ? Image.memory(
                          licenseImage,
                           fit: BoxFit.cover,
                           ) 
                        : Center(child: Text(
                          'license Image ',
                          style: TextStyle(
                            color: AppColors.greyColor.shade600,
                            fontSize: 32
                          )
                        )),
                      ),
                       SizedBox(height: 20,),
                       ElevatedButton(
                        style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).primaryColor,
                  elevation: 6
                ),
                        onPressed: (){
                         pickImage();
                        }, 
                      child: Text(' Upload Image',

                      style: TextStyle(
                        color: AppColors.whiteColor,
                      ),
                      ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width/3,
                        child: TextFormField(
                          onChanged: (value){
                            clinicName=value;
                          },
                          validator: (value){
                         if(value!.isEmpty){
                           return 'Please the clinicName name must be not empty';
                         }
                         else{
                           return null;
                         }
                       },
                          
                          decoration: InputDecoration(
                            labelText: 'Clinic Name',
                          ),
                            
                        ),
                      ),
                       SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width/3,
                        child: TextFormField(
                          onChanged: (value){
                            CertificateNumber=value;
                          },
                          validator: (value){
                         if(value!.isEmpty){
                           return 'Please the Certificate Number name must be not empty';
                         }
                         else{
                           return null;
                         }
                       },
                          
                          decoration: InputDecoration(
                            labelText: 'Certificate Number',
                          ),
                            
                        ),
                      ),

                      SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width/3,
                        child: TextFormField(
                          onChanged: (value){
                            phoneNumber=value;
                          },
                          validator: (value){
                         if(value!.isEmpty){
                           return 'Please the phone Number name must be not empty';
                         }
                         else{
                           return null;
                         }
                       },
                          
                          decoration: InputDecoration(
                            labelText: 'phone Number',
                          ),
                            
                        ),
                      ),
                       SizedBox(height: 30,),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).primaryColor,
                  elevation: 6
                ),
                onPressed: (){
                  try{
                    if(_formKey.currentState!.validate()){
                       __uploadsubscribetToFireStore();
                    }
                  }
                  catch(e){
                    print(e);
                  }
                 
                },
                 child: Text('Send Request',
                 style: TextStyle(
                  color: AppColors.whiteColor,
                 ),
                 ),
                 
                 )
              ],
            ),
          ),) ,),
    );
  }
}
