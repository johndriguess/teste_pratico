import '../../core/core.dart';

class PersonCard extends StatefulWidget {
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
  State<PersonCard> createState() => _PersonCardState();
}

class _PersonCardState extends State<PersonCard> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;
  late Animation<double> _shadowAnimation;
  bool _isPressed = false;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 150),
      vsync: this,
    );
    _scaleAnimation = Tween<double>(
      begin: 1.0,
      end: 0.98,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    ));
    _shadowAnimation = Tween<double>(
      begin: 1.0,
      end: 0.5,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    ));
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const baseWidth = 390;
    double w(double size) => size * AppConstants.instance.screenWidth / baseWidth;

    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) {
        return Transform.scale(
          scale: _scaleAnimation.value,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(w(16)),
              boxShadow: [
                BoxShadow(
                  color: const Color(0x0A000000).withValues(alpha: _shadowAnimation.value),
                  blurRadius: 20,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: () {
                  if (!_isPressed) {
                    setState(() {
                      _isPressed = true;
                    });
                    _animationController.forward().then((_) {
                      widget.onTap();
                      Future.delayed(const Duration(milliseconds: 50), () {
                        if (mounted) {
                          _animationController.reverse();
                          setState(() {
                            _isPressed = false;
                          });
                        }
                      });
                    });
                  }
                },
                borderRadius: BorderRadius.circular(w(16)),
                child: Container(
                  padding: EdgeInsets.all(w(16)),
                  child: Row(
                    children: [
                      Container(
                        width: w(60),
                        height: w(60),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: const LinearGradient(
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
                              color: const Color(0xFF667eea).withValues(alpha: 0.3 * _shadowAnimation.value),
                              blurRadius: 12,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        child: Container(
                          margin: EdgeInsets.all(w(3)),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                          ),
                          child: ClipOval(
                            child: Image.network(
                              widget.pictureThumbnail,
                              width: w(54),
                              height: w(54),
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) {
                                return Container(
                                  width: w(54),
                                  height: w(54),
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    gradient: LinearGradient(
                                      colors: [
                                        Color(0xFF667eea),
                                        Color(0xFF764ba2),
                                      ],
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                    ),
                                  ),
                                  child: Icon(
                                    Icons.person,
                                    color: Colors.white,
                                    size: w(24),
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: w(16)),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.name,
                              style: TextStyle(
                                color: const Color(0xFF1E293B),
                                fontWeight: FontWeight.w700,
                                fontSize: w(16),
                                letterSpacing: 0.2,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            SizedBox(height: w(4)),
                            Row(
                              children: [
                                Icon(
                                  Icons.email_outlined,
                                  size: w(14),
                                  color: const Color(0xFF64748B),
                                ),
                                SizedBox(width: w(6)),
                                Expanded(
                                  child: Text(
                                    widget.email,
                                    style: TextStyle(
                                      color: const Color(0xFF64748B),
                                      fontWeight: FontWeight.w500,
                                      fontSize: w(13),
                                    ),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Icon(
                        Icons.arrow_forward_ios_rounded,
                        size: w(14),
                        color:const Color(0xFF64748B),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
