import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../utilities/colors.dart';

class Search extends StatelessWidget {
  const Search({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Center(
          child: Image.asset(
            'assets/images/google-logo.png',
            height: size.width > 780 ? size.height * 0.14 : size.height * 0.10,
          ),
        ),
        SizedBox(
          height: size.height * 0.04,
        ),
        SizedBox(
          width: size.width > 780 ? size.width * 0.4 : size.width * 0.9,
          child: TextFormField(
            style: const TextStyle(color: Colors.black54),
            textCapitalization: TextCapitalization.sentences,
            decoration: InputDecoration(
              // prefixIconConstraints: BoxConstraints(maxHeight: 14),
              prefixIcon: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SvgPicture.asset('assets/images/search-icon.svg',
                    color: searchBorder),
              ),
              suffixIcon: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SvgPicture.asset('assets/images/mic-icon.svg',),
              ),
              // fillColor: Colors.white,
              // filled: true,
              border: const OutlineInputBorder(
                borderSide: BorderSide(color: searchColor),
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
