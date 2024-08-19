import 'dart:ui';
import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:crypto_font_icons/crypto_font_icons.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:simple_circular_progress_bar/simple_circular_progress_bar.dart';

import 'awss.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Map<String, Map<String, dynamic>> _tickerData = {};

  late AmpiyWebSocketService webSocketService;
  bool _isLoading = true;


  ValueNotifier<double> val1 = ValueNotifier(240);
  ValueNotifier<double> val2 = ValueNotifier(340);
  ValueNotifier<double> val3 = ValueNotifier(165);
  ValueNotifier<double> val4 = ValueNotifier(90);
  ValueNotifier<bool> isDarkMode = ValueNotifier(true);

  List<Icon> allcrypicons = [
    Icon(CryptoFontIcons.AMP,),
    Icon(CryptoFontIcons.BTC,),
    Icon(CryptoFontIcons.ETH,),
    Icon(CryptoFontIcons.NEOS,),
    Icon(CryptoFontIcons.LTC,),
    Icon(CryptoFontIcons.QRK,),
    Icon(CryptoFontIcons.ADC,),
    Icon(CryptoFontIcons.XRP,),
    Icon(CryptoFontIcons.ERC,),
    Icon(CryptoFontIcons.IOC,),
    Icon(CryptoFontIcons.XMR,)

  ];

  @override
  void initState() {
    super.initState();
    webSocketService = AmpiyWebSocketService((data) {
      setState(() {
        _tickerData = data;

        Future.delayed(Duration(seconds: 2)).then((onValue){
          _isLoading = false;
        });
      });
    });
  }

  @override
  void dispose() {
    webSocketService.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screen_width = MediaQuery.of(context).size.width;
    final screen_height = MediaQuery.of(context).size.height;

    return ValueListenableBuilder<bool>(
        valueListenable: isDarkMode,
        builder: (context, isDark, _) {
      final theme = isDark ? ThemeData.dark() : ThemeData.light();
      return Theme(
        data: theme,
        child: Scaffold(
          body: SingleChildScrollView(
            child: Column(
              children: [
                SafeArea(child: Container()),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 15.0),
                          child: CircleAvatar(
                            radius: 25, // Adjust the radius as needed
                            backgroundImage: NetworkImage(
                              'https://www.profilebakery.com/wp-content/uploads/2023/04/LINKEDIN-Profile-Picture-AI.jpg', // Replace with your image URL
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Jake Mallon",
                                style: TextStyle(
                                    fontSize: 17
                                ),),
                              Text("JakeMallon64@gmail.com",
                                style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w300
                                ),)
                            ],
                          ),
                        ),
                    ],
                    ),
        
                    
                    Padding(
                      padding: const EdgeInsets.only(right: 15.0),
                      child: CircleAvatar(
                        radius: 18,
                        backgroundColor: Colors.grey.shade700,
                          child: Icon(
                            CupertinoIcons.bell,
                            color: Colors.white,
                            size: 20,
                          )),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Container(
                    height: screen_height * .2 ,
                    width: screen_width * .9,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Colors.blueGrey.shade700,
                            Colors.blueGrey.shade900,
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                      borderRadius: BorderRadius.circular(15)
                    ),
                    child: Stack(
                      children: [
                        Positioned(
                          top: 20,
                            left: 20,
                            child: Text("Portfolio Value",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w300
                            ),)
                        ),
                        Positioned(
                          left: 20,
                            top: 100,
                            child: Text("Rs 36,873 /-",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight:  FontWeight.w300
                              ),
                            )
                        ),
                        Positioned(
                          right: -90,
                          bottom: -170,
                          child: Container(
                            height: 300,
                            width: 300,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(150),
                                color: Colors.white.withOpacity(.05),
                                border: Border.all(
                                    color: Colors.white12
                                )
                            ),
                          ),
                        ),
                        Positioned(
                          right: -90,
                          bottom: -170,
                          child: Container(
                            height: 250,
                            width: 250,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(150),
                              color: Colors.white.withOpacity(.15),
                              border: Border.all(
                                color: Colors.white12
                              )
                            ),
                          ),
                        ),
                        Positioned(
                          right: -90,
                          bottom: -160,
                          child: Container(
                            height: 200,
                            width: 200,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                color: Colors.white12,
                                border: Border.all(
                                    color: Colors.white12
        
                                )
                            ),
                          ),
                        ),
        
                        Positioned(
                          top: 30,
                          right: 30,
                          child: ValueListenableBuilder<double>(
                          valueListenable: val2,
                          builder: (BuildContext context, double counterValue, Widget? child) {
                            // Update track variable here
                            WidgetsBinding.instance.addPostFrameCallback((_) {
                              setState(() {
                                //track = counterValue.toInt();
                                //updateWaterRecord(counterValue);
                              });
                            });
        
                            return SimpleCircularProgressBar(
                              valueNotifier: val2,
                              mergeMode: true,
                              size: 100,
                              animationDuration: 1,
                              maxValue: 500,
          
                              progressColors: [
                                Colors.white,
                                Colors.white,
        
                              ],
                              backColor: Colors.transparent,
                              progressStrokeWidth: 13,
        
                              // onGetText: (double value) {
                              //   return Text(
                              //     '${value.toInt() / 1000} L',
                              //     style: const TextStyle(
                              //       fontSize: 30,
                              //       fontWeight: FontWeight.w900,
                              //       color: Colors.white,
                              //     ),
                              //   );
                              // },
                            );
                          },
                        ),),
                        Positioned(
                          top: 30,
                          right: 30,
                          child: ValueListenableBuilder<double>(
                            valueListenable: val1,
                            builder: (BuildContext context, double counterValue, Widget? child) {
                              // Update track variable here
                              WidgetsBinding.instance.addPostFrameCallback((_) {
                                setState(() {
                                  //track = counterValue.toInt();
                                  //updateWaterRecord(counterValue);
                                });
                              });
        
                              return SimpleCircularProgressBar(
                                valueNotifier: val1,
                                mergeMode: true,
                                size: 100,
                                animationDuration: 1,
                                maxValue: 500,
                                progressColors: [
                                  Colors.deepOrange,
                                  Colors.orange,
        
                                ],
                                backColor: Colors.transparent,
                                progressStrokeWidth: 13,
        
                                // onGetText: (double value) {
                                //   return Text(
                                //     '${value.toInt() / 1000} L',
                                //     style: const TextStyle(
                                //       fontSize: 30,
                                //       fontWeight: FontWeight.w900,
                                //       color: Colors.white,
                                //     ),
                                //   );
                                // },
                              );
                            },
                          ),),
                        Positioned(
                          top: 30,
                          right: 30,
                          child: ValueListenableBuilder<double>(
                            valueListenable: val3,
                            builder: (BuildContext context, double counterValue, Widget? child) {
                              // Update track variable here
                              WidgetsBinding.instance.addPostFrameCallback((_) {
                                setState(() {
                                  //track = counterValue.toInt();
                                  //updateWaterRecord(counterValue);
                                });
                              });
        
                              return SimpleCircularProgressBar(
                                valueNotifier: val3,
                                mergeMode: true,
                                size: 100,
                                animationDuration: 1,
                                maxValue: 500,
                                progressColors: [
                                  Colors.lightBlueAccent,
                                  Colors.blue,
        
        
                                ],
                                backColor: Colors.transparent,
                                progressStrokeWidth: 13,
        
                                // onGetText: (double value) {
                                //   return Text(
                                //     '${value.toInt() / 1000} L',
                                //     style: const TextStyle(
                                //       fontSize: 30,
                                //       fontWeight: FontWeight.w900,
                                //       color: Colors.white,
                                //     ),
                                //   );
                                // },
                              );
                            },
                          ),),
                        Positioned(
                          top: 30,
                          right: 30,
                          child: ValueListenableBuilder<double>(
                            valueListenable: val4,
                            builder: (BuildContext context, double counterValue, Widget? child) {
                              // Update track variable here
                              WidgetsBinding.instance.addPostFrameCallback((_) {
                                setState(() {
                                  //track = counterValue.toInt();
                                  //updateWaterRecord(counterValue);
                                });
                              });
        
                              return SimpleCircularProgressBar(
                                valueNotifier: val4,
                                mergeMode: true,
                                size: 100,
                                animationDuration: 1,
                                maxValue: 500,
                                progressColors: [
                                  Colors.indigoAccent,
                                  Colors.indigoAccent,
        
                                ],
                                backColor: Colors.transparent,
                                progressStrokeWidth: 13,
        
                                // onGetText: (double value) {
                                //   return Text(
                                //     '${value.toInt() / 1000} L',
                                //     style: const TextStyle(
                                //       fontSize: 30,
                                //       fontWeight: FontWeight.w900,
                                //       color: Colors.white,
                                //     ),
                                //   );
                                // },
                              );
                            },
                          ),),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 15.0),
                      child: Text("My Portfolio",
                      style: TextStyle(
                        fontSize: 18
                      ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 15.0),
                      child: Text("View All"),
                    )
                  ],
                  ),
                ),
                SizedBox(
                  height: screen_height/5,
                  width: screen_width,
                  child: ListView.builder(
                    itemCount: 4, // Number of items in the list
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      List<Color> colors = [
                        Colors.indigoAccent,
                        Colors.blue,
                        Colors.deepOrange,
                        Colors.grey,
                      ];
                      List<Icon> crypicons = [
                        Icon(CryptoFontIcons.BTC,),
                        Icon(CryptoFontIcons.ETH,),
                        Icon(CryptoFontIcons.DOGE,),
                        Icon(CryptoFontIcons.AEON,),
                      ];
                      List<Text> crypText = [
                        Text("Bitcoin",style: TextStyle(fontWeight: FontWeight.w600)),
                        Text("Ethereum",style: TextStyle(fontWeight: FontWeight.w600)),
                        Text("Doge Coin",style: TextStyle(fontWeight: FontWeight.w600)),
                        Text("Aeon",style: TextStyle(fontWeight: FontWeight.w600)),
                      ];
                      List<Text> crypShort = [
                        Text("BTC",style: TextStyle(fontSize: 12,fontWeight: FontWeight.w300,),),
                        Text("ETH",style: TextStyle(fontSize: 12,fontWeight: FontWeight.w300,),),
                        Text("DOGE",style: TextStyle(fontSize: 12,fontWeight: FontWeight.w300,),),
                        Text("AEON",style: TextStyle(fontSize: 12,fontWeight: FontWeight.w300,),),
                      ];
        
                      Color color = colors[index];
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Stack(
                          children: [

                            Positioned(
                              top:0,
                              bottom: 0,
                              left: 0,
                              right: 0,
        
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    height: 60,
                                    width: 100,
                                    color: color,
                                  ),
                                  Container(
                                    height: 60,
                                    width: 100,
                                    color: color,
                                  ),
                                ],
                              ),
                            ),
                            BlurryContainer(
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 15.0,top: 5),
                                    child: Row(
                                      children: [
                                        crypicons[index],
                                        Padding(
                                          padding: const EdgeInsets.only(left: 10.0,top: 5),
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              crypText[index],
                                              crypShort[index],
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
        
                                  Align(
                                    alignment: Alignment.topRight,
                                    child: Container(
                                      height: 70,
                                      width: 180,
                                      child: LineChart(
                                        LineChartData(
                                          gridData: FlGridData(show: false),
                                          titlesData: FlTitlesData(show: false),
                                          borderData: FlBorderData(
                                            show: true,
                                            border: Border.all(color: Colors.transparent),
                                          ),
                                          minX: 0,
                                          maxX: 6,
                                          minY: 0,
                                          maxY: 6,
                                          lineBarsData: [
                                            LineChartBarData(
                                              spots: [
                                                FlSpot(0, 1),
                                                FlSpot(1, 2),
                                                FlSpot(2, 1.4),
                                                FlSpot(3, 3.4),
                                                FlSpot(4, 2),
                                                FlSpot(5, 6.2),
                                                FlSpot(6, 3.2),
                                                FlSpot(7, 6.9),
                                              ],
                                              isCurved: true,
                                              color: Colors.blue,
                                              barWidth: 2,
                                              isStrokeCapRound: true,
                                              dotData: FlDotData(show: false),
                                              belowBarData: BarAreaData(
                                                show: false,
                                                color: Colors.lightBlue.withOpacity(0.1),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              blur: 50,
                              width: 200,
                              height: 200,
                              elevation: 0,
                              color: Colors.transparent,
                              padding: const EdgeInsets.all(8),
                              borderRadius: const BorderRadius.all(Radius.circular(20)),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                SwitchListTile(
                  title: Text(
                    "Dark Mode",
                    style: TextStyle(
                      color: isDark ? Colors.white : Colors.black,
                    ),
                  ),
                  value: isDark,
                  onChanged: (value) {
                    isDarkMode.value = value;
                  },
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 15.0),
                        child: Text("Market Statistics",
                          style: TextStyle(
                              fontSize: 18
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 15.0),
                        child: Row(
                          children: [
                            Text("All "),
                            Icon(Icons.arrow_forward_ios_outlined)
                          ],
                        ),
                      )
                    ],
                  ),
                ),

                Container(
                  height: screen_height,
                  width: screen_width,
                  child: _isLoading
                      ? Align(
                    alignment: Alignment.topCenter,
                        child: Container(
                        height: 60,
                        width: 60,
                        child: LoadingAnimationWidget.beat(
                          color: Colors.blue,
                          size: 30,
                        )),
                      )// Show loading indicator
                      : ListView.builder(
                    padding: EdgeInsets.zero,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: _tickerData.length,
                    itemBuilder: (context, index) {
                      final key = _tickerData.keys.elementAt(index);
                      final coinData = _tickerData[key]!;



                      return ListTile(
                        title: Text(coinData['s'],style: TextStyle(fontSize: 14),),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Current Price: ${coinData['c']}',style: TextStyle(fontSize: 13,fontWeight: FontWeight.w300)),

                          ],
                        ),
                        leading: index < 11 ? allcrypicons[index] : Icon(Icons.account_balance_wallet_rounded),
                        trailing: Container(
                          width: 90,
                          height: 30,
                          decoration: BoxDecoration(
                             color: Colors.white,
                            border: Border.all(
                              color: Colors.grey
                            )
                          ),
                          child: Center(
                            child: Text(
                              double.parse(coinData['p']) < 0 ? coinData['p'] + "%": "+ " + coinData['p'] + "%",
                              style: TextStyle(
                                color: double.parse(coinData['p']) < 0 ? Colors.red : Colors.green,
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            )
          )
        ),
      );
        }
    );
  }
}



