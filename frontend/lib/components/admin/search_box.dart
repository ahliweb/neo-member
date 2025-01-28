import 'package:jaspr/jaspr.dart';

typedef SearchCallback = void Function(String query);

class SearchBoxComponent extends StatefulComponent {
  final SearchCallback onSearch;

  const SearchBoxComponent({required this.onSearch, super.key});

  @override
  State<SearchBoxComponent> createState() => _SearchBoxComponentState();
}

class _SearchBoxComponentState extends State<SearchBoxComponent> {
  String query = '';

  void handleSearch(dynamic value) {
    setState(() {
      query = value;
    });
    component.onSearch(value);
  }

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield div(classes: 'search-bar', [
      input(
        [],
        onInput: handleSearch,
        attributes: {'placeholder': 'Search...'},
      ),
    ]);
  }
}
