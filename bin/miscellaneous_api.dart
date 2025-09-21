import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart';
import 'package:shelf_router/shelf_router.dart';


void main(List<String> args) async {
  final router = Router();

  router.get("/", (Request req) {
    return Response.ok("hi");
  });

  final server = await serve(router, "localhost", 8000);
}