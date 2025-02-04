import 'package:global_school/core/client/client.dart';
import 'package:global_school/features/student/certificate/model/certificate_model.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final certificateServiceProvider =
    Provider<CertificateService>(CertificateService.new);

class CertificateService {
  CertificateService(this.ref);

  final Ref ref;

  Future<List<Certificate>> fetchCertificates() async {
    final apiClient = ref.read(clientProvider);
    final response = await apiClient.get('/student/certificates');
    final Map<String, dynamic> responseData = response.data;
    final List<dynamic> certificatesList = responseData['data'];
    return certificatesList.map((json) => Certificate.fromJson(json)).toList();
  }

  Future<Certificate> fetchCertificateById(String id) async {
    final apiClient = ref.read(clientProvider);
    final response = await apiClient.get('/student/certificates/$id');
    final Map<String, dynamic> responseData = response.data['data'];
    return Certificate.fromJson(responseData);
  }
}
