import '../../core/core.dart';
import 'persisted_users_page_view_model.dart';

class PersistedUsersPageView extends PersistedUsersPageViewModel {
  @override
  Widget build(BuildContext context) {
    const baseWidth = 390;
    double w(double size) => size * AppConstants.instance.screenWidth / baseWidth;
    
    return Scaffold(
      backgroundColor: const Color(0xFFF6F7F8),
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
                      IconButton(
                        icon: Icon(
                          Icons.arrow_back_ios_rounded,
                          color: Colors.white,
                          size: w(24),
                        ),
                        onPressed: () => Navigator.pop(context),
                        style: IconButton.styleFrom(
                          backgroundColor: Colors.white.withValues(alpha: 0.15),
                          padding: EdgeInsets.all(w(8)),
                        ),
                      ),
                      SizedBox(width: w(12)),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'Usuários Salvos',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: w(24),
                                fontWeight: FontWeight.bold,
                                letterSpacing: 0.5,
                              ),
                            ),
                            Text(
                              '${persistedUsers.length} usuários salvos',
                              style: TextStyle(
                                color: Colors.white.withValues(alpha: 0.9),
                                fontSize: w(14),
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: w(48)), 
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              child: persistedUsers.isEmpty
                  ? Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.storage_outlined,
                            size: w(80),
                            color: Colors.grey.shade400,
                          ),
                          SizedBox(height: w(16)),
                          Text(
                            'Nenhum usuário salvo',
                            style: TextStyle(
                              fontSize: w(18),
                              fontWeight: FontWeight.w600,
                              color: Colors.grey.shade600,
                            ),
                          ),
                          SizedBox(height: w(8)),
                          Text(
                            'Salve usuários para vê-los aqui',
                            style: TextStyle(
                              fontSize: w(14),
                              color: Colors.grey.shade500,
                            ),
                          ),
                        ],
                      ),
                    )
                  : ListView.builder(
                      padding: EdgeInsets.symmetric(horizontal: w(16), vertical: w(20)),
                      itemCount: persistedUsers.length,
                      itemBuilder: (context, index) {
                        final user = persistedUsers[index];
                        return Padding(
                          padding: EdgeInsets.only(bottom: w(22)),
                          child: Dismissible(
                            key: Key(user.login.uuid),
                            direction: DismissDirection.endToStart,
                            background: Container(
                              alignment: Alignment.centerRight,
                              padding: EdgeInsets.only(right: w(20)),
                              decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(w(16)),
                              ),
                              child: Icon(
                                Icons.delete_rounded,
                                color: Colors.white,
                                size: w(28),
                              ),
                            ),
                            onDismissed: (direction) {
                              removeUser(user);
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    '${user.name.first} ${user.name.last} removido',
                                  ),
                                  duration: const Duration(seconds: 2),
                                ),
                              );
                            },
                            child: PersonCard(
                              name: '${user.name.first} ${user.name.last}',
                              email: user.email,
                              pictureThumbnail: user.picture.large,
                              onTap: () {
                                onPersonButtonPressed(user);
                              },
                            ),
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