import '../../core/core.dart';
import 'home_page_view_model.dart';

class HomePageView extends HomePageViewModel{
  @override
  Widget build(BuildContext context) {
    const baseWidth = 390;
    double w(double size) => size * AppConstants.instance.screenWidth / baseWidth;
    
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: w(20), vertical: w(20)),
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color(0xFF0F2027),
                    Color(0xFF203A43),
                    Color(0xFF2C5364),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Color(0x1A000000),
                    blurRadius: 20,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'Usuários',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: w(24),
                                fontWeight: FontWeight.bold,
                                letterSpacing: 0.5,
                              ),
                            ),
                            Text(
                              '${userList.length} usuários encontrados',
                              style: TextStyle(
                                color: Colors.white.withValues(alpha: 0.9),
                                fontSize: w(14),
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.symmetric(horizontal: w(16), vertical: w(20)),
                itemCount: userList.length,
                itemBuilder: (context, index) {
                  final user = userList[index];
                  return Padding(
                    padding: EdgeInsets.only(bottom: w(22)),
                    child: PersonCard(
                      name: '${user.name.first} ${user.name.last}', 
                      email: user.email, 
                      pictureThumbnail: user.picture.large, 
                      onTap: () {
                        
                      }
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}