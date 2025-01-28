// // frontend/lib/components/common_button.dart
// import 'package:jaspr/jaspr.dart';

// class CommonButton extends StatelessComponent {
//   final String label;
//   final Function()? onPressed;

//   const CommonButton({super.key, required this.label, this.onPressed});

//   @override
//   Iterable<Component> build(BuildContext context) sync* {
//     yield DomComponent(
//       tag: 'button',
//       styles: Styles({
//         'padding': '8px 16px',
//         'backgroundColor': '#007BFF',
//         'color': '#ffffff',
//         'border': 'none',
//         'borderRadius': '4px',
//         'cursor': 'pointer',
//       }),
//       events: {
//         'onClick': (event) => onPressed?.call(),
//       },
//       child: Text(label),
//     );
//   }
// }
