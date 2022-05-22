import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';


class open extends StatefulWidget {

  Map orders={};
  open({Key? key,required this.orders}) : super(key: key);

  @override
  createState()=>_open(orders: orders);
}

class _open extends State<open> {

  Map orders={};
  _open({required this.orders});

  String getSum() {
    double sum = 0;
    for (var i in orders['order'].values) {
        sum += double.parse(i[2]);
      }
      return sum.toString();
    }

  String formattedDate(timeStamp){
    var dateFormTimeStamp=DateTime.fromMillisecondsSinceEpoch(timeStamp.seconds*1000);
    return DateFormat('dd-MM-yyy hh:mm a').format(dateFormTimeStamp);
  }

  @override
  Widget build(BuildContext context) {
    double deviceWidth=MediaQuery.of(context).size.width ;
    return Scaffold(
        appBar:AppBar(
        title: Text('Order Details',style: TextStyle(color: Colors.white,fontSize:25)),
        backgroundColor: Colors.black,
        foregroundColor:Colors.white,
    ),
    body:SingleChildScrollView(
      child:Column(
        children:[
          Container(
              padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
              alignment: Alignment.centerLeft,
            child:Row(
              children: [
                Text("Date/Time : ",style:TextStyle( color: Colors.black, fontSize: 20,fontWeight: FontWeight.bold)),
                Text(formattedDate(orders['date']),style:TextStyle( color: Colors.black, fontSize: 20,)),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
            child:Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                (orders['const']!=null)?
                Text('Delivery',style:TextStyle(color:Colors.black,fontSize: 20,fontWeight: FontWeight.bold)):
                Text('In-Hall',style:TextStyle(color:Colors.black,fontSize: 20,fontWeight: FontWeight.bold)),
              ],
            ),
          ),

          Container(
            padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
            alignment: Alignment.centerLeft,
            child:Text('Order Summary : ',style:TextStyle(color:Colors.black,fontSize: 20,fontWeight: FontWeight.bold)
            ),
          ),
          Card(
            child:Column(
              children: [
                Row(
                  children: [
                    Container(
                     padding: EdgeInsets.fromLTRB(8,0,0,0),
                     width: (deviceWidth/5)*2.5,
                     child:Text('Items',style: TextStyle(fontWeight: FontWeight.bold, color: Colors.teal, fontSize: 20,)),
                ),
                Container(
                  width: (deviceWidth/5),
                  child:
                  Text('Qty',style: TextStyle(fontWeight: FontWeight.bold, color: Colors.teal, fontSize: 20,)),
                ),
                Container(
                  width: (deviceWidth/5),
                  child:
                  Text('Price',style: TextStyle(fontWeight: FontWeight.bold, color: Colors.teal, fontSize: 20,)),
                ),
              ],
            ),
            Text('-------------------------------',style: TextStyle(fontWeight: FontWeight.bold, color: Colors.teal, fontSize: 20,)),
            for(var i in orders['order'].values)
              Row(
                children: [
                  Container(
                    padding: EdgeInsets.fromLTRB(8,0,0,10),
                    width: (deviceWidth/5)*2.5,
                    child:Text(i[0],style: TextStyle( color: Colors.black, fontSize: 20,)),
                  ),
                  Container(
                    width: (deviceWidth/5),
                    child:Text('x'+i[1],style: TextStyle( color: Colors.black, fontSize: 20,)),
                  ),
                  Container(
                    width:(deviceWidth/5),
                    child:Text(i[2],style: TextStyle( color: Colors.black, fontSize: 20,)),
                  ),
                ],
              ),
            Text('-------------------------------',style: TextStyle(fontWeight: FontWeight.bold, color: Colors.teal, fontSize: 20,)),
            Row(
              children:[
                Container(
                  padding: EdgeInsets.fromLTRB(8,0,0,0),
                  width: (deviceWidth/5)*2.5,
                  child: Text('Sub-Total',style: TextStyle( color: Colors.black, fontSize: 20,)),
                ),
                Container(
                  width: (deviceWidth/5),
                  child:Text('-',style: TextStyle( color: Colors.black, fontSize: 20,)),
                ),
                Container(
                  width: (deviceWidth/5),
                  child:Text(getSum(),style: TextStyle( color: Colors.black, fontSize: 20,)),
                ),
              ],
            ),
            Text('-------------------------------',style: TextStyle(fontWeight: FontWeight.bold, color: Colors.teal, fontSize: 20,)),
            Row(
              children:[
                Container(
                  padding: EdgeInsets.fromLTRB(8,0,0,0),
                  width: (deviceWidth/5)*2.5,
                  child:(orders['const']!=null)?Text('Delivery',style: TextStyle( color: Colors.black, fontSize: 20,)):
                  Text("Service",style: TextStyle( color: Colors.black, fontSize: 20,)),
                ),
                Container(
                  width: (deviceWidth/5),
                  child:Text('-',style: TextStyle( color: Colors.black, fontSize: 20,)),
                ),
                Container(
                  width: (deviceWidth/5),
                  child:(orders['const']!=null)?Text(orders['const'],style: TextStyle( color: Colors.black, fontSize: 20,)):
                  Text('${((double.parse(getSum())*14)/100)}',style: TextStyle( color: Colors.black, fontSize: 20,)),
                ),
              ],
            ),
            Text('-------------------------------',style: TextStyle(fontWeight: FontWeight.bold, color: Colors.teal, fontSize: 20,)),
            Row(
              children:[
                Container(
                  width: (deviceWidth/5)*2.5,
                  padding: EdgeInsets.fromLTRB(8,0,0,0),
                  child: Text('Total',style: TextStyle( color: Colors.black, fontSize: 20,)),
                ),
                Container(
                  width: (deviceWidth/5),
                  child:Text('-',style: TextStyle( color: Colors.black, fontSize: 20,)),
                ),
               Container(
                  width: (deviceWidth/5),
                  child: (orders['const']!=null)?Text((double.parse(getSum())+double.parse(orders['const'])).toString(),style: TextStyle( color: Colors.black, fontSize: 20,)):
                  Text((double.parse(getSum())+((double.parse(getSum())*14)/100)).toString(),style: TextStyle( color: Colors.black, fontSize: 20,)),
                ),
              ],
            ),
          ],
        ),
      ),
        ],
      ),
    ),
    );
  }
}