import 'package:cine_reserve_app/core/constant/app_color.dart';
import 'package:cine_reserve_app/core/constant/app_fonts.dart';
import 'package:cine_reserve_app/core/constant/strings.dart';
import 'package:cine_reserve_app/features/home/domain/entity/movie_entity.dart';
import 'package:flutter/material.dart';

class SectionDescription extends StatefulWidget {
  const SectionDescription({super.key, required this.moviesEntity});
  final MoviesEntity moviesEntity;
  @override
  State<SectionDescription> createState() => _SectionDescriptionState();
}

int maxLines = 3;
int numLines = 0;

class _SectionDescriptionState extends State<SectionDescription> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        TextSpan span = TextSpan(
          text: widget.moviesEntity.overviewMovie,
          style: AppFonts.regular_12
              .copyWith(color: AppColor.white.withOpacity(0.6)),
        );

        //! text painter take text span and dierction from left to right
        TextPainter tp =
            TextPainter(text: span, textDirection: TextDirection.ltr);

        //! take text and max width to the text
        tp.layout(maxWidth: constraints.maxWidth);

        //! calculate how many lines in the text
        int numLines = tp.computeLineMetrics().length;

        //! check if (lines text > 3) return text and (maxLines = 3) and display
        //! read more then press read more become (maxLines ==numLines )
        //! and display (showLess)
        //!else display text if (numLines <3) without readmore and show less
        if (numLines > 3) {
          return InkWell(
            onTap: () {
              setState(() {
                if (maxLines == numLines) {
                  maxLines = 3;
                } else {
                  maxLines = numLines;
                }
              });
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.moviesEntity.overviewMovie!,
                  maxLines: maxLines,
                  style: AppFonts.regular_12
                      .copyWith(color: AppColor.white.withOpacity(0.6)),
                ),
                Text(
                  maxLines == numLines ? kShowLess : kReadMore,
                  style: AppFonts.semiBold_12.copyWith(color: AppColor.white),
//                       )
                )
              ],
            ),
          );
        } else {
          return Text(
            widget.moviesEntity.overviewMovie!,
            style: AppFonts.regular_12
                .copyWith(color: AppColor.white.withOpacity(0.6)),
          );
        }
      },
    );
  }
}
