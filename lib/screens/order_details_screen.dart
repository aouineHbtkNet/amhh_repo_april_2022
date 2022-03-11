import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider/src/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:simo_v_7_0_1/apis/get_order_details.dart';
import 'package:simo_v_7_0_1/apis/user_get_orders.dart';
import 'package:simo_v_7_0_1/modals/order_detail_model.dart';
import 'package:simo_v_7_0_1/providers/provider_two.dart';
import 'package:simo_v_7_0_1/providers/shared_preferences_provider.dart';
import 'package:simo_v_7_0_1/providers/shopping_cart_provider.dart';
import 'package:simo_v_7_0_1/screens/pagar_ahora_enLinea.dart';
import 'package:simo_v_7_0_1/screens/user-cataloge.dart';
import 'package:simo_v_7_0_1/screens/user_orders_screen.dart';
import 'package:simo_v_7_0_1/widgets_utilities/image_widget.dart';
import 'package:simo_v_7_0_1/widgets_utilities/multi_used_widgets.dart';
import 'package:simo_v_7_0_1/widgets_utilities/pop_up_menu_widget.dart';
import 'package:simo_v_7_0_1/widgets_utilities/spalsh_screen_widget.dart';
import 'package:simo_v_7_0_1/widgets_utilities/statefulWidget_textFormField.dart';

import 'cart_screen.dart';


class UserOrdersDetailsScreen extends StatefulWidget {
  static const String id = '/userorderDetailsScreen';
  var selectedOrder;
  UserOrdersDetailsScreen({required this.selectedOrder});
  @override
  State<UserOrdersDetailsScreen> createState() => _UserOrdersDetailsScreenState();}
  class _UserOrdersDetailsScreenState extends State<UserOrdersDetailsScreen> {


  List  list=[];
  @override
  void initState() {

    int myid =widget.selectedOrder['id'];

    GetOrdersDetails().getOrderDetails(myid).then((value){

      // print ('selectedOrderid ================${widget.selectedOrder['id']}');
      //
              list=value;




    });
    super.initState();
  }
  @override
  Widget build(BuildContext context)  {
    return   Scaffold(

          body: SafeArea(


            child: ListView.builder(
                itemCount:list.length,
                itemBuilder: (BuildContext context,int index){
                  return Card(child:Column(
                    children: [


                  // =[{order_id: 5, product_id: 1, user_id: 1, qty: 5,
                  // product_total_price: 49380.000, product_total_base: 4935.000,
                  // product_total_taxes: 494380.000, product_total_discount: 49380.000, get_products: null},
                  //     {order_id: 5, product_id: 2, user_id: 1, qty: 9, product_total_price: 88884.000,
                  //       product_total_base: 8883.000,
                  //   product_total_taxes: 889884.000, product_total_discount: 88884.000, get_products: null}]



                      Text(' product id ${list[index]['product_id']}'),
                      Text(' quantity ${list[index]['qty']}'),
                      Text(' product_total_price  ${list[index]['product_total_price']}'),
                      Text(' product_total_base ${list[index]['product_total_base']}'),
                      Text(' product_total_discount${list[index]['product_total_discount']}'),
                      Text(' product_total_taxes${list[index]['product_total_taxes'
                          '']}'),





                    ],));



                }),




      //        child: Column(children: [
      //
      //                PopUpMenuWidget(putArrow: true, callbackArrow: (){Navigator.of(context).pushNamedAndRemoveUntil(UserOrdersScreen.id,
      //             (Route<dynamic> route) => false);}, voidCallbackCart: (){Navigator.of(context).pushNamedAndRemoveUntil(UserCart.id,
      //             (Route<dynamic> route) => false);},),
      //
      //       Padding(
      //      padding: const EdgeInsets.all(6.0),
      //        child: UsedWidgets().orderDetailsScreenHeading(
      //
      //     sizeTitle:18 ,
      //     sizeData: 30,
      //     fontfamilyTitle:'Opendark',
      //     fontFamilyData:'Dancing' ,
      //     dateData:'${widget.selectedOrder['created_at']}',
      //     orderIdData: '${widget.selectedOrder['id']}',
      //     serialNumberdata:'${widget.selectedOrder['trucking_number']}',
      //     totalPriceData:'${widget.selectedOrder['grand_total']}',
      //     totalPriceBaseData: '${widget.selectedOrder['grand_total_base']}',
      //     totalPriceTaxesData:'${widget.selectedOrder['grand_total_taxes']}',
      //     totalPriceDescountData: '${widget.selectedOrder['grand_total_discount']}',
      //     // totalDelosProductos:  '${selectedProduct['id']}'
      //   ),
      // ),













         //  ],
       //   ),
    )





     );
  }
}
















