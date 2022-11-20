import 'package:flutter/material.dart';
import 'package:palpipatrol/providers/foods.dart';
import 'package:provider/provider.dart';
import 'package:palpipatrol/models/food.dart';
import 'package:textfield_tags/textfield_tags.dart';

class MealBuilder extends StatefulWidget {
  const MealBuilder({Key? key}) : super(key: key);

  @override
  _MealBuilderState createState() => _MealBuilderState();
}

class _MealBuilderState extends State<MealBuilder> {
  late double _distanceToField;
  late TextfieldTagsController _controller;
  List<Food> foods = [];
  FocusNode textFocusNode = FocusNode();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _distanceToField = MediaQuery.of(context).size.width;
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  void initState() {
    super.initState();
    _controller = TextfieldTagsController();
  }

  void _onPressed() {
    setState(() {
      // TODO: ensure tags are all lower-case
      textFocusNode.unfocus();
      final tags = _controller.getTags as List<String>;
      var food_provider = Provider.of<Foods>(context, listen: false);
      food_provider.updateFoods(tags);
      _controller.getTags!.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: textFocusNode.unfocus,
      child: Card(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text("What did you have for lunch?"),
          TextFieldTags(
            // TODO: build autocomplete
            textSeparators: const [','],
            letterCase: LetterCase.small,
            textfieldTagsController: _controller,
            focusNode: textFocusNode,
            inputfieldBuilder: (context, tec, fn, error, onChanged, onSubmitted) {
              return ((context, sc, tags, onTagDelete) {
                return Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextField(
                    controller: tec,
                    focusNode: textFocusNode,
                    decoration: InputDecoration(
                      isDense: true,
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Theme.of(context).primaryColorDark,
                          width: 3.0,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Theme.of(context).focusColor,
                          width: 3.0,
                        ),
                      ),
                      helperText: 'Enter ingredients...',
                      helperStyle: TextStyle(
                        color: Theme.of(context).hintColor,
                      ),
                      errorText: error,
                      prefixIconConstraints:
                          BoxConstraints(maxWidth: _distanceToField * 0.74),
                      prefixIcon: tags.isNotEmpty
                          ? SingleChildScrollView(
                              controller: sc,
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                  children: tags.map((String tag) {
                                return Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(20.0),
                                    ),
                                    color: Theme.of(context).primaryColor,
                                  ),
                                  margin:
                                      const EdgeInsets.symmetric(horizontal: 5.0),
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10.0, vertical: 5.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      InkWell(
                                        child: Text(
                                          '#$tag',
                                          style: const TextStyle(
                                              color: Colors.white),
                                        ),
                                        onTap: () {
                                          print("$tag selected");
                                        },
                                      ),
                                      const SizedBox(width: 4.0),
                                      InkWell(
                                        child: const Icon(
                                          Icons.cancel,
                                          size: 14.0,
                                          color:
                                              Color.fromARGB(255, 233, 233, 233),
                                        ),
                                        onTap: () {
                                          // TODO: delete
                                          onTagDelete(tag);
                                        },
                                      )
                                    ],
                                  ),
                                );
                              }).toList()),
                            )
                          : null,
                    ),
                    onChanged: onChanged,
                    onSubmitted: onSubmitted,
                  ),
                );
              });
            },
          ),
          TextButton(
            onPressed: _onPressed,
            child: Text("Submit"),
            // onHover: ,
          ),
        ]),
      ),
    );
  }
}
