import 'package:flutter/material.dart';

class DressCodeDetailDialog extends StatelessWidget {
  final String dressCode;
  const DressCodeDetailDialog({super.key, required this.dressCode});

  String _getDressCodeDescription(String code) {
    switch (code.toLowerCase()) {
      case 'smart casual':
        return 'Smart casual — это элегантный, но неформальный стиль. Сочетает в себе комфорт и деловой вид. Например, брюки чинос, рубашка или блузка, пиджак и аккуратная обувь.';
      case 'black tie':
        return 'Black Tie (Черный галстук) — это полуофициальный дресс-код, обычно для вечерних мероприятий. Для мужчин — смокинг, белая рубашка, черный галстук-бабочка. Для женщин — вечернее платье длиной до колена или в пол.';
      case 'cocktail':
        return 'Cocktail — это элегантный и праздничный стиль, подходящий для вечеринок и приемов. Для мужчин — темный костюм с галстуком. Для женщин — коктейльное платье, чуть выше или ниже колена.';
      default:
        return 'Подробное описание для дресс-кода "$code" пока отсутствует.';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: Container(
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                icon: const Icon(Icons.close, color: Color(0xFF3D3632)),
                onPressed: () => Navigator.of(context).pop(),
              ),
            ),
            Text(
              'Дресс-код: ${dressCode}',
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Color(0xFF3D3632)),
            ),
            const SizedBox(height: 16),
            Text(
              _getDressCodeDescription(dressCode),
              style: TextStyle(fontSize: 16, color: Colors.grey[700], height: 1.5),
            ),
          ],
        ),
      ),
    );
  }
}
