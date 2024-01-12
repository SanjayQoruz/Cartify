import 'package:app/styles/styles.dart';
import 'package:flutter/material.dart';
import './../services/services.dart';

class BottomBar extends StatefulWidget{
  const BottomBar({super.key});
  static const routeName = "/actual-home";
    @override
    State<BottomBar>createState()=>_BottomBarState();
}

class _BottomBarState extends State<BottomBar>{
     int _page = 0;
     double bottomBarWidth = 42;
     double bottomBorderBarWidth = 4;
     @override
     Widget build(BuildContext context) {
       return Scaffold(
         body:Center(
          child:ElevatedButton(
               child: Text("clickme"),
               onPressed:()=>{
                    CartServices().getProduct()
               },
          )
         ),
          bottomNavigationBar:BottomNavigationBar(
                onTap: (value) => setState(() {
                  _page = value;
                }),
                unselectedItemColor:AppColor.unselectedNavBarColor,
                selectedItemColor: AppColor.selectedNavBarColor,
                iconSize:28,
                currentIndex:_page,
                backgroundColor: AppColor.backgroundColor,
                items: [
                  BottomNavigationBarItem(
                    icon:Container(
                          width:bottomBarWidth,
                          decoration: BoxDecoration(
                              border:Border(
                                  top:BorderSide(
                                      color:_page==0?
                                      AppColor.selectedNavBarColor:
                                      AppColor.backgroundColor,
                                    width: bottomBorderBarWidth
                                  )
                              )
                          ),
                          child:const Icon(
                            Icons.home_outlined
                          ),

                    ),
                    label: ''
                  ),
                  BottomNavigationBarItem(
                    icon:Container(
                          width:bottomBarWidth,
                          decoration: BoxDecoration(
                              border:Border(
                                  top:BorderSide(
                                      color:_page==1?
                                      AppColor.selectedNavBarColor:
                                      AppColor.backgroundColor,
                                    width: bottomBorderBarWidth
                                  )
                              )
                          ),
                          child:const Icon(
                            Icons.person_outline_outlined
                          ),
                    ),
                    label: ''
                  ),
                   BottomNavigationBarItem(
                    icon:Container(
                        margin:const EdgeInsets.only(right:60),
                         child:Stack(
                            children: [
                               const Positioned(
                                  child:
                                  Icon(
                                    Icons.shopping_bag_outlined,
                                  )
                                 ),
                                 Positioned(
                                   left:24,
                                   child:Container(
                                      decoration:BoxDecoration(
                                          color:AppColor.selectedNavBarColor
                                      ),
                                      child:Text("1")
                                    )
                                 )
                            ],
                         ),
                    ),
                    label: ''
                  )
                ],
          ),
       );
     }
}