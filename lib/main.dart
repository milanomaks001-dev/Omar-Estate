import 'package:flutter/material.dart';

void main() {
  runApp(const OmarEstateApp());
}

Map<String, Map<String, String>> translations = {
  'ru': {
    'app_name': 'Омар Эстейт',
    'welcome': 'Добро пожаловать!',
    'enter_phone': 'Войдите по номеру телефона',
    'phone': 'Номер телефона',
    'login': 'Войти',
    'guest': 'Как гость',
    'promo': 'Есть промо-код?',
    'home': 'Главная',
    'favorites': 'Избранное',
    'profile': 'Профиль',
    'add': '+ Добавить',
    'city': 'Город',
    'deal_type': 'Тип сделки',
    'prop_type': 'Тип недвижимости',
    'my_ads': 'Мои объявления',
    'logout': 'Выйти',
    'publish': 'Опубликовать',
    'title': 'Заголовок',
    'price': 'Цена (сомони)',
    'phone_contact': 'Контактный телефон',
    'description': 'Описание',
  },
  'tj': {
    'app_name': 'Омар Эстейт',
    'welcome': 'Хуш омадед!',
    'enter_phone': 'Рақами телефонатонро ворид кунед',
    'phone': 'Рақами телефон',
    'login': 'Даромадан',
    'guest': 'Ҳамчун меҳмон',
    'promo': 'Промо-код доред?',
    'home': 'Асосӣ',
    'favorites': 'Дӯстдоштахо',
    'profile': 'Профил',
    'add': '+ Илова кардан',
    'city': 'Шаҳр',
    'deal_type': 'Намуди муомила',
    'prop_type': 'Намуди амвол',
    'my_ads': 'Эълонҳои ман',
    'logout': 'Баромадан',
    'publish': 'Нашр кардан',
    'title': 'Сарлавҳа',
    'price': 'Нарх (сомонӣ)',
    'phone_contact': 'Телефони тамос',
    'description': 'Тавсиф',
  },
};

String currentLang = 'ru';
String t(String key) => translations[currentLang]?[key] ?? key;

const List<String> tajikCities = [
  'Душанбе','Худжанд','Бохтар','Куляб','Канибадам',
  'Пенджикент','Хорог','Турсунзаде','Гиссар','Рогун',
];

const List<String> propertyTypes = [
  'Квартира','Дом','Офис','Магазин','Земля','Новостройка',
];

const Color primaryColor = Color(0xFF1A237E);

