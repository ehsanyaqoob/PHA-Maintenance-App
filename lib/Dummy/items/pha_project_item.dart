import'package:pharesidence/exports/exports.dart';
class PHAProjectItem extends StatelessWidget {
  String title, image;
  PHAProjectItem({super.key, required this.title, required this.image});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      child: Container(
        height: MediaQuery.of(context).size.width * 0.6,
        decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage(image), fit: BoxFit.fill),
            borderRadius: BorderRadius.all(Radius.circular(15))),
        child: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.width * 0.6,
              decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.5),
                  borderRadius: BorderRadius.all(Radius.circular(15))),
            ),
            Positioned(
              bottom: 16, // Position the text at the bottom of the image
              left: 16,
              child: Text(
                title, // Text from list
                softWrap: true, // Allow text to wrap to the next line
                overflow: TextOverflow.visible,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
