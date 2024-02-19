import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class LoadingWidget extends StatelessWidget {
  static const _imageBoxFlex = 30,
      _linesFlex = 2,
      _spaceBetweenLines = 1,
      _imageBottomSpace = 5,
      _remainingFlex = 25;
  static const _padding = 15.0;
  const LoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: const Padding(
        padding: EdgeInsets.all(_padding),
        child: Column(
          children: [
            Expanded(
              flex: _imageBoxFlex,
              child: LoadingBox(),
            ),
            Spacer(
              flex: _imageBottomSpace,
            ),            
            Expanded(flex: _linesFlex, child: LoadingBox()),
            Spacer(
              flex: _spaceBetweenLines,
            ),            
            Expanded(flex: _linesFlex, child: LoadingBox()),
            Spacer(
              flex: _spaceBetweenLines,
            ),
            Expanded(
                flex: _linesFlex,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: LoadingBox(
                    isLast: true,
                  ),
                )),
            Spacer(
              flex: _linesFlex,
            ),
            Spacer(
              flex: _imageBottomSpace,
            ),            
            Expanded(flex: _linesFlex, child: LoadingBox()),
            Spacer(
              flex: _spaceBetweenLines,
            ),            
            Expanded(flex: _linesFlex, child: LoadingBox()),
            Spacer(
              flex: _spaceBetweenLines,
            ),            
            Expanded(flex: _linesFlex, child: LoadingBox()),
            Spacer(
              flex: _spaceBetweenLines,
            ),          
            Expanded(flex: _linesFlex, child: LoadingBox()),
            Spacer(
              flex: _spaceBetweenLines,
            ),            
            Expanded(flex: _linesFlex, child: LoadingBox()),
            Spacer(
              flex: _spaceBetweenLines,
            ),           
            Expanded(flex: _linesFlex, child: LoadingBox()),
            Spacer(
              flex: _spaceBetweenLines,
            ),           
            Expanded(flex: _linesFlex, child: LoadingBox()),
            Spacer(
              flex: _spaceBetweenLines,
            ),
            Expanded(
              flex: _linesFlex,
              child: Align(
                  alignment: Alignment.centerLeft,
                  child: LoadingBox(
                    isLast: true,
                  )),
            ),
            Spacer(
              flex: _remainingFlex,
            )
          ],
        ),
      ),
    );
  }
}

class LoadingBox extends StatelessWidget {
  static const _borderRadius = 20.0;
  final bool isLast;
  const LoadingBox({super.key, this.isLast = false});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    return Container(
      width: isLast ? width / 2 : width,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(_borderRadius),
      ),
    );
  }
}
