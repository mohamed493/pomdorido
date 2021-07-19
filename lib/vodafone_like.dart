import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';

class Vodafone extends StatefulWidget {
  const Vodafone({Key? key}) : super(key: key);

  @override
  _VodafoneState createState() => _VodafoneState();
}

class _VodafoneState extends State<Vodafone> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter custom clipper example"),
      ),
      body: ListView(
        padding: EdgeInsets.all(20.0),
        children: <Widget>[
          ClipPath(
            clipper: WaveClipperOne(flip: true,reverse: true),
            child: Container(
              height: 120,
              color: Colors.orange,
              child: Center(child: Text("WaveClipperTwo(flip: true,reverse: true)")),
            ),
          ),
          SizedBox(height: 10.0),
          ClipPath(
            clipper: WaveClipperOne(flip: true),
            child: Container(
              height: 120,
              color: Colors.orange,
              child: Center(child: Text("WaveClipperTwo(flip: true)")),
            ),
          ),
          SizedBox(height: 10.0),
          ClipPath(
            clipper: WaveClipperTwo(flip: true,reverse: true),
            child: Container(
              height: 120,
              color: Colors.orange,
              child: Center(child: Text("WaveClipperTwo(flip: true,reverse:true)")),
            ),
          ),
          SizedBox(height: 10.0),
          ClipPath(
            clipper: WaveClipperTwo(flip: true),
            child: Container(
              height: 120,
              color: Colors.orange,
              child: Center(child: Text("WaveClipperTwo(flip: true)")),
            ),
          ),
          SizedBox(height: 10.0),
          ClipPath(
            clipper: OvalBottomBorderClipper(),
            child: Container(
              height: 100,
              color: Colors.blue,
              child: Center(child: Text("OvalBottomBorderClipper()")),
            ),
          ),
          const SizedBox(height: 10.0),
          ClipPath(
            clipper: OvalRightBorderClipper(),
            child: Container(
              height: 100,
              color: Colors.red,
              child: Center(child: Text("OvalRightBorderClipper()")),
            ),
          ),
          const SizedBox(height: 10.0),
          ClipPath(
            clipper: SideCutClipper(),
            child: Container(
              height: 200,
              color: Colors.pink,
              //play with scals to get more clear versions
              child: Center(child: Text("SideCutClipper()")),
            ),
          ),
          const SizedBox(height: 10.0),
          ClipPath(
            clipper: OvalLeftBorderClipper(),
            child: Container(
              height: 100,
              color: Colors.green,
              child: Center(child: Text("OvalLeftBorderClipper()")),
            ),
          ),
          const SizedBox(height: 10.0),
          ClipPath(
            clipper: ArcClipper(),
            child: Container(
              height: 600,
              width: 20,
              color: Colors.black,
              child: Center(child: Text("ArcClipper()")),
            ),
          ),//9
          ClipPath(
            clipper: PointsClipper(),
            child: Container(
              height: 100,
              color: Colors.indigo,
              child: Center(child: Text("PointsClipper()")),
            ),
          ),
          SizedBox(height: 10.0),
          ClipPath(
            clipper: TriangleClipper(),
            child: Container(
              height: 100,
              color: Colors.deepOrange,
              child: Center(child: Text("TriangleClipper()")),
            ),
          ),
          ClipPath(
            clipper: MovieTicketClipper(),
            child: Container(
              height: 100,
              color: Colors.deepPurple,
              child: Center(child: Text("MovieTicketClipper()")),
            ),
          ),
          SizedBox(height: 10.0),
          ClipPath(
            clipper: MovieTicketBothSidesClipper(),
            child: Container(
              height: 100,
              color: Colors.green,
              child: Center(child: Text("MovieTicketBothSidesClipper()")),
            ),
          ),
          SizedBox(height: 10.0),
          ClipPath(
            clipper: MultipleRoundedCurveClipper(),
            child: Container(
              height: 100,
              color: Colors.pink,
              child: Center(child: Text("MultipleRoundedCurveClipper()")),
            ),
          ),
          SizedBox(height: 20.0),
          ClipPath(
            clipper: MultiplePointedEdgeClipper(),
            child: Container(
              height: 100,
              color: Colors.green,
              child: Center(child: Text("MultiplePointedEdgeClipper()")),
            ),
          ),
          SizedBox(height: 20.0),
          ClipPath(
            clipper: OctagonalClipper(),
            child: Container(
              height: 220,
              color: Colors.red,
              child: Center(child: Text("OctagonalClipper()")),
            ),
          ),
          SizedBox(height: 10.0),
          ClipPath(
            clipper: HexagonalClipper(),
            child: Container(
              height: 220,
              color: Colors.blueAccent,
              child: Center(child: Text("HexagonalClipper()")),
            ),
          ),
          SizedBox(height: 10.0),
          ClipPath(
            clipper: HexagonalClipper(reverse: true),
            child: Container(
              height: 220,
              color: Colors.orangeAccent,
              child: Center(child: Text("HexagonalClipper(reverse: true)")),
            ),
          ),
          SizedBox(height: 10.0),
          ClipPath(
            clipper: ParallelogramClipper(),
            child: Container(
              height: 220,
              color: Colors.pinkAccent,
              child: Center(child: Text("ParallelogramClipper()")),
            ),
          ),
          SizedBox(height: 10.0),
          ClipPath(
            clipper: DiagonalPathClipperOne(),
            child: Container(
              height: 120,
              color: Colors.red,
              child: Center(child: Text("DiagonalPathClipper()")),
            ),
          ),
          SizedBox(height: 10.0),
          ClipPath(
            clipper: DiagonalPathClipperTwo(),
            child: Container(
              height: 120,
              color: Colors.pink,
              child: Center(child: Text("DiagonalPathClipper()")),
            ),
          ),
          SizedBox(height: 10.0),
          ClipPath(
            clipper: WaveClipperOne(),
            child: Container(
              height: 120,
              color: Colors.deepPurple,
              child: Center(child: Text("WaveClipperOne()")),
            ),
          ),
          SizedBox(height: 10.0),
          ClipPath(
            clipper: WaveClipperOne(reverse: true),
            child: Container(
              height: 120,
              color: Colors.deepPurple,
              child: Center(child: Text("WaveClipperOne(reverse: true)")),
            ),
          ),
          SizedBox(height: 10.0),
          ClipPath(
            clipper: WaveClipperTwo(),
            child: Container(
              height: 120,
              color: Colors.orange,
              child: Center(child: Text("WaveClipperTwo()")),
            ),
          ),
          SizedBox(height: 10.0),
          ClipPath(
            clipper: WaveClipperTwo(reverse: true),
            child: Container(
              height: 120,
              color: Colors.orange,
              child: Center(child: Text("WaveClipperTwo(reverse: true)")),
            ),
          ),
          SizedBox(height: 10.0),
          ClipPath(
            clipper: RoundedDiagonalPathClipper(),
            child: Container(
              height: 320,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(50.0)),
                color: Colors.orange,
              ),
              child: Center(child: Text("RoundedDiagonalPathClipper()")),
            ),
          ),
          SizedBox(height: 10.0),
          ClipPath(
            clipper: OvalTopBorderClipper(),
            child: Container(
              height: 120,
              color: Colors.yellow,
              child: Center(child: Text("OvalTopBorderClipper()")),
            ),
          ),
          SizedBox(height: 10),
          ClipPath(
            clipper: ArrowClipper(70, 80, Edge.LEFT),
            child: Container(
              height: 120,
              color: Colors.pink,
              child: Center(child: Text("ArrowClipper()")),
            ),
          ),
          SizedBox(height: 10),
          ClipPath(
            clipper: ArrowClipper(70, 80, Edge.RIGHT),
            child: Container(
              height: 120,
              color: Colors.red,
              child: Center(child: Text("ArrowClipper()")),
            ),
          ),
          SizedBox(height: 10),
          ClipPath(
            clipper: ArrowClipper(20, 300, Edge.TOP),
            child: Container(
              height: 70,
              width: 50,
              color: Colors.blue,
              child: Center(child: Text("ArrowClipper()")),
            ),
          ),
          SizedBox(height: 10),
          ClipPath(
            clipper: ArrowClipper(70, 80, Edge.BOTTOM),
            child: Container(
              height: 120,
              color: Colors.green,
              child: Center(child: Text("ArrowClipper()")),
            ),
          ),
          SizedBox(height: 10),
          ClipPath(
            clipper: StarClipper(8),
            child: Container(
              height: 450,
              color: Colors.indigo,
              child: Center(child: Text("StarClipper()")),
            ),
          ),
          ClipPath(
            clipper: MessageClipper(borderRadius: 16),
            child: Container(
              height: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(16.0)),
                color: Colors.red,
              ),
              child: Center(child: Text("MessageClipper()")),
            ),
          ),
        ],
      ),
    );
  }
}

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(home: Scaffold(appBar: AppBar(), body: Demo()));
//   }
// }
//
// class Demo extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Column(
//         children: [
//           Container(
//             width: 300,
//             height: 200,
//             margin: const EdgeInsets.only(top: 24, bottom: 16),
//             decoration: ShapeDecoration(shape: WeirdBorder(radius: 32), color: Colors.red),
//           ),
//           Container(
//             width: 200,
//             height: 100,
//             margin: const EdgeInsets.only(bottom: 16),
//             decoration: ShapeDecoration(shape: WeirdBorder(radius: 16, pathWidth: 8), color: Colors.green),
//           ),
//           Container(
//             width: 300,
//             height: 200,
//             decoration: ShapeDecoration(shape: WeirdBorder(radius: 12, pathWidth: 2), color: Colors.blue),
//           ),
//         ],
//       ),
//     );
//   }
// }

