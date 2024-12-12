import 'package:pharesidence/Utils/exports/exports.dart';

class SummaryItem extends StatelessWidget {
  final HomeModel model;

  SummaryItem({required this.model});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: model.onTap, // Assign the onTap callback here
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4),
          child: Column(
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    height: 70.h,
                    width: double.infinity,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: SvgPicture.asset(
                        model.image,
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                  ),
                  Positioned(
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 20,
                      child: Text(
                        model.count,
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(height: 8),
              Text(
                model.title,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}