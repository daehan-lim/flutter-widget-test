import 'package:flutter/material.dart';

class ExplicitAnimationExample extends StatefulWidget {
  const ExplicitAnimationExample({super.key});

  @override
  State<ExplicitAnimationExample> createState() =>
      _ExplicitAnimationExampleState();
}

class _ExplicitAnimationExampleState
    extends
        State<ExplicitAnimationExample> // Animation 프레임 동기화 해주는 Mixin
    with TickerProviderStateMixin {
  // AnimationController 객체 초기화.
  // vsync => _ExplictAnimationExampleState class (TickerProviderStateMixin 사용중)
  late final animationController = AnimationController(
    vsync: this,
    duration: Duration(seconds: 10),
  );

  // Tween => 애니메이션 시작과 끝 값을 정의해주는 객체
  // animate 메서드를 사용해 AnimationController와 결합(AnimationController는 0~1까지만 값 변경)
  late Animation<double> animation = Tween<double>(
    begin: 0,
    end: 300,
  ).animate(animationController);

  @override
  void dispose() {
    // 반드시 호출
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // LongPress 시작하면 호출
      onLongPressDown: (details) {
        // animationController 애니메이션 진행
        animationController.forward();
      },
      // LongPress 끝나면 호출
      onLongPressEnd: (details) {
        // animationController 애니메이션 중지
        animationController.stop();
      },
      // LongPress 취소 => 중간에 손가락을 움직여 드래그하거나 다른 이유로 터치가 취소되었을 때
      onLongPressCancel: () {
        // animationController 애니메이션 중지
        animationController.stop();
      },
      onDoubleTap: () {
        // animationController 애니메이션 초기화
        animationController.reset();
      },
      child: Container(
        height: 300,
        color: Colors.blue,
        alignment: Alignment.center,
        child: Stack(
          children: [
            Container(width: 50, height: 300, color: Colors.red),
            // AnimatedBuilder 사용하면 animation 값 변경 시 setState해줄 필요 X
            // AnimatedBuilder 가 animation 속성에 전달된 animation 객체를 관찰함
            AnimatedBuilder(
              animation: animation,
              builder: (context, child) {
                return Container(
                  width: 50,
                  height: animation.value,
                  color: Colors.green,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