// SafeArea(
//
//   child: Column(
//
//     children: [
//
//       PopUpMenuWidget(putArrow: true,
//         callbackArrow: (){
//           Navigator.of(context).pushNamedAndRemoveUntil(UserOrdersScreen.id,
//                   (Route<dynamic> route) => false);},
//         voidCallbackCart: (){
//           Navigator.of(context).pushNamedAndRemoveUntil(UserCart.id,
//                   (Route<dynamic> route) => false);
//         },),
//
//       Padding(
//         padding: const EdgeInsets.all(6.0),
//         child: UsedWidgets().orderDetailsScreenHeading(
//
//           sizeTitle:18 ,
//           sizeData: 30,
//           fontfamilyTitle:'Opendark',
//           fontFamilyData:'Dancing' ,
//           dateData:'${selectedProduct['created_at']}',
//           orderIdData: '${selectedProduct['id']}',
//           serialNumberdata:'${selectedProduct['trucking_number']}',
//           totalPriceData:'${selectedProduct['grand_total']}',
//           totalPriceBaseData: '${selectedProduct['grand_total_base']}',
//           totalPriceTaxesData:'${selectedProduct['grand_total_taxes']}',
//           totalPriceDescountData: '${selectedProduct['grand_total_discount']}',
//           // totalDelosProductos:  '${selectedProduct['id']}'
//         ),
//       ),
//
//
//       Container(
//         decoration: BoxDecoration(
//
//             border: Border.all(color: Colors.blueGrey,width: 2),
//             borderRadius: BorderRadius.circular(4.0)
//         ),
//
//         child: Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Text('La lista de los productos :',style: TextStyle(fontSize: 20),),
//         ),
//       ),
//
//
//
//       Expanded(
//
//         child: Container(
//          // color: Colors.amberAccent,
//           child: FutureBuilder(
//             future:GetOrdersDetails().getOrderDetails(order_id ) ,
//             builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
//
//               return  snapshot.hasData?ListView.builder(
//                 itemCount: snapshot.data.length,
//                 itemBuilder: (BuildContext context, int index) {
//                 return Padding(
//                   padding: const EdgeInsets.all(20.0),
//                   child: Card(
//                 // color: Colors.greenAccent,
//                     child: Column(children: [

//                      Padding(
//                        padding: const EdgeInsets.all(8.0),
//                        child: Row(
//                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                          children: [
//                          Text('Numero : ',style: TextStyle(fontSize: 18 ,fontFamily: 'Arkaya',color: Colors.blueGrey),),
//                          Text('${ index+1}',style: TextStyle(fontSize: 24,fontFamily: 'OpenLight'),),
//
//                        ],),
//                      ),
//
//                       Padding(
//                         padding: const EdgeInsets.all(8.0),
//                         child: Divider(color: Colors.blue,thickness: 2,),
//                       ),
//
//
//
//                       ImagewidgetNoButton(
//                       networkImageUrl:snapshot.data[index].getProducts.fotoProducto,
//                     ),
//
//                       UsedWidgets().simpleTitleDataWidget(
//                           title: 'Nombre : ',
//                           data:' ${snapshot.data[index].getProducts.nombreProducto}'),
//
//                       UsedWidgets().simpleTitleDataWidget(
//                           title: 'Contenido : ',
//                           data:' ${snapshot.data[index].getProducts.contenido}'),
//
//
//
//
//                       UsedWidgets().simpleTitleDataWidget(
//                           title: 'Precio unitario : ',
//                           data:' ${snapshot.data[index].getProducts.precioAhora}'),
//
//                       UsedWidgets().simpleTitleDataWidget(
//                           title: 'Precio Base unitario : ',
//                           data:' ${snapshot.data[index].getProducts.precioSinImpuesto}'),
//                       UsedWidgets().simpleTitleDataWidget(
//                           title: 'Precio antes unitario  : ',
//                           data:' ${snapshot.data[index].getProducts.precioAnterior}'),
//                       UsedWidgets().simpleTitleDataWidget(
//                           title: 'Porciento de desuento unitario : ',
//                           data:' ${snapshot.data[index].getProducts.porcientoDeDescuento}'),
//                       UsedWidgets().simpleTitleDataWidget(
//                           title: ' Valor de descuento  unitario : ',
//                           data:' ${snapshot.data[index].getProducts.valorDescuento}'),
//
//                       UsedWidgets().simpleTitleDataWidget(
//                           title: ' cantidad : ',
//                           data:' ${snapshot.data[index].qty}'),
//
//
//
//
//                       UsedWidgets().simpleTitleDataWidget(
//                           title: 'valor total  del precio  : ',
//                           data:' ${snapshot.data[index].productTotalPrice}'),
//
//                       UsedWidgets().simpleTitleDataWidget(
//                           title: 'valor total  del precio base: ',
//                           data:' ${snapshot.data[index].productTotalBase}'),
//                       UsedWidgets().simpleTitleDataWidget(
//                           title: 'Valor total de los impuestos: ',
//                           data:' ${snapshot.data[index].productTotalTaxes}'),
//                       UsedWidgets().simpleTitleDataWidget(
//                           title: 'Valor total de los discuentos: ',
//                           data:' ${snapshot.data[index].productTotalDiscount}'),
//
//
//
//
//
//
//
//
//
//
//
//
//
//                       UsedWidgets().simpleTitleDataWidget(
//                           title: 'Descripcion : ',
//                           data:' ${snapshot.data[index].getProducts.descripcion}'),
//
//
//
//
//
//
//
//
//
//
//
//                   ],) ,),
//                 );
//
//
//
//
//
//               },);
//
//
//             },
//           ),
//         ),
//       ),
//     ],
//   ),
// )
