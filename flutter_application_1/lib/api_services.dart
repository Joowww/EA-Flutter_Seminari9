import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  // URL de ejemplo (puedes cambiarla por tu API)
  static const String baseUrl = 'http://localhost:3000/api';

  // 🔹 Función para obtener usuarios
  static Future<List<dynamic>> getUsers() async {
    final response = await http.get(Uri.parse('$baseUrl/user'));

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Error al cargar los datos');
    }
  }
}
