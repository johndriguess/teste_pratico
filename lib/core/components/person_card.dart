import '../../core/core.dart';

class PersonCard extends StatelessWidget {
  final String name;
  final String email;
  final String pictureThumbnail;
  final VoidCallback onTap;

  const PersonCard({
    super.key,
    required this.name,
    required this.email,
    required this.pictureThumbnail,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    const baseWidth = 390;
    const baseHeight = 844;
    double w(double size) => size * AppConstants.instance.screenWidth / baseWidth;
    double h(double size) => size * AppConstants.instance.screenHeight / baseHeight;

    return Stack(
      children: [
        Container(
          height: h(80),
          width: double.infinity,
          margin: EdgeInsets.only(top: h(25)),
          child: InkWell(
            onTap: onTap,
            borderRadius: BorderRadius.circular(w(5)),
            child: Ink(
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [
                    Color(0xFF0F2027),
                    Color(0xFF203A43),
                    Color(0xFF2C5364)
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
                borderRadius: BorderRadius.circular(w(5)),
              ),
              child: Padding(
                padding: EdgeInsets.only(
                  left: w(100),
                  right: w(16),
                  top: h(8),
                ),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name.toUpperCase(),
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w900,
                          fontSize: w(18),
                          shadows: const [
                            Shadow(
                              blurRadius: 8.0,
                              color: Color.fromRGBO(0, 0, 0, 0.2),
                              offset: Offset(1.0, 1.0),
                            ),
                          ],
                        ),
                        textAlign: TextAlign.left,
                      ),
                      Gap(h(2)),
                      Text(
                        email,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.normal,
                          fontSize: w(12),
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
        Positioned(
          left: w(20),
          top: 0,
          child: Container(
            width: w(74),
            height: w(74),
            decoration: BoxDecoration(
              color: Colors.grey[400],
              shape: BoxShape.circle,
              border: Border.all(
                color: const Color(0xFFF6F7F8),
                width: w(4),
              ),
            ),
            child: CircleAvatar(
              backgroundImage: NetworkImage(pictureThumbnail),
            ),
          ),
        ),
      ],
    );
  }
}
