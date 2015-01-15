//// Copyright (c) 2015, <your name>. All rights reserved. Use of this source code
//// is governed by a BSD-style license that can be found in the LICENSE file.
//
//import 'package:http_server/http_server.dart';
//import 'dart:io';
//import 'package:appengine/appengine.dart';
//import 'package:path/path.dart';
//
//main() {
//  
//  //AppEngine start
//  
//  var pathToBuild = join(dirname(Platform.script.resolve('../build').toFilePath())); // /home/oking/dart/TypeTest/build/web/index.html /home/oking/dart/TypeTest/packages/core_elements
//
//  var staticFiles = new VirtualDirectory(pathToBuild);
//  print('Hello');
//  staticFiles.allowDirectoryListing = true;
//  staticFiles.jailRoot = false;
//  staticFiles.directoryHandler = (dir, request) {
//  var indexUri = new Uri.file(dir.path).resolve('web/index.html');
//    staticFiles.serveFile(new File(indexUri.toFilePath()), request);
//
//  };
////  HttpServer.bind(InternetAddress.sLOOPBACK_IP_V4, 7788).then((server) {
////  server.listen((HttpRequest req) {
////    File file = new File('/web/index.html');
////    print(file.existsSync().toString());
////    file.exists().then((bool found) {
////      if (found) {
////        file.openRead()
////            .pipe(req.response)  // HttpResponse type.
////            .catchError((e) => print(e.toString()));
////      } else {
////        req.response.statusCode = HttpStatus.NOT_FOUND;
////        req.response.close();
////      }
////    });
////  });
////});
////  
//
//  runAppEngine((HttpRequest request) {
//      //request.response.write(staticFiles.root);d
//      staticFiles.serveRequest(request);
//  
//    });
//  
//  // AppEngine Finish
//  
//  
//  
////  var staticfiles = new VirtualDirectory('')
////        ..allowDirectoryListing;
//// 
////
////  
////      HttpServer.bind(InternetAddress.LOOPBACK_IP_V4, 7788).then((server) {
////        print('Server on 7788 running!');
////        server.listen((request) { staticfiles.serveFile(new File('index.html'), request); }); 
////      });
//
//  
//  //void requestHandler(HttpRequest request){
//    //request.response.redirect(Uri.parse('/index.html'));
//  //context.assets.serve();
//  
////  var pathToBuild = join(dirname(Platform.script.resolve('../web').toFilePath()));
////  print(pathToBuild.toString());
////
////  var staticFiles = new VirtualDirectory(pathToBuild);
////  staticFiles.allowDirectoryListing = true;
////  staticFiles.directoryHandler = (dir, request) {
////  var indexUri = new Uri.file(dir.path).resolve('web/index.html');
////  staticFiles.serveFile(new File(indexUri.toFilePath()), request);
////   };
////
////  HttpServer.bind(InternetAddress.LOOPBACK_IP_V4, 7788).then((server) {
////  server.listen(staticFiles.serveRequest);
////  });
//  
//
//}
