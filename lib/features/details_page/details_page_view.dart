import 'package:teste_pratico/features/details_page/details_page_view_model.dart';
import '../../core/core.dart';

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
            floatingActionButton: FloatingActionButton.extended(
              onPressed: toggleSaveUser,
              backgroundColor: isSaved 
                ? Colors.red 
                : const Color(0xFF2C5364),
              icon: Icon(
                isSaved ? Icons.delete_rounded : Icons.save_rounded,
                color: Colors.white,
              ),
              label: Text(
                isSaved ? 'Remover' : 'Salvar',
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
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
                          Theme.of(context).primaryColor.withValues(alpha: 0.1),
                          Colors.transparent,
                        ],
                      ),
                    ),
                    child: Column(
                      children: [
                        Gap(w(24)),
                        Stack(
                          children: [
                            CircleAvatar(
                              radius: w(60),
                              backgroundImage: NetworkImage(user.picture.large),
                            ),
                            Positioned(
                              right: 0,
                              bottom: 0,
                              child: Container(
                                padding: EdgeInsets.all(w(6)),
                                decoration: BoxDecoration(
                                  color: isSaved ? Colors.green : Colors.grey,
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: Colors.white,
                                    width: 2,
                                  ),
                                ),
                                child: Icon(
                                  isSaved ? Icons.bookmark : Icons.bookmark_border,
                                  color: Colors.white,
                                  size: w(16),
                                ),
                              ),
                            ),
                          ],
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
                        InfoCard(
                          title: 'Informações Pessoais',
                          icon: Icons.person,
                          children: [
                            InfoRow(
                              label: 'Gênero', 
                              value: formatGender(user.gender)
                            ),
                            InfoRow(
                              label: 'Data de Nascimento', 
                              value: formatDate(user.dob.date)
                            ),
                            InfoRow(
                              label: 'Idade', 
                              value:'${user.dob.age} anos'
                            ),
                            InfoRow(
                              label: 'Nacionalidade', 
                              value: user.nat
                            ),
                          ],
                        ),
                        Gap(w(16)),
                        InfoCard(
                          title: 'Endereço',
                          icon: Icons.location_on,
                          children: [
                            InfoRow(
                              label: 'Rua', 
                              value: '${user.location.street.number} ${user.location.street.name}'
                            ),
                            InfoRow(
                              label: 'Cidade', 
                              value: user.location.city
                            ),
                            InfoRow(
                              label:'Estado', 
                              value: user.location.state
                            ),
                            InfoRow(
                              label: 'País', 
                              value: user.location.country
                            ),
                            InfoRow(
                              label: 'CEP', 
                              value: user.location.postcode.toString()
                            ),
                            InfoRow(
                              label: 'Coordenadas', 
                              value: '${user.location.coordinates.latitude}, ${user.location.coordinates.longitude}'
                            ),
                            InfoRow(
                              label: 'Fuso Horário', 
                              value: '${user.location.timezone.offset} - ${user.location.timezone.description}'
                            ),
                          ],
                        ),
                        Gap(w(16)),
                        InfoCard(
                          title: 'Contato',
                          icon: Icons.phone,
                          children: [
                            InfoRow(
                              label: 'Telefone', 
                              value: user.phone
                            ),
                            InfoRow(
                              label: 'Celular', 
                              value: user.cell
                            ),
                          ],
                        ),
                        Gap(w(16)),
                        InfoCard(
                          title: 'Login',
                          icon: Icons.lock,
                          children: [
                            InfoRow( 
                              label: 'Username', 
                              value: user.login.username
                            ),
                            InfoRow(
                              label: 'UUID', 
                              value: user.login.uuid
                            ),
                          ],
                        ),
                        Gap(w(16)),
                        InfoCard(
                          title: 'Identificação',
                          icon: Icons.badge,
                          children: [
                            InfoRow(
                              label: user.id.name, 
                              value: user.id.value ?? "Não Informado"
                            ),
                          ],
                        ),
                        Gap(w(16)),
                        InfoCard(
                          title: 'Registro',
                          icon: Icons.calendar_today,
                          children: [
                            InfoRow(
                              label: 'Data de Registro', 
                              value: formatDate(user.registered.date)
                            ),
                            InfoRow(
                              label: 'Tempo de Registro', 
                              value: '${user.registered.age} anos'
                            ),
                          ],
                        ),
                        Gap(w(80)), 
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
}