class OmarEstateApp extends StatelessWidget {
  const OmarEstateApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Omar Estate',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: primaryColor),
      ),
      home: const SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      if (mounted) {
        Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (_) => const LoginScreen()));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF0D1B6E), Color(0xFF3949AB)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 60,
                backgroundColor: Colors.white,
                child: Text('OMAR', style: TextStyle(
                  fontSize: 22, fontWeight: FontWeight.bold,
                  color: primaryColor)),
              ),
              SizedBox(height: 24),
              Text('OMAR ESTATE', style: TextStyle(
                fontSize: 28, fontWeight: FontWeight.bold,
                color: Colors.white, letterSpacing: 4)),
              SizedBox(height: 8),
              Text('Бо Ақл Биёв! 🏠',
                style: TextStyle(fontSize: 16, color: Colors.white70)),
            ],
          ),
        ),
      ),
    );
  }
}

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF0D1B6E), Color(0xFF3949AB)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _langBtn('RU', 'ru'),
                    const SizedBox(width: 12),
                    _langBtn('ТЧ', 'tj'),
                  ],
                ),
                const SizedBox(height: 32),
                const CircleAvatar(
                  radius: 50,
                  backgroundColor: Colors.white,
                  child: Text('OMAR', style: TextStyle(
                    fontSize: 18, fontWeight: FontWeight.bold,
                    color: primaryColor)),
                ),
                const SizedBox(height: 24),
                Text(t('welcome'), style: const TextStyle(
                  fontSize: 28, fontWeight: FontWeight.bold,
                  color: Colors.white)),
                const SizedBox(height: 8),
                Text(t('enter_phone'),
                  style: const TextStyle(color: Colors.white70)),
                const SizedBox(height: 32),
                TextField(
                  controller: _phoneController,
                  keyboardType: TextInputType.phone,
                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    labelText: t('phone'),
                    labelStyle: const TextStyle(color: Colors.white70),
                    prefixIcon: const Icon(Icons.phone, color: Colors.white70),
                    hintText: '+992 XXX XX XX XX',
                    hintStyle: const TextStyle(color: Colors.white38),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(color: Colors.white30)),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(color: Colors.white)),
                  ),
                ),
                const SizedBox(height: 16),
                TextButton(onPressed: () {},
                  child: Text(t('promo'),
                    style: const TextStyle(color: Colors.white70))),
                const SizedBox(height: 16),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () => Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (_) => const HomeScreen())),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12))),
                    child: Text(t('login'), style: const TextStyle(
                      color: primaryColor, fontWeight: FontWeight.bold,
                      fontSize: 16)),
                  ),
                ),
                const SizedBox(height: 12),
                TextButton(
                  onPressed: () => Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (_) => const HomeScreen())),
                  child: Text(t('guest'),
                    style: const TextStyle(color: Colors.white60))),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _langBtn(String label, String code) {
    bool active = currentLang == code;
    return GestureDetector(
      onTap: () => setState(() => currentLang = code),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        decoration: BoxDecoration(
          color: active ? Colors.white : Colors.transparent,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.white)),
        child: Text(label, style: TextStyle(
          color: active ? primaryColor : Colors.white,
          fontWeight: FontWeight.bold)),
      ),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  String? _selectedCity;
  String? _selectedDeal;
  String? _selectedType;

  final List<Map<String, dynamic>> _properties = [
    {'title': 'Новостройка 1 комн.', 'city': 'Душанбе', 'price': '380,000', 'type': 'Новостройка', 'deal': 'Продажа', 'isVip': true},
    {'title': 'Земельный участок', 'city': 'Турсунзаде', 'price': '120,000', 'type': 'Земля', 'deal': 'Продажа', 'isVip': false},
    {'title': 'Гостиница', 'city': 'Душанбе', 'price': '2,500,000', 'type': 'Гостиница', 'deal': 'Продажа', 'isVip': false},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: Text(t('app_name'), style: const TextStyle(
          color: Colors.white, fontWeight: FontWeight.bold)),
        actions: [
          IconButton(icon: const Icon(Icons.language, color: Colors.white),
            onPressed: () => setState(() {
              currentLang = currentLang == 'ru' ? 'tj' : 'ru';
            })),
        ],
      ),
      body: Column(children: [
        Container(
          color: Colors.white,
          padding: const EdgeInsets.all(12),
          child: Column(children: [
            Row(children: [
              Expanded(child: _drop(tajikCities, t('city'),
                _selectedCity, (v) => setState(() => _selectedCity = v))),
              const SizedBox(width: 8),
              Expanded(child: _drop(['Продажа','Аренда'],
                t('deal_type'), _selectedDeal,
                (v) => setState(() => _selectedDeal = v))),
              IconButton(icon: const Icon(Icons.clear),
                onPressed: () => setState(() {
                  _selectedCity = null;
                  _selectedDeal = null;
                  _selectedType = null;
                })),
            ]),
            const SizedBox(height: 8),
            _drop(propertyTypes, t('prop_type'), _selectedType,
              (v) => setState(() => _selectedType = v)),
          ]),
        ),
        Expanded(
          child: ListView.builder(
            padding: const EdgeInsets.all(12),
            itemCount: _properties.length,
            itemBuilder: (ctx, i) => _card(_properties[i]),
          ),
        ),
      ]),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => Navigator.push(context,
          MaterialPageRoute(builder: (_) => const AddPropertyScreen())),
        backgroundColor: primaryColor,
        icon: const Icon(Icons.add, color: Colors.white),
        label: Text(t('add'), style: const TextStyle(color: Colors.white)),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        selectedItemColor: primaryColor,
        onTap: (i) {
          setState(() => _currentIndex = i);
          if (i == 2) Navigator.push(context,
            MaterialPageRoute(builder: (_) => const ProfileScreen()));
        },
        items: [
          BottomNavigationBarItem(icon: const Icon(Icons.home), label: t('home')),
          BottomNavigationBarItem(icon: const Icon(Icons.favorite), label: t('favorites')),
          BottomNavigationBarItem(icon: const Icon(Icons.person), label: t('profile')),
        ],
      ),
    );
  }

  Widget _card(Map<String, dynamic> p) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Stack(children: [
          Container(height: 160,
            decoration: const BoxDecoration(
              color: Color(0xFFE8EAF6),
              borderRadius: BorderRadius.vertical(top: Radius.circular(12))),
            child: const Center(child: Icon(Icons.home, size: 60, color: primaryColor))),
          if (p['isVip'] == true)
            Positioned(top: 8, left: 8,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(color: primaryColor,
                  borderRadius: BorderRadius.circular(8)),
                child: const Text('🔥 VIP', style: TextStyle(
                  color: Colors.white, fontWeight: FontWeight.bold)))),
          Positioned(top: 8, right: 8,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(color: Colors.white,
                borderRadius: BorderRadius.circular(8)),
              child: Text(p['deal'],
                style: const TextStyle(fontWeight: FontWeight.bold)))),
        ]),
        Padding(padding: const EdgeInsets.all(12),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(p['title'], style: const TextStyle(
              fontWeight: FontWeight.bold, fontSize: 16)),
            const SizedBox(height: 4),
            Row(children: [
              const Icon(Icons.location_on, size: 14, color: Colors.grey),
              Text(p['city'], style: const TextStyle(color: Colors.grey)),
            ]),
            const SizedBox(height: 8),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Text('${p['price']} сом', style: const TextStyle(
                color: primaryColor, fontWeight: FontWeight.bold, fontSize: 16)),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(8)),
                child: Text(p['type'], style: const TextStyle(fontSize: 12))),
            ]),
          ])),
      ]),
    );
  }

  Widget _drop(List<String> items, String hint, String? value,
      ValueChanged<String?> onChanged) {
    return DropdownButtonFormField<String>(
      value: value,
      hint: Text(hint, style: const TextStyle(fontSize: 13)),
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8))),
      items: items.map((e) => DropdownMenuItem(
        value: e, child: Text(e, style: const TextStyle(fontSize: 13)))).toList(),
      onChanged: onChanged,
    );
  }
}

