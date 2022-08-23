import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:empdet/helper/config.dart';
import 'package:empdet/helper/utils/screen_layout.dart';
import 'package:empdet/viewModel/Dashboard/dashboard_viewmodel.dart';
import 'package:empdet/views/base_model_widget.dart';

// ignore: must_be_immutable
class DashboardMobile extends BaseModelWidget<DashboardScreenViewModel> {
  DashboardScreenViewModel model = DashboardScreenViewModel();
  late BuildContext context;

  DashboardMobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, DashboardScreenViewModel model) {
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
          
          title: SizedBox(
              width: QSize.screenWidth * 0.2,
              child: Image.asset(ImageFile.empdetLogo)),
          ),
        body:
          (model.employees.length == 0)?
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              Text("No Data Available"),
              IconButton(
              onPressed: model.initilizeData,
              icon: Icon(Icons.refresh,size: 30,),
            )
            ],)
          ):
          GridView.builder(
          itemCount: model.employees.length,
          itemBuilder: (context,index){
            return InkWell(
              onTap: (){
                model.gotoDetails(index);
              },
              child: Container(
                alignment: Alignment.bottomCenter,
                decoration: BoxDecoration(
                  image: (model.employees[index].profile_image != null)? DecorationImage(image: MemoryImage(model.employees[index].profile_image!),fit: BoxFit.cover):  DecorationImage(image:AssetImage("assets/images/user.jpg")),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      width: double.infinity,
                      alignment: Alignment.center,
                      color: Color(0xff454846),
                      child: Text(model.employees[index].name!,style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold,color: Colors.white),)),
            
                    Container(
                      width: double.infinity,
                      alignment: Alignment.center,
                      color: Color.fromARGB(255, 27, 73, 95),
                      child: Text(model.employees[index].company!.name?? "",style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold,color: Colors.white),)),
                ]),
              ),
            );
        }, gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(  
                  crossAxisCount: 2,  
                  crossAxisSpacing: 1.0,  
                  mainAxisSpacing: 1.0  
              ),),
      ), 
    ));
  }
}
