import 'package:http/http.dart' as http;
import 'dart:convert';

class ArgumentsId {
  final String id;
  ArgumentsId(this.id);
}

class ArgumentsDouble{
  final String id1;
  final String id2;
  ArgumentsDouble(this.id1,this.id2);
}



Future getAsetById(String id) async{
  var url = 'http://10.0.2.2/manajemen_aset/mobile/getAsetById/${id}';
  http.Response response = await http.get(url);
  var data = jsonDecode(response.body);
  return data;
}

Future getAsetByJenis(String jenis_id) async{
  var url = 'http://10.0.2.2/manajemen_aset/mobile/getAsetByJenis/${jenis_id}';
  http.Response response = await http.get(url);
  var data = jsonDecode(response.body);
  return data;
}

Future<String> checkData(String username, String password) async {
  var url = 'http://10.0.2.2/manajemen_aset/mobile/login/${username}/${password}';
  http.Response response = await http.get(url);
  var data = jsonDecode(response.body);
  return data;
}

Future getJenisById(String id) async{
  var url = 'http://10.0.2.2/manajemen_aset/mobile/getJenisById/${id}';
  http.Response response = await http.get(url);
  var data = jsonDecode(response.body);
  return data;
}

Future getAllJenis() async{
  var url = 'http://10.0.2.2/manajemen_aset/mobile/getAllJenis';
  http.Response response = await http.get(url);
  var data = jsonDecode(response.body);
  return data;
}

Future getAllAset() async{
  var url = 'http://10.0.2.2/manajemen_aset/mobile/getAllAset';
  http.Response response = await http.get(url);
  var data = jsonDecode(response.body);
  return data;
}

Future getFormByJenis(String jenis_id) async{
  var url = 'http://10.0.2.2/manajemen_aset/mobile/getFormByJenis/${jenis_id}';
  http.Response response = await http.get(url);
  var data = jsonDecode(response.body);
  return data;
}

Future getRowByJadwalAset(String form_id, String aset_id ) async{
  var url = 'http://10.0.2.2/manajemen_aset/mobile/getFormRowByFormAset/${form_id}/${aset_id}';
  http.Response response = await http.get(url);
  var data = jsonDecode(response.body);
  return data;
}