class AddPropertyScreen extends StatefulWidget {
  const AddPropertyScreen({super.key});
  @override
  State<AddPropertyScreen> createState() => _AddPropertyScreenState();
}

class _AddPropertyScreenState extends State<AddPropertyScreen> {
  final _titleController = TextEditingController();
  final _priceController = TextEditingController();
  final _phoneController = TextEditingController();
  final _descController = TextEditingController();
  String? _selectedCity;
  String? _selectedType;
  String? _selectedDeal;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: Text(t('add'), style: const TextStyle(color: Colors.white)),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(children: [
          _tf(_titleController, t('title'), Icons.title),
          const SizedBox(height: 12),
          _tf(_priceController, t('price'), Icons.monetization_on, isNumber: true),
          const SizedBox(height: 12),
          _tf(_phoneController, t('phone_contact'), Icons.phone, isNumber: true),
          const SizedBox(height: 12),
          _drop(tajikCities, t('city'), _selectedCity,
            (v) => setState(() => _selectedCity = v)),
          const SizedBox(height: 12),
          _drop(propertyTypes, t('prop_type'), _selectedType,
            (v) => setState(() => _selectedType = v)),
          const SizedBox(height: 12),
          _drop(['Продажа','Аренда'], t('deal_type'), _selectedDeal,
            (v) => setState(() => _selectedDeal = v)),
          const SizedBox(height: 12),
          _tf(_descController, t('description'), Icons.description, maxLines: 4),
          const SizedBox(height: 24),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('✅ Объявление сохранено!'),
                    backgroundColor: Colors.green));
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: primaryColor,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12))),
              child: Text(t('publish'), style: const TextStyle(
                color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
            ),
          ),
        ]),
      ),
    );
  }

  Widget _tf(TextEditingController ctrl, String label, IconData icon,
      {bool isNumber = false, int maxLines = 1}) {
    return TextField(
      controller: ctrl,
      keyboardType: isNumber ? TextInputType.number : TextInputType.text,
      maxLines: maxLines,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12))),
    );
  }

  Widget _drop(List<String> items, String hint, String? value,
      ValueChanged<String?> onChanged) {
    return DropdownButtonFormField<String>(
      value: value, hint: Text(hint),
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12))),
      items: items.map((e) => DropdownMenuItem(
        value: e, child: Text(e))).toList(),
      onChanged: onChanged,
    );
  }
}

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: Text(t('profile'), style: const TextStyle(color: Colors.white)),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: ListView(padding: const EdgeInsets.all(16), children: [
        const CircleAvatar(radius: 50, backgroundColor: primaryColor,
          child: Icon(Icons.person, size: 50, color: Colors.white)),
        const SizedBox(height: 16),
        const Center(child: Text('+992 900 00 00 00',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold))),
        const SizedBox(height: 24),
        ListTile(leading: const Icon(Icons.home, color: primaryColor),
          title: Text(t('my_ads')),
          trailing: const Icon(Icons.chevron_right), onTap: () {}),
        const ListTile(leading: Icon(Icons.star, color: primaryColor),
          title: Text('VIP & PREMIUM'),
          trailing: Icon(Icons.chevron_right)),
        const ListTile(leading: Icon(Icons.card_giftcard, color: primaryColor),
          title: Text('Промо-коды'),
          trailing: Icon(Icons.chevron_right)),
        const SizedBox(height: 24),
        ElevatedButton(
          onPressed: () => Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (_) => const LoginScreen())),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.red,
            padding: const EdgeInsets.symmetric(vertical: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12))),
          child: Text(t('logout'), style: const TextStyle(
            color: Colors.white, fontSize: 16)),
        ),
      ]),
    );
  }
}
