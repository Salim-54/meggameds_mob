import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../../controller/search/token.controller.dart';

class SearchWidget extends StatefulWidget {
  const SearchWidget({Key? key}) : super(key: key);

  @override
  _SearchWidgetState createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget>
    with SingleTickerProviderStateMixin {
  TokenController token_search = Get.put(TokenController());

  late AnimationController _animationController;
  late Animation<Offset> _offsetAnimation;
  late Animation<double> _containerWidth;
  late Animation<Color?> _containerColor;
  late Animation<Color?> _iconColor;
  late Animation<double> _trailingIconRotation;
  late TextEditingController _textEditingController;

  bool _showTopContainer = false;
  bool _showTrailingIcon = false;

  bool _showTextInputResult = false;

  bool _expaned = false;

  @override
  void initState() {
    super.initState();

    _textEditingController = TextEditingController();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );
    _offsetAnimation = Tween<Offset>(begin: Offset.zero, end: Offset(-1.6, 0))
        .animate(CurvedAnimation(
            parent: _animationController, curve: Interval(0.0, 0.4)));

    _containerWidth = Tween<double>(begin: 80, end: 500).animate(
        CurvedAnimation(
            parent: _animationController, curve: Interval(0.4, 1.0)));

    _containerColor =
        ColorTween(begin: Color(0xFF000000), end: Color(0xFFFFFFFF)).animate(
            CurvedAnimation(
                parent: _animationController, curve: Interval(0.4, 1.0)));

    _iconColor = ColorTween(begin: Colors.white, end: Colors.black).animate(
        CurvedAnimation(
            parent: _animationController, curve: Interval(0.4, 1.0)));

    _trailingIconRotation = Tween<double>(begin: 0.0, end: 0.5).animate(
        CurvedAnimation(
            parent: _animationController, curve: Interval(0.8, 1.0)));

    _animationController.addListener(() {
      if (_animationController.value >= 0.4) {
        setState(() {
          _showTopContainer = true;
        });
      }

      if (_animationController.value >= 0.6) {
        setState(() {
          _showTrailingIcon = true;
        });
      } else {
        setState(() {
          _showTrailingIcon = false;
        });
      }
    });

    _animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        setState(() {
          _expaned = true;
        });
      } else if (status == AnimationStatus.dismissed) {
        setState(() {
          _expaned = false;
          _showTopContainer = false;
        });
      }
    });
    _animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;
    return Stack(
      alignment: Alignment.center,
      children: [
        Visibility(
          visible: !_showTopContainer,
          child: AnimatedBuilder(
            animation: _animationController,
            builder: (_, __) => GestureDetector(
              onTap: () {
                _animationController.forward();
              },
              child: SlideTransition(
                position: _offsetAnimation,
                child: AnimatedContainer(
                  duration: const Duration(
                    milliseconds: 400,
                  ),
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        blurRadius: 12,
                      )
                    ],
                    color: Colors.black,
                  ),
                  child: Icon(
                    FontAwesomeIcons.search,
                    color: Colors.white,
                    size: 30,
                  ),
                ),
              ),
            ),
          ),
        ),
        Visibility(
          visible: _showTopContainer,
          child: AnimatedBuilder(
            animation: _animationController,
            builder: (context, child) => Align(
              alignment: _expaned ? Alignment.center : Alignment.centerLeft,
              child: _showTextInputResult
                  ? AnimatedContainer(
                      duration: const Duration(milliseconds: 400),
                      margin: EdgeInsets.symmetric(horizontal: 24),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            blurRadius: 12,
                          )
                        ],
                        color: Colors.white,
                      ),
                      width: 500,
                      height: 80,
                      child: Column(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                width: 80,
                                height: 80,
                                alignment: Alignment.center,
                                child: Icon(
                                  FontAwesomeIcons.search,
                                  color: _iconColor.value,
                                  size: 30,
                                ),
                              ),
                              Expanded(
                                child: TextField(
                                  keyboardType: TextInputType.number,
                                  controller: _textEditingController,
                                  autofocus: true,
                                  onSubmitted: (value) {
                                    print(value);
                                  },
                                  style: TextStyle(
                                    fontSize: 20,
                                    // color: Colors.black.withOpacity(0.4),
                                  ),
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: 'Search...',
                                    hintStyle: TextStyle(
                                      fontSize: 20,
                                      color: Colors.black.withOpacity(0.4),
                                    ),
                                  ),
                                  onChanged: (value) {},
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  if (_textEditingController.text.isNotEmpty) {
                                    setState(() {
                                      _textEditingController.clear();
                                    });
                                  } else {
                                    setState(() {
                                      _showTextInputResult = false;
                                    });
                                  }
                                },
                                child: Container(
                                  width: 80.0,
                                  height: 80.0,
                                  alignment: Alignment.center,
                                  child: Icon(
                                    FontAwesomeIcons.trashAlt,
                                    color: Colors.black,
                                    size: 30,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    )
                  : Container(
                      margin: EdgeInsets.symmetric(horizontal: 24),
                      width: _containerWidth.value,
                      height: 80,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            blurRadius: 12,
                          )
                        ],
                        color: _containerColor.value,
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: 80,
                            height: 80,
                            alignment: Alignment.center,
                            child: Icon(
                              FontAwesomeIcons.search,
                              color: _iconColor.value,
                              size: 30,
                            ),
                          ),
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  _showTextInputResult = true;
                                });
                              },
                              child: Text(
                                'Search...',
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.black.withOpacity(0.4),
                                ),
                              ),
                            ),
                          ),
                          Visibility(
                            visible: _showTrailingIcon,
                            child: RotationTransition(
                              turns: _trailingIconRotation,
                              child: GestureDetector(
                                onTap: () {
                                  _animationController.reverse();
                                  // setState(() {
                                  //   _showSearchResult = false;
                                  // });
                                },
                                child: Container(
                                  width: 80.0,
                                  height: 80.0,
                                  alignment: Alignment.center,
                                  child: Icon(
                                    FontAwesomeIcons.times,
                                    color: Colors.black,
                                    size: 30,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}
