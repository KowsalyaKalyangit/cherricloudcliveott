import 'package:cliveott/utils/colors.dart';
import 'package:cliveott/utils/textstyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({super.key});

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  var bankname = ['SBI', 'HDFC', 'ICICI', 'AXIS', 'IDBI'];
  var bankimages = [
    'assets/images/sbi.png',
    'assets/images/hdfc.png',
    'assets/images/icici.png',
    'assets/images/axis.png',
    'assets/images/idbi.png'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: screenbackground,
      appBar: AppBar(
        elevation: 1,
        automaticallyImplyLeading: false,
        backgroundColor: bgcolor1,
        title: Text(
          'Pay Securely',
          style: heading,
        ),
        leading: InkWell(
          onTap: () {
            Get.back();
          },
          child: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 50.h,
            width: 1000.0.w,
            color: bgcolor,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset('assets/images/clive1.png'),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '\u{20B9}899/year',
                      style: heading,
                    ),
                    Text(
                      'Valid Until 22 Apr, 2024',
                      style: forminputstyle,
                    )
                  ],
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: Text(
              'CREDIT CARDS',
              style: heading,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: Container(
              height: 40.0.h,
              width: 1000.w,
              decoration: BoxDecoration(border: Border.all(color: Colors.blue)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: 150.0.w,
                    child: TextFormField(
                      decoration: InputDecoration(
                          hintStyle: headingblue,
                          hintText: 'ENTER CARD NUMBER'),
                    ),
                  ),
                  Container(
                      width: 150.0.w,
                      child: Image.asset('assets/images/pay1.png'))
                ],
              ),
            ),
          ),
          Divider(),
          Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: Text(
              'DEBIT CARDS',
              style: heading,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: Container(
              height: 40.0.h,
              width: 1000.w,
              decoration: BoxDecoration(border: Border.all(color: Colors.blue)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: 150.0.w,
                    child: TextFormField(
                      decoration: InputDecoration(
                          hintStyle: headingblue,
                          hintText: 'ENTER CARD NUMBER'),
                    ),
                  ),
                  Container(
                      width: 150.0.w,
                      child: Image.asset('assets/images/pay1.png'))
                ],
              ),
            ),
          ),
          SizedBox(
            height: 10.0.h,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: Container(
              height: 40.0.h,
              width: 1000.0.w,
              // decoration: BoxDecoration(border: Border.all(color: Colors.blue)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 180.0.w,
                    child: Text(
                      'NET BANKING',
                      style: heading,
                    ),
                  ),
                  Container(
                    width: 150.0.w,
                    child: ListTile(
                      title: Text(
                        'MORE BANKS',
                        style: headingblue,
                      ),
                      trailing: Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.blue,
                        size: 16,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 10.0.h,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: Container(
              height: 40.0.h,
              width: 1000.w,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: bankname.length,
                  itemBuilder: (context, index) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset(
                          bankimages[index],
                          height: 20.0.h,
                          width: 40.0.w,
                          fit: BoxFit.cover,
                        ),
                        Container(
                          width: 70.0.w,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Text(
                              bankname[index],
                              style: subheading,
                            ),
                          ),
                        )
                      ],
                    );
                  }),
            ),
          ),
          SizedBox(
            height: 10.0.h,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: Text(
              'WALLETS',
              style: heading,
            ),
          ),
          ListTile(
            title: Text(
              'Paytm',
              style: heading,
            ),
            leading: Image.asset(
              'assets/images/paytm.png',
              height: 70,
            ),
            trailing: Text(
              'Pay now',
              style: headingblue,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: Text(
              'UPI',
              style: heading,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: Container(
              height: 40.0.h,
              width: 1000.0.w,
              decoration: BoxDecoration(border: Border.all(color: Colors.blue)),
              child: Row(
                children: [
                  Container(
                      width: 50.0.w,
                      child: Icon(
                        Icons.add,
                        color: Colors.blue,
                      )),
                  Container(
                      width: 150.0.w,
                      child: TextFormField(
                        decoration: InputDecoration(
                            hintText: 'ENTER UPI ID', hintStyle: headingblue),
                        style: headingblue,
                      )),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: Text(
              '''You will be charged 899 once a year until you cancel By Proceeding, I confirm that I am over 18, and I agree to the Terms of use and Privacy Policy
            ''',
              style: forminputstyle,
            ),
          )
        ],
      ),
    );
  }
}
