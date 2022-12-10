# url_textformfield
Textformfield designed for inputing urls, with options to add leading and trailing text, appended at begining and end of input

## Getting Started

Add this to your package's `pubspec.yaml` file

```yaml

dependencies:
  url_textformfield: ^0.0.3
```

## Usage

First, you just have to import the package using:

```dart
import 'package:url_textformfield/url_textformfield.dart';
```

Then , use the widget as below, 


```dart

  @override
  Widget build(BuildContext context) {
    return UrlTextFormField(
      focusNode: ctrlFocusNode,  
      padding: const EdgeInsets.all(10),
      onChanged: (val) {},
      leadingText: 'https://',
      suffixIcon: const Icon(
        Icons.check,
        color: Colors.green,
      ),
      trailingText: ".com",
    );
```

## Example
![screenshot](https://user-images.githubusercontent.com/75713903/206829462-a1b307c9-3970-4c26-84a0-b79aee4d0737.jpeg)


## Contributing
Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.