class WeirdBorder extends ShapeBorder {
  final double radius;
  final double pathWidth;

  WeirdBorder({required this.radius, this.pathWidth = 1});

  @override
  EdgeInsetsGeometry get dimensions => EdgeInsets.zero;

  // @override
  // Path getInnerPath(Rect rect, {required TextDirection textDirection}) {
  //   return Path()
  //     ..fillType = PathFillType.evenOdd
  //     ..addPath(getOuterPath(rect, textDirection: textDirection), Offset.zero);
  // }

  // @override
  // Path getOuterPath(Rect rect, {required TextDirection textDirection}) => _createPath(rect);

  // @override
  // void paint(Canvas canvas, Rect rect, {required TextDirection textDirection}) {}

  @override
  ShapeBorder scale(double t) => WeirdBorder(radius: radius);

  Path _createPath(Rect rect) {
    final innerRadius = radius + pathWidth;
    final innerRect = Rect.fromLTRB(rect.left + pathWidth, rect.top + pathWidth,
        rect.right - pathWidth, rect.bottom - pathWidth);

    final outer = Path.combine(PathOperation.difference, Path()..addRect(rect),
        _createBevels(rect, radius));
    final inner = Path.combine(PathOperation.difference,
        Path()..addRect(innerRect), _createBevels(rect, innerRadius));
    return Path.combine(PathOperation.difference, outer, inner);
  }

  Path _createBevels(Rect rect, double radius) {
    return Path()
      ..addOval(
          Rect.fromCircle(center: Offset(rect.left, rect.top), radius: radius))
      ..addOval(Rect.fromCircle(
          center: Offset(rect.left + rect.width, rect.top), radius: radius))
      ..addOval(Rect.fromCircle(
          center: Offset(rect.left, rect.top + rect.height), radius: radius))
      ..addOval(Rect.fromCircle(
          center: Offset(rect.left + rect.width, rect.top + rect.height),
          radius: radius));
  }

  @override
  Path getInnerPath(Rect rect, {TextDirection? textDirection}) {
    // TODO: implement getInnerPath
    // throw UnimplementedError();
    return Path()
      ..fillType = PathFillType.evenOdd
      ..addPath(getOuterPath(rect, textDirection: textDirection), Offset.zero);
  }

  @override
  Path getOuterPath(Rect rect, {TextDirection? textDirection}) {
    // TODO: implement getOuterPath
    //throw UnimplementedError();
    return _createPath(rect);
  }

  @override
  void paint(Canvas canvas, Rect rect, {TextDirection? textDirection}) {
    // TODO: implement paint
  }
}
