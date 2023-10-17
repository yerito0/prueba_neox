import 'package:flutter/material.dart';

import '../../core/models/user_model.dart';

class UserCardWidget extends StatelessWidget {
  const UserCardWidget({
    super.key,
    required this.user,
  });
  final User user;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      margin: const EdgeInsets.all(12.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              user.name,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8.0),
            Text('Nombre de Usuario: ${user.username}'),
            Text('Email: ${user.email}'),
            Text('Teléfono: ${user.phone}'),
            Text('Sitio web: ${user.website}'),
            const Divider(),
            const Text(
              'Dirección:',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text('Calle: ${user.address.street}'),
            Text('Departamento: ${user.address.suite}'),
            Text('Ciudad: ${user.address.city}'),
            Text('Código postal: ${user.address.zipcode}'),
            const Divider(),
            const Text(
              'Compañia:',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text('Nombre: ${user.company.name}'),
            Text('Eslogan: ${user.company.catchPhrase}'),
            Text('Negocio: ${user.company.bs}'),
          ],
        ),
      ),
    );
  }
}
