
import 'package:empdet/viewModel/EmployeeDetails/emp_details_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:empdet/helper/config.dart';
import 'package:empdet/helper/utils/screen_layout.dart';
import 'package:empdet/views/base_model_widget.dart';

// ignore: must_be_immutable
class EmpDetailsMobile extends BaseModelWidget<EmpDetailsScreenViewModel> {
  EmpDetailsScreenViewModel model = EmpDetailsScreenViewModel();
  late BuildContext context;

  EmpDetailsMobile({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context, EmpDetailsScreenViewModel model) {
    this.context = context;
    this.model = model;
    QSize().init(context);
    return initializeUI();
  }

  Widget initializeUI() {
    return SafeArea(
      child: ModalProgressHUD(
      inAsyncCall: model.busy,
      progressIndicator: CircularProgressIndicator() ,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.3,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios,color: ColorValues.baseColor,),
            tooltip: 'Goto Dashboard',
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: SizedBox(
              width: QSize.screenWidth * 0.2,
              child: Image.asset(ImageFile.empdetLogo)),
          ),
        body:Container(
      color: Colors.white,
      width: QSize.screenWidth,
      height: QSize.screenHeight,
      padding: EdgeInsets.all(10),
      child: SingleChildScrollView(
        child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  width: model.width,
                  height: model.width,
                  alignment: Alignment.bottomCenter,
                  decoration: BoxDecoration(
                    image: (model.emp.profile_image != null)? DecorationImage(image: MemoryImage(model.emp.profile_image!),fit: BoxFit.cover):  DecorationImage(image:AssetImage("assets/images/user.jpg")),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(model.emp.name!,style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold,color: Colors.grey),),
                Text(model.emp.username!,style: TextStyle(fontSize: 10, fontWeight: FontWeight.normal,color: Colors.grey),),
                Divider(thickness: 0.8,color: Colors.red,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(model.emp.address!.street ?? "",style: TextStyle(fontSize: 15, fontWeight: FontWeight.normal,color: Colors.grey),),
                          Text(model.emp.address!.suite ?? "",style: TextStyle(fontSize: 15, fontWeight: FontWeight.normal,color: Colors.grey),),
                          Text(model.emp.address!.city ?? "",style: TextStyle(fontSize: 15, fontWeight: FontWeight.normal,color: Colors.grey),),
                          Text(model.emp.address!.zipcode ?? "",style: TextStyle(fontSize: 15, fontWeight: FontWeight.normal,color: Colors.grey),),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(model.emp.email ?? "",style: TextStyle(fontSize: 10, fontWeight: FontWeight.normal,color: Colors.redAccent),),
                          Text(model.emp.phone ?? "",style: TextStyle(fontSize: 10, fontWeight: FontWeight.normal,color: Colors.redAccent),),
                        ],
                      ),
                    )
                  ],
                ),
                Divider(thickness: 0.8,color: Colors.red,),
                Container(
                  color: Colors.blueGrey,
                  width: double.infinity,
                  padding: EdgeInsets.all(10),
                  child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(model.emp.company!.name ?? "",style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700,color: Colors.white),),
                            Text(model.emp.company!.catchPhrase ?? "",style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700,color: Colors.white),),
                            Text(model.emp.company!.bs ?? "",style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700,color: Colors.white),),
                          ],
                        ),
                )
              ],
            ),
      ),
    ))));
  }
}
