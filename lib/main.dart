import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Costing Calculator',
      theme: ThemeData.dark(),
      themeMode: ThemeMode.dark,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var weftPickController = List.generate(8, (i) => TextEditingController());
  var weftLengthController = List.generate(8, (i) => TextEditingController());
  var weftDeniarController = List.generate(8, (i) => TextEditingController());
  var weftShortageController =
      List.generate(8, (i) => TextEditingController(text: '7'));
  var weftYarnRateController = List.generate(8, (i) => TextEditingController());

  var worpTarController = TextEditingController();
  var worpLengthController = TextEditingController();
  var worpDeniarController = TextEditingController();
  var worpShortageController = TextEditingController(text: '7');
  var worpYarnRateController = TextEditingController();

  var jobEveragePicController = TextEditingController();
  var jobLengthController = TextEditingController();
  var jobRateController = TextEditingController();

  var totalWeftYarnWidth = List.filled(8, 00.0, growable: false);
  var fixnintinelakh = 9000000;
  var totalweftCosting = List.filled(8, 00.0, growable: false);

  var totalWorpYarnWidth = 00.0;
  var totalWorpCosting = 00.0;

  var totalJobCosting = 00.0;

  var finalCosting = 0.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Costing Calculator"),
      ),
      body: InkWell(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: SingleChildScrollView(
          child: Container(
              margin: EdgeInsets.all(10),
              child: Column(
                children: [
                  Weft(0),
                  Weft(1),
                  Worp(),
                  Job(),
                  Text("Final Consting : " + finalCosting.toString()),
                  SizedBox(
                    height: 15,
                  )
                ],
              )),
        ),
      ),
    );
  }

  weftCalculation(weftIndex) {
    var pick = double.parse(weftPickController[weftIndex].text != ''
        ? weftPickController[weftIndex].text
        : '0');
    var length = double.parse(weftLengthController[weftIndex].text != ''
        ? weftLengthController[weftIndex].text
        : '0');
    var deniar = double.parse(weftDeniarController[weftIndex].text != ''
        ? weftDeniarController[weftIndex].text
        : '0');
    var shortage = double.parse(weftShortageController[weftIndex].text != ''
        ? weftShortageController[weftIndex].text
        : '0');
    var yarn = double.parse(weftYarnRateController[weftIndex].text != ''
        ? weftYarnRateController[weftIndex].text
        : '0');

    var weftconsting = 0.0;
    var totalYarn = 0.0;
    if (pick != 0) {
      weftconsting = pick;
    }
    if (length != 0) {
      weftconsting = weftconsting * length;
    }
    if (deniar != 0) {
      weftconsting = weftconsting * deniar;
    }
    if (weftconsting != 0) {
      weftconsting = weftconsting / 9000000;
    }
    if (shortage != 0) {
      weftconsting = weftconsting + (weftconsting * shortage) / 100;
    }
    totalYarn = weftconsting;
    if (yarn != 0) {
      weftconsting = weftconsting * yarn;
    }
    setState(() {
      totalWeftYarnWidth[weftIndex] = totalYarn;
      totalweftCosting[weftIndex] = weftconsting;
      var totalWeft = 00.0;
      for (var i = 0; i <= 7; i++) {
        totalWeft = totalWeft + totalweftCosting[i];
      }
      finalCosting = totalWeft + totalWorpCosting + totalJobCosting;
    });
  }

  worpCalculation() {
    var tar = double.parse(
        worpTarController.text != '' ? worpTarController.text : '0');
    var length = double.parse(
        worpLengthController.text != '' ? worpLengthController.text : '0');
    var deniar = double.parse(
        worpDeniarController.text != '' ? worpDeniarController.text : '0');
    var shortage = double.parse(
        worpShortageController.text != '' ? worpShortageController.text : '0');
    var yarn = double.parse(
        worpYarnRateController.text != '' ? worpYarnRateController.text : '0');

    var worpconsting = 0.0;
    var totalYarn = 0.0;
    if (tar != 0) {
      worpconsting = tar;
    }
    if (length != 0) {
      worpconsting = worpconsting * length;
    }
    if (deniar != 0) {
      worpconsting = worpconsting * deniar;
    }
    if (worpconsting != 0) {
      worpconsting = worpconsting / 9000000;
    }
    if (shortage != 0) {
      worpconsting = worpconsting + (worpconsting * shortage) / 100;
    }
    totalYarn = worpconsting;
    if (yarn != 0) {
      worpconsting = worpconsting * yarn;
    }
    setState(() {
      totalWorpYarnWidth = totalYarn;
      totalWorpCosting = worpconsting;

      var totalWeft = 00.0;
      for (var i = 0; i <= 7; i++) {
        totalWeft = totalWeft + totalweftCosting[i];
      }
      finalCosting = totalWeft + totalWorpCosting + totalJobCosting;
    });
  }

  jobCalculation() {
    var everagePic = double.parse(jobEveragePicController.text != ''
        ? jobEveragePicController.text
        : '0');
    var length = double.parse(
        jobLengthController.text != '' ? jobLengthController.text : '0');
    var jobRate = double.parse(
        jobRateController.text != '' ? jobRateController.text : '0');

    var jobconsting = 0.0;
    if (everagePic != 0) {
      jobconsting = everagePic;
    }
    if (length != 0) {
      jobconsting = jobconsting * length;
    }
    if (jobRate != 0) {
      jobconsting = jobconsting * jobRate;
    }

    setState(() {
      totalJobCosting = jobconsting;

      var totalWeft = 00.0;
      for (var i = 0; i <= 7; i++) {
        totalWeft = totalWeft + totalweftCosting[i];
      }
      finalCosting = totalWeft + totalWorpCosting + totalJobCosting;
    });
  }

  Widget Weft(weftIndex) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            "Weft Calculation",
            style: TextStyle(fontSize: 20),
          ),
          SizedBox(
            height: 10,
          ),
          TextFormField(
            controller: weftPickController[weftIndex],
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
                isDense: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25.0),
                ),
                hintText: "Pick",
                labelText: "Pick"),
            onChanged: (value) {
              weftCalculation(weftIndex);
            },
          ),
          SizedBox(
            height: 10,
          ),
          TextFormField(
            controller: weftLengthController[weftIndex],
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
                isDense: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25.0),
                ),
                hintText: "Length",
                labelText: "Length"),
            onChanged: (value) {
              weftCalculation(weftIndex);
            },
          ),
          SizedBox(
            height: 10,
          ),
          TextFormField(
            controller: weftDeniarController[weftIndex],
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
                isDense: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25.0),
                ),
                hintText: "Deniar",
                labelText: "Deniar"),
            onChanged: (value) {
              weftCalculation(weftIndex);
            },
          ),
          SizedBox(
            height: 10,
          ),
          TextFormField(
            controller: weftShortageController[weftIndex],
            readOnly: true,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
                isDense: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25.0),
                ),
                hintText: "Shortage",
                labelText: "Shortage"),
            onChanged: (value) {
              weftCalculation(weftIndex);
            },
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Total Yarn Width :',
                style: TextStyle(fontSize: 15),
              ),
              Text(totalWeftYarnWidth[weftIndex].toString()),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          TextFormField(
            controller: weftYarnRateController[weftIndex],
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
                isDense: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25.0),
                ),
                hintText: "YarnRate",
                labelText: "YarnRate"),
            onChanged: (value) {
              weftCalculation(weftIndex);
            },
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Total Weft : ',
                style: TextStyle(fontSize: 15),
              ),
              Text(totalweftCosting[weftIndex].toString()),
            ],
          ),
          SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }

  Widget Worp() {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            "Worp Calculation",
            style: TextStyle(fontSize: 20),
          ),
          SizedBox(
            height: 10,
          ),
          TextFormField(
            controller: worpTarController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
                isDense: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25.0),
                ),
                hintText: "Tar",
                labelText: "Tar"),
            onChanged: (value) {
              worpCalculation();
            },
          ),
          SizedBox(
            height: 10,
          ),
          TextFormField(
            controller: worpLengthController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
                isDense: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25.0),
                ),
                hintText: "Length",
                labelText: "Length"),
            onChanged: (value) {
              worpCalculation();
            },
          ),
          SizedBox(
            height: 10,
          ),
          TextFormField(
            controller: worpDeniarController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
                isDense: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25.0),
                ),
                hintText: "Deniar",
                labelText: "Deniar"),
            onChanged: (value) {
              worpCalculation();
            },
          ),
          SizedBox(
            height: 10,
          ),
          TextFormField(
            controller: worpShortageController,
            keyboardType: TextInputType.number,
            readOnly: true,
            decoration: InputDecoration(
                isDense: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25.0),
                ),
                hintText: "Shortage",
                labelText: "Shortage"),
            onChanged: (value) {
              worpCalculation();
            },
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Total Yarn Width :',
                style: TextStyle(fontSize: 15),
              ),
              Text(totalWorpYarnWidth.toString()),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          TextFormField(
            controller: worpYarnRateController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
                isDense: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25.0),
                ),
                hintText: "YarnRate",
                labelText: "YarnRate"),
            onChanged: (value) {
              worpCalculation();
            },
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Total Worp : ',
                style: TextStyle(fontSize: 15),
              ),
              Text(totalWorpCosting.toString()),
            ],
          ),
          SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }

  Widget Job() {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            "Job Calculation",
            style: TextStyle(fontSize: 20),
          ),
          SizedBox(
            height: 10,
          ),
          TextFormField(
            controller: jobEveragePicController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
                isDense: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25.0),
                ),
                hintText: "Everage Pic",
                labelText: "Everage Pic"),
            onChanged: (value) {
              jobCalculation();
            },
          ),
          SizedBox(
            height: 10,
          ),
          TextFormField(
            controller: jobLengthController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
                isDense: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25.0),
                ),
                hintText: "Length",
                labelText: "Length"),
            onChanged: (value) {
              jobCalculation();
            },
          ),
          SizedBox(
            height: 10,
          ),
          TextFormField(
            controller: jobRateController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
                isDense: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25.0),
                ),
                hintText: "Job Rate",
                labelText: "Job Rate"),
            onChanged: (value) {
              jobCalculation();
            },
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Total Job : ',
                style: TextStyle(fontSize: 15),
              ),
              Text(totalJobCosting.toString()),
            ],
          ),
          SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
