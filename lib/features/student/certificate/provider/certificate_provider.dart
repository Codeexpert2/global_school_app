import 'package:global_school/features/student/certificate/model/certificate_model.dart';
import 'package:global_school/features/student/certificate/service/certificate_service.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final certificateListProvider = FutureProvider<List<Certificate>>((ref) {
  final certificateService = ref.read(certificateServiceProvider);
  return certificateService.fetchCertificates();
});

final certificateProvider =
    FutureProvider.family<Certificate, String>((ref, id) {
  final certificateService = ref.read(certificateServiceProvider);
  return certificateService.fetchCertificateById(id);
});
