import 'package:teste_pratico/features/info_page/details_page_view_model.dart';
import '../../core/core.dart';
import 'package:provider/provider.dart';

class DetailsPageView extends DetailsPageViewModel {
  @override
  Widget build(BuildContext context) {
    const baseWidth = 390;
    double w(double size) => size * AppConstants.instance.screenWidth / baseWidth;
    
    return Consumer<UserProvider>(
      builder: (context, userProvider, _) {
        final user = userProvider.selectedUser;
        
        if (user == null) {
          return const Center(child: Text('Nenhum usuário selecionado'));
        }

        return SafeArea(
          child: Scaffold(
            backgroundColor: const Color(0xFFF6F7F8),
            appBar: AppBar(
              title: const Text('Detalhes do Usuário'),
              elevation: 0,
            ),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Theme.of(context).primaryColor.withOpacity(0.1),
                          Colors.transparent,
                        ],
                      ),
                    ),
                    child: Column(
                      children: [
                        Gap(w(24)),
                        CircleAvatar(
                          radius: w(60),
                          backgroundImage: NetworkImage(user.picture.large),
                        ),
                        Gap(w(16)),
                        Text(
                          '${user.name.title} ${user.name.first} ${user.name.last}',
                          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                            fontWeight: FontWeight.bold,
                            fontSize: w(22),
                          ),
                          textAlign: TextAlign.center,
                        ),
                        Gap(w(8)),
                        Text(
                          user.email,
                          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: Colors.grey[600],
                            fontSize: w(14),
                          ),
                        ),
                        Gap(w(24)),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(w(16)),
                    child: Column(
                      children: [
                        _buildInfoCard(
                          context,
                          w: w,
                          title: 'Informações Pessoais',
                          icon: Icons.person,
                          children: [
                            _buildInfoRow(w, 'Gênero', _formatGender(user.gender)),
                            _buildInfoRow(w, 'Data de Nascimento', _formatDate(user.dob.date)),
                            _buildInfoRow(w, 'Idade', '${user.dob.age} anos'),
                            _buildInfoRow(w, 'Nacionalidade', user.nat),
                          ],
                        ),
                        Gap(w(16)),
                        _buildInfoCard(
                          context,
                          w: w,
                          title: 'Endereço',
                          icon: Icons.location_on,
                          children: [
                            _buildInfoRow(w, 'Rua', '${user.location.street.number} ${user.location.street.name}'),
                            _buildInfoRow(w, 'Cidade', user.location.city),
                            _buildInfoRow(w, 'Estado', user.location.state),
                            _buildInfoRow(w, 'País', user.location.country),
                            _buildInfoRow(w, 'CEP', user.location.postcode.toString()),
                            _buildInfoRow(w, 'Coordenadas', '${user.location.coordinates.latitude}, ${user.location.coordinates.longitude}'),
                            _buildInfoRow(w, 'Fuso Horário', '${user.location.timezone.offset} - ${user.location.timezone.description}'),
                          ],
                        ),
                        Gap(w(16)),
                        _buildInfoCard(
                          context,
                          w: w,
                          title: 'Contato',
                          icon: Icons.phone,
                          children: [
                            _buildInfoRow(w, 'Telefone', user.phone),
                            _buildInfoRow(w, 'Celular', user.cell),
                          ],
                        ),
                        Gap(w(16)),
                        _buildInfoCard(
                          context,
                          w: w,
                          title: 'Login',
                          icon: Icons.lock,
                          children: [
                            _buildInfoRow(w, 'Username', user.login.username),
                            _buildInfoRow(w, 'UUID', user.login.uuid),
                          ],
                        ),
                        Gap(w(16)),
                        _buildInfoCard(
                          context,
                          w: w,
                          title: 'Identificação',
                          icon: Icons.badge,
                          children: [
                            _buildInfoRow(w, user.id.name, user.id.value ?? "Não Informado"),
                          ],
                        ),
                        Gap(w(16)),
                        _buildInfoCard(
                          context,
                          w: w,
                          title: 'Registro',
                          icon: Icons.calendar_today,
                          children: [
                            _buildInfoRow(w, 'Data de Registro', _formatDate(user.registered.date)),
                            _buildInfoRow(w, 'Tempo de Registro', '${user.registered.age} anos'),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildInfoCard(
    BuildContext context, {
    required double Function(double) w,
    required String title,
    required IconData icon,
    required List<Widget> children,
  }) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(w(12)),
      ),
      child: Padding(
        padding: EdgeInsets.all(w(16)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  icon,
                  size: w(20),
                  color: Theme.of(context).primaryColor,
                ),
                Gap(w(8)),
                Text(
                  title,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    fontSize: w(16),
                  ),
                ),
              ],
            ),
            Divider(height: w(24)),
            ...children,
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(double Function(double) w, String label, String value) {
    return Padding(
      padding: EdgeInsets.only(bottom: w(12)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 2,
            child: Text(
              label,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                color: Colors.grey,
                fontSize: w(13),
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Text(
              value,
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: w(13),
              ),
            ),
          ),
        ],
      ),
    );
  }

  String _formatGender(String gender) {
    return gender == 'male' ? 'Masculino' : 'Feminino';
  }

  String _formatDate(String dateString) {
    final date = DateTime.parse(dateString);
    return '${date.day.toString().padLeft(2, '0')}/${date.month.toString().padLeft(2, '0')}/${date.year}';
  }
}