import 'package:spot/core/utils/exports.dart';

import 'home_viewmodel.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    final textTheme = theme.textTheme;

    return ViewModelBuilder<HomeViewModel>.reactive(
      viewModelBuilder: () => HomeViewModel(),
      builder: (context, model, child) => GestureDetector(
        onTap: () => model.initFocusHelper(context),
        child: Scaffold(
          backgroundColor: theme.backgroundColor,
          appBar: AppBar(
            title: Text(
              'Spot',
              style: textTheme.headline1,
            ),
            centerTitle: false,
            actions: [
              IconButton(
                onPressed: () => model.toggleTheme(context),
                icon: Icon(
                  model.isDarkMode(context) ? Icons.light_mode : Icons.dark_mode,
                  size: 25,
                  color: theme.iconTheme.color,
                ),
              )
            ],
            elevation: 0,
            backgroundColor: theme.backgroundColor,
          ),
          body: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Flex(
                direction: Axis.vertical,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Flexible(
                    flex: 1,
                    child: AnimatedTextKit(
                      animatedTexts: [
                        TypewriterAnimatedText(
                          'Add a phone number:',
                          textStyle: const TextStyle(
                            fontSize: 24.0,
                            fontWeight: FontWeight.bold,
                          ),
                          speed: const Duration(milliseconds: 100),
                          cursor: ' |',
                          curve: Curves.elasticInOut,
                        ),
                      ],
                      isRepeatingAnimation: false,
                      pause: const Duration(milliseconds: 300),
                    ),
                  ),
                  const SizedBox(height: 14.0),
                  Flexible(
                    flex: 1,
                    child: TextFormField(
                      controller: model.textController,
                      onSaved: (value) {},
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                          icon: Icon(
                            CupertinoIcons.search,
                            size: 25,
                            color: theme.iconTheme.color,
                          ),
                          onPressed: () => model.saveRecentSearches(context),
                        ),
                        suffixIconColor: theme.iconTheme.color,
                        focusColor: theme.iconTheme.color,
                        hintText: 'Phone number',
                        hintStyle: textTheme.subtitle2,
                        filled: true,
                        fillColor: theme.colorScheme.secondary,
                        border: kTextInputBorder,
                        enabledBorder: kTextInputBorder,
                        disabledBorder: kTextInputBorder,
                        focusedBorder: kTextInputBorder,
                      ),
                      keyboardType: TextInputType.phone,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
