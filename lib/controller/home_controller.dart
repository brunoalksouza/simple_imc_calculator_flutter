import 'package:rx_notifier/rx_notifier.dart';

class HomeController {
  double _peso = 0.0;
  double _altura = 0.0;

  void setAltura(String value) =>
      _altura = (double.tryParse(value) ?? 0.0) / 100;

  void setPeso(String value) => _peso = double.tryParse(value) ?? 0.0;

  final _result = RxNotifier<String>('');
  String get result => _result.value;

  var imcText = 0;

  void calculateIMC() {
    final imcValue = _peso / (_altura * _altura);
    final imcText = imcValue.toStringAsFixed(2);
    if (imcValue < 18.5) {
      _result.value = 'IMC: $imcText - Abaixo do peso';
    } else if (imcValue >= 18.5 && imcValue < 25) {
      _result.value = 'IMC: $imcText - Peso normal';
    } else {
      _result.value = 'IMC: $imcText - Acima do peso';
    }
  }
}
