// The entrypoint for the **server** environment.
//
// The [main] method will only be executed on the server during pre-rendering.
// To run code on the client, use the @client annotation.

// Server-specific jaspr import.
import 'package:jaspr/server.dart';

// Imports the [App] component.
import 'app.dart';


// This file is generated automatically by Jaspr, do not remove or edit.
import 'jaspr_options.dart';

void main() {
  // Initializes the server environment with the generated default options.
  Jaspr.initializeApp(
    options: defaultJasprOptions,
  );

  // Starts the app.
  //
  // [Document] renders the root document structure (<html>, <head> and <body>)
  // with the provided parameters and components.
  runApp(Document(
    title: 'frontend',
    styles: [
      // Special import rule to include to another css file.
      css.import('https://fonts.googleapis.com/css?family=Roboto'),
      // Each style rule takes a valid css selector and a set of styles.
      // Styles are defined using type-safe css bindings and can be freely chained and nested.
      css('html, body')
          .text(fontFamily: const FontFamily.list([FontFamily('Roboto'), FontFamilies.sansSerif]))
          .box(width: 100.percent, minHeight: 100.vh)
          .box(margin: EdgeInsets.zero, padding: EdgeInsets.zero),
      css('h1').text(fontSize: 4.rem).box(margin: EdgeInsets.unset),
      css.import('/styles/login.css'),
      css.import('/styles/admin-layout.css'),
      css.import('/styles/navbar.css'),
      css.import('/styles/sidebar.css'),
      css.import('/styles/dashboard.css'),
      css.import('/styles/informasi.css'),
      css.import('/styles/formulir.css'),
      css.import('/styles/member.css'),
      css.import('/styles/broadcast.css'),
      css.import('/styles/sales.css'),
      css.import('/styles/database.css'),
      css.import('/styles/mobile-member.css'),
      css.import('/styles/mobile-member-profile.css'),
      // css.import('/styles/mobile-sales.css'),
      css.import('/styles/mobile-sales-info.css'),
      css.import('/styles/mobile-sales-profile.css'),
      css.import('https://cdnjs.cloudflare.com/ajax/libs/Chart.js/3.7.1/chart.min.css'),
      css.import('https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css'),
      
    ],
    head: [
        // Tambahkan elemen <link> atau <script> di sini
        DomComponent(
          tag: 'meta',
          attributes: {'name': 'viewport', 'content': 'width=device-width, initial-scale=1'},
        ),
        DomComponent(
          tag: 'script',
          attributes: {'src': 'https://cdn.jsdelivr.net/npm/chart.js'},
        ),
        
      ],
    
    body: App(),
  ));


}
