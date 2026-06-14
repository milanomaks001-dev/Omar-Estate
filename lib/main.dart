import 'package:flutter/material.dart';

void main() => runApp(const OmarEstateApp());

String currentLang = 'ru';
String t(String key) => translations[currentLang]?[key] ?? key;

const Map<String, Map<String, String>> translations = {
  'ru': {
    'appName': 'Omar Estate', 'welcome': 'Добро пожаловать!',
    'welcome_sub': 'Войдите по номеру телефона', 'phone': 'Номер телефона',
    'login': 'Войти', 'guest': 'Войти как гость', 'promo': 'Есть промо-код?',
    'city': 'Город', 'type': 'Тип недвижимости', 'deal': 'Тип сделки',
    'add': 'Добавить', 'home': 'Главная', 'favorites': 'Избранное',
    'profile': 'Профиль', 'price': 'Цена (сомони)', 'area': 'Площадь (м²)',
    'publish': 'Опубликовать', 'title_f': 'Заголовок', 'contact': 'Контакт продавца',
    'call': 'Позвонить', 'whatsapp': 'WhatsApp', 'approved': '✅ ИИ одобрил!',
    'problems': 'Найдены проблемы', 'fix': 'Исправить', 'logout': 'Выйти',
    'my_ads': 'Мои объявления', 'settings': 'Настройки', 'help': 'Помощь',
    'vip_btn': '🔥 VIP - 5 сомони/7 дней', 'premium_btn': '⭐ PREMIUM - 15 сомони/30 дней',
    'slogan': 'Бо Ақл Биёв! 🏠', 'slogan2': 'Найди дом своей мечты!',
    'nothing': 'Ничего не найдено', 'add_photo': 'Добавить фото',
    'sale': 'Продажа', 'rent': 'Аренда', 'daily': 'Суточная аренда',
    'ai_info': 'ИИ автоматически проверит объявление', 'pay': 'Оплатить',
    'cancel': 'Отмена', 'promos': 'Промо-коды',
  },
  'tj': {
    'appName': 'Омар Эстейт', 'welcome': 'Хуш омадед!',
    'welcome_sub': 'Рақами телефонатонро ворид кунед', 'phone': 'Рақами телефон',
    'login': 'Даромадан', 'guest': 'Ҳамчун меҳмон', 'promo': 'Промо-код доред?',
    'city': 'Шаҳр', 'type': 'Намуди амвол', 'deal': 'Намуди муомила',
    'add': 'Илова кардан', 'home': 'Асосӣ', 'favorites': 'Дӯстдоштаҳо',
    'profile': 'Профил', 'price': 'Нарх (сомонӣ)', 'area': 'Майдон (м²)',
    'publish': 'Нашр кардан', 'title_f': 'Сарлавҳа', 'contact': 'Алоқаи фурӯшанда',
    'call': 'Занг задан', 'whatsapp': 'WhatsApp', 'approved': '✅ ИИ тасдиқ кард!',
    'problems': 'Мушкилот ёфт шуд', 'fix': 'Ислоҳ кардан', 'logout': 'Баромадан',
    'my_ads': 'Эълонҳои ман', 'settings': 'Танзимот', 'help': 'Кӯмак',
    'vip_btn': '🔥 VIP - 5 сомонӣ/7 рӯз', 'premium_btn': '⭐ PREMIUM - 15 сомонӣ/30 рӯз',
    'slogan': 'Бо Ақл Биёв! 🏠', 'slogan2': 'Хонаи орзуятро ёб!',
    'nothing': 'Ягон чиз ёфт нашуд', 'add_photo': 'Акс илова кунед',
    'sale': 'Фурӯш', 'rent': 'Иҷора', 'daily': 'Рӯзона',
    'ai_info': 'ИИ эълонро санҷида мебарояд', 'pay': 'Пардохтан',
    'cancel': 'Бекор кардан', 'promos': 'Промо-коҳо',
  },
};

const List<String> tajikCities = [
  'Душанбе','Худжанд','Бохтар','Куляб','Истаравшан','Канибадам',
  'Пенджикент','Хорог','Турсунзаде','Вахдат','Гиссар','Рогун',
  'Исфара','Варзоб','Рашт','Нурабад','Файзабад','Шахринав',
  'Рудаки','Вахш','Муминабад','Темурмалик','Ховалинг','Шаартуз',
  'Хамадони','Фархор','Яван','Ванч','Ишкашим','Мургаб',
  'Рошткала','Рушан','Шугнан','Дарваз',
];

const List<String> propertyTypes = [
  'Квартира','Дом','Офис','Магазин','Участок','Новостройка',
  'Дача','Гараж','Склад','Гостиница','Производство','Земля',
];

const List<String> dealTypes = [
  'Продажа','Аренда','Суточная аренда',
  'Долгосрочная аренда','Обмен','Совместная аренда',
];

class Property {
  final String title, location, price, area, type, phone, deal;
  final bool isVip, isPremium;
  const Property({
    required this.title, required this.location, required this.price,
    required this.area, required this.type, required this.phone,
    this.deal = 'Продажа', this.isVip = false, this.isPremium = false,
  });
}

final List<Property> sampleProperties = [
  const Property(title:'3-комнатная квартира',location:'Душанбе, район Сино',price:'650,000',area:'85 м²',type:'Квартира',phone:'+992 900 12 34 56',deal:'Продажа',isPremium:true),
  const Property(title:'2-комнатная квартира',location:'Душанбе, Рудаки',price:'2,500',area:'65 м²',type:'Квартира',phone:'+992 900 23 45 67',deal:'Аренда',isVip:true),
  const Property(title:'Дом с участком',location:'Гиссар',price:'1,200,000',area:'200 м²',type:'Дом',phone:'+992 900 34 56 78',deal:'Продажа'),
  const Property(title:'Офис в центре',location:'Душанбе, центр',price:'5,000',area:'120 м²',type:'Офис',phone:'+992 900 45 67 89',deal:'Аренда'),
  const Property(title:'Квартира посуточно',location:'Душанбе, Исмоили Сомони',price:'150',area:'45 м²',type:'Квартира',phone:'+992 900 56 78 90',deal:'Суточная аренда'),
  const Property(title:'Дача в Варзобе',location:'Варзоб',price:'450,000',area:'300 м²',type:'Дача',phone:'+992 900 67 89 01',deal:'Продажа'),
  const Property(title:'Склад',location:'Бохтар',price:'3,500',area:'500 м²',type:'Склад',phone:'+992 900 78 90 12',deal:'Аренда'),
  const Property(title:'Гостиница',location:'Худжанд',price:'2,500,000',area:'800 м²',type:'Гостиница',phone:'+992 900 89 01 23',deal:'Продажа'),
  const Property(title:'Земельный участок',location:'Турсунзаде',price:'120,000',area:'10 сотка',type:'Земля',phone:'+992 900 90 12 34',deal:'Продажа'),
  const Property(title:'Новостройка 1 комн.',location:'Душанбе, Шохмансур',price:'380,000',area:'42 м²',type:'Новостройка',phone:'+992 900 01 23 45',deal:'Продажа',isVip:true),
];

// ===== APP =====
class OmarEstateApp extends StatefulWidget {
  const OmarEstateApp({super.key});
  static _OmarEstateAppState? of(BuildContext context) =>
      context.findAncestorStateOfType<_OmarEstateAppState>();
  @override
  State<OmarEstateApp> createState() => _OmarEstateAppState();
}

class _OmarEstateAppState extends State<OmarEstateApp> {
  void setLanguage(String l) => setState(() { currentLang = l; });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Omar Estate',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF1A237E)),
        useMaterial3: true,
      ),
      home: const SplashScreen(),
    );
  }
}

// ===== SPLASH =====
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (_) => const LoginScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft, end: Alignment.bottomRight,
            colors: [Color(0xFF1A237E), Color(0xFF1565C0)],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CircleAvatar(radius: 70, backgroundColor: Colors.white,
                child: Text('OMAR', style: TextStyle(fontSize: 26,
                    fontWeight: FontWeight.bold, color: Color(0xFF1A237E)))),
              const SizedBox(height: 24),
              const Text('OMAR ESTATE', style: TextStyle(fontSize: 30,
                  fontWeight: FontWeight.bold, color: Colors.white, letterSpacing: 3)),
              const SizedBox(height: 8),
              Text(t('slogan'), style: const TextStyle(fontSize: 18, color: Colors.white70)),
              const SizedBox(height: 4),
              Text(t('slogan2'), style: const TextStyle(fontSize: 14, color: Colors.white60)),
            ],
          ),
        ),
      ),
    );
  }
}

// ===== LOGIN =====
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _phoneController = TextEditingController();
  final _promoController = TextEditingController();
  bool _showPromo = false;

  void _switchLang(String l) {
    setState(() { currentLang = l; });
    OmarEstateApp.of(context)?.setLanguage(l);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter, end: Alignment.bottomCenter,
            colors: [Color(0xFF1A237E), Color(0xFF1565C0)],
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: Column(
              children: [
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _langBtn('RU', 'ru'),
                    const SizedBox(width: 8),
                    _langBtn('ТЧ', 'tj'),
                  ],
                ),
                const SizedBox(height: 32),
                const CircleAvatar(radius: 55, backgroundColor: Colors.white,
                  child: Text('OMAR', style: TextStyle(fontSize: 22,
                      fontWeight: FontWeight.bold, color: Color(0xFF1A237E)))),
                const SizedBox(height: 24),
                Text(t('welcome'), style: const TextStyle(fontSize: 26,
                    fontWeight: FontWeight.bold, color: Colors.white)),
                const SizedBox(height: 8),
                Text(t('welcome_sub'), style: const TextStyle(fontSize: 14, color: Colors.white70)),
                const SizedBox(height: 32),
                _buildTF(_phoneController, t('phone'), Icons.phone, TextInputType.phone, '+992 XXX XX XX XX'),
                const SizedBox(height: 12),
                if (_showPromo) ...[
                  _buildTF(_promoController, 'Промо-код', Icons.card_giftcard, TextInputType.text, null),
                  const SizedBox(height: 8),
                ],
                TextButton(
                  onPressed: () => setState(() => _showPromo = !_showPromo),
                  child: Text(t('promo'), style: const TextStyle(color: Colors.white70)),
                ),
                const SizedBox(height: 16),
                SizedBox(width: double.infinity, height: 50,
                  child: ElevatedButton(
                    onPressed: () => Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (_) => const HomeScreen())),
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.white,
                        foregroundColor: const Color(0xFF1A237E),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
                    child: Text(t('login'), style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  ),
                ),
                const SizedBox(height: 12),
                TextButton(
                  onPressed: () => Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (_) => const HomeScreen())),
                  child: Text(t('guest'), style: const TextStyle(color: Colors.white70)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _langBtn(String label, String lang) {
    final active = currentLang == lang;
    return GestureDetector(
      onTap: () => _switchLang(lang),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        decoration: BoxDecoration(
          color: active ? Colors.white : Colors.transparent,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.white),
        ),
        child: Text(label, style: TextStyle(
            color: active ? const Color(0xFF1A237E) : Colors.white,
            fontWeight: FontWeight.bold)),
      ),
    );
  }

  Widget _buildTF(TextEditingController ctrl, String label, IconData icon,
      TextInputType type, String? hint) {
    return TextField(
      controller: ctrl, keyboardType: type,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        labelText: label, labelStyle: const TextStyle(color: Colors.white70),
        hintText: hint, hintStyle: const TextStyle(color: Colors.white38),
        prefixIcon: Icon(icon, color: Colors.white70),
        enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: Colors.white38)),
        focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: Colors.white)),
      ),
    );
  }
}

// ===== HOME =====
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _idx = 0;
  String? _city, _type, _deal;

  List<Property> get filtered {
    final list = sampleProperties.where((p) {
      if (_city != null && !p.location.contains(_city!)) return false;
      if (_type != null && p.type != _type) return false;
      if (_deal != null && p.deal != _deal) return false;
      return true;
    }).toList();
    list.sort((a, b) {
      if (a.isPremium && !b.isPremium) return -1;
      if (a.isVip && !b.isVip) return -1;
      return 0;
    });
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(t('appName'), style: const TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: const Color(0xFF1A237E),
        foregroundColor: Colors.white,
        actions: [
          IconButton(icon: const Icon(Icons.search), onPressed: () {}),
          PopupMenuButton<String>(
            icon: const Icon(Icons.language, color: Colors.white),
            onSelected: (l) => setState(() { currentLang = l; }),
            itemBuilder: (_) => [
              const PopupMenuItem(value: 'ru', child: Text('Русский')),
              const PopupMenuItem(value: 'tj', child: Text('Тоҷикӣ')),
            ],
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            color: const Color(0xFF1A237E).withOpacity(0.05),
            padding: const EdgeInsets.all(8),
            child: Column(
              children: [
                Row(children: [
                  Expanded(child: _dropdown(tajikCities, _city, t('city'), (v) => setState(() => _city = v))),
                  const SizedBox(width: 6),
                  Expanded(child: _dropdown(dealTypes, _deal, t('deal'), (v) => setState(() => _deal = v))),
                  IconButton(
                    icon: const Icon(Icons.clear, color: Color(0xFF1A237E)),
                    onPressed: () => setState(() { _city = null; _type = null; _deal = null; }),
                  ),
                ]),
                const SizedBox(height: 6),
                _dropdown(propertyTypes, _type, t('type'), (v) => setState(() => _type = v)),
              ],
            ),
          ),
          Expanded(
            child: filtered.isEmpty
                ? Center(child: Text(t('nothing')))
                : ListView.builder(
                    padding: const EdgeInsets.all(12),
                    itemCount: filtered.length,
                    itemBuilder: (ctx, i) => _card(filtered[i]),
                  ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => Navigator.push(context,
            MaterialPageRoute(builder: (_) => const AddPropertyScreen())),
        backgroundColor: const Color(0xFF1A237E),
        foregroundColor: Colors.white,
        icon: const Icon(Icons.add),
        label: Text(t('add')),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _idx,
        selectedItemColor: const Color(0xFF1A237E),
        onTap: (i) {
          setState(() => _idx = i);
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

  Widget _dropdown(List<String> items, String? value, String hint, Function(String?) onChanged) {
    return DropdownButtonFormField<String>(
      value: value, hint: Text(hint, style: const TextStyle(fontSize: 12)),
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
        isDense: true,
      ),
      items: items.map((e) => DropdownMenuItem(value: e, child: Text(e, style: const TextStyle(fontSize: 12)))).toList(),
      onChanged: onChanged,
    );
  }

  Widget _card(Property p) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      elevation: p.isPremium ? 6 : 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: p.isPremium
            ? const BorderSide(color: Colors.amber, width: 2)
            : p.isVip ? const BorderSide(color: Color(0xFF1A237E)) : BorderSide.none,
      ),
      child: InkWell(
        onTap: () => Navigator.push(context,
            MaterialPageRoute(builder: (_) => PropertyDetailScreen(property: p))),
        borderRadius: BorderRadius.circular(12),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Stack(children: [
            Container(height: 140,
              decoration: BoxDecoration(
                color: const Color(0xFF1A237E).withOpacity(0.1),
                borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
              ),
              child: const Center(child: Icon(Icons.home, size: 60, color: Color(0xFF1A237E))),
            ),
            if (p.isPremium) Positioned(top: 8, left: 8,
              child: _badge('⭐ PREMIUM', Colors.amber, Colors.black)),
            if (p.isVip && !p.isPremium) Positioned(top: 8, left: 8,
              child: _badge('🔥 VIP', const Color(0xFF1A237E), Colors.white)),
            Positioned(top: 8, right: 8,
              child: _badge(p.deal, Colors.white, const Color(0xFF1A237E))),
          ]),
          Padding(padding: const EdgeInsets.all(12), child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(p.title, style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
              const SizedBox(height: 4),
              Row(children: [
                const Icon(Icons.location_on, size: 14, color: Colors.grey),
                const SizedBox(width: 2),
                Expanded(child: Text(p.location, style: const TextStyle(fontSize: 13, color: Colors.grey))),
              ]),
              const SizedBox(height: 8),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Text('${p.price} сом', style: const TextStyle(fontSize: 15,
                    fontWeight: FontWeight.bold, color: Color(0xFF1A237E))),
                Container(padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                  decoration: BoxDecoration(color: const Color(0xFF1A237E).withOpacity(0.1),
                      borderRadius: BorderRadius.circular(6)),
                  child: Text(p.type, style: const TextStyle(fontSize: 12, color: Color(0xFF1A237E)))),
              ]),
            ],
          )),
        ]),
      ),
    );
  }

  Widget _badge(String text, Color bg, Color fg) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(color: bg, borderRadius: BorderRadius.circular(8)),
      child: Text(text, style: TextStyle(fontSize: 11, color: fg, fontWeight: FontWeight.bold)),
    );
  }
}

// ===== DETAIL =====
class PropertyDetailScreen extends StatelessWidget {
  final Property property;
  const PropertyDetailScreen({super.key, required this.property});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(property.title),
        backgroundColor: const Color(0xFF1A237E),
        foregroundColor: Colors.white,
        actions: [
          IconButton(icon: const Icon(Icons.favorite_border), onPressed: () {}),
          IconButton(icon: const Icon(Icons.share), onPressed: () {}),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Container(height: 220, color: const Color(0xFF1A237E).withOpacity(0.1),
            child: const Center(child: Icon(Icons.home, size: 80, color: Color(0xFF1A237E)))),
          Padding(padding: const EdgeInsets.all(16), child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (property.isPremium) _statusBadge('⭐ PREMIUM', Colors.amber, Colors.black),
              if (property.isVip) _statusBadge('🔥 VIP', const Color(0xFF1A237E), Colors.white),
              const SizedBox(height: 12),
              Text(property.title, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              Row(children: [
                const Icon(Icons.location_on, color: Color(0xFF1A237E)),
                Text(property.location, style: const TextStyle(fontSize: 15)),
              ]),
              const SizedBox(height: 8),
              Container(padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(color: Colors.green.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(8)),
                child: Text(property.deal, style: const TextStyle(color: Colors.green, fontWeight: FontWeight.bold))),
              const SizedBox(height: 16),
              Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
                _infoBox(t('price'), '${property.price} сом'),
                _infoBox(t('area'), property.area),
                _infoBox(t('type'), property.type),
              ]),
              const SizedBox(height: 24),
              Text(t('contact'), style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              const SizedBox(height: 12),
              Row(children: [
                Expanded(child: ElevatedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.phone),
                  label: Text(t('call')),
                  style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF1A237E),
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
                )),
                const SizedBox(width: 8),
                ElevatedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.chat),
                  label: const Text('WhatsApp'),
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.green,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
                ),
              ]),
              const SizedBox(height: 24),
              const Text('Поднять объявление', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              const SizedBox(height: 12),
              Row(children: [
                Expanded(child: _vipBtn(t('vip_btn'), const Color(0xFF1A237E), context)),
                const SizedBox(width: 8),
                Expanded(child: _vipBtn(t('premium_btn'), Colors.amber.shade700, context)),
              ]),
            ],
          )),
        ]),
      ),
    );
  }

  Widget _statusBadge(String text, Color bg, Color fg) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(color: bg, borderRadius: BorderRadius.circular(8)),
      child: Text(text, style: TextStyle(color: fg, fontWeight: FontWeight.bold)),
    );
  }

  Widget _infoBox(String label, String value) {
    return Container(padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(color: const Color(0xFF1A237E).withOpacity(0.08),
          borderRadius: BorderRadius.circular(10)),
      child: Column(children: [
        Text(label, style: const TextStyle(fontSize: 12, color: Colors.grey)),
        const SizedBox(height: 4),
        Text(value, style: const TextStyle(fontSize: 13, fontWeight: FontWeight.bold)),
      ]),
    );
  }

  Widget _vipBtn(String title, Color color, BuildContext context) {
    return ElevatedButton(
      onPressed: () => showDialog(context: context, builder: (_) => AlertDialog(
        title: Text(title),
        content: Text('${t("pay")} $title?'),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: Text(t('cancel'))),
          ElevatedButton(
            onPressed: () { Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('$title активирован!'), backgroundColor: color));
            },
            style: ElevatedButton.styleFrom(backgroundColor: color),
            child: Text(t('pay'), style: const TextStyle(color: Colors.white)),
          ),
        ],
      )),
      style: ElevatedButton.styleFrom(backgroundColor: color, foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
      child: Text(title, style: const TextStyle(fontSize: 11), textAlign: TextAlign.center),
    );
  }
}

// ===== ADD PROPERTY =====
class AddPropertyScreen extends StatefulWidget {
  const AddPropertyScreen({super.key});
  @override
  State<AddPropertyScreen> createState() => _AddPropertyScreenState();
}

class _AddPropertyScreenState extends State<AddPropertyScreen> {
  final _titleCtrl = TextEditingController();
  final _priceCtrl = TextEditingController();
  final _areaCtrl = TextEditingController();
  final _phoneCtrl = TextEditingController();
  String? _city, _type, _deal;

  Map<String, dynamic> _aiCheck() {
    List<String> w = [];
    final price = int.tryParse(_priceCtrl.text.replaceAll(',', ''));
    if (_titleCtrl.text.length < 5) w.add('⚠️ Заголовок слишком короткий');
    if (price != null && price < 1000) w.add('⚠️ Цена подозрительно низкая');
    if (_phoneCtrl.text.length < 9) w.add('⚠️ Неверный номер телефона');
    if (_city == null) w.add('⚠️ Не выбран город');
    if (_type == null) w.add('⚠️ Не выбран тип');
    if (_deal == null) w.add('⚠️ Не выбран тип сделки');
    return {'ok': w.isEmpty, 'warnings': w};
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(t('add')),
          backgroundColor: const Color(0xFF1A237E), foregroundColor: Colors.white),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(children: [
          GestureDetector(
            onTap: () {},
            child: Container(height: 150, width: double.infinity,
              decoration: BoxDecoration(color: const Color(0xFF1A237E).withOpacity(0.08),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: const Color(0xFF1A237E).withOpacity(0.3))),
              child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                const Icon(Icons.add_photo_alternate, size: 48, color: Color(0xFF1A237E)),
                const SizedBox(height: 8),
                Text(t('add_photo'), style: const TextStyle(color: Color(0xFF1A237E))),
              ]),
            ),
          ),
          const SizedBox(height: 16),
          _tf(_titleCtrl, t('title_f'), Icons.title),
          const SizedBox(height: 12),
          _drop(dealTypes, _deal, t('deal'), (v) => setState(() => _deal = v)),
          const SizedBox(height: 12),
          _drop(propertyTypes, _type, t('type'), (v) => setState(() => _type = v)),
          const SizedBox(height: 12),
          _drop(tajikCities, _city, t('city'), (v) => setState(() => _city = v)),
          const SizedBox(height: 12),
          _tf(_priceCtrl, t('price'), Icons.monetization_on, type: TextInputType.number),
          const SizedBox(height: 12),
          _tf(_areaCtrl, t('area'), Icons.square_foot, type: TextInputType.number),
          const SizedBox(height: 12),
          _tf(_phoneCtrl, t('phone'), Icons.phone, type: TextInputType.phone),
          const SizedBox(height: 16),
          Container(padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(color: const Color(0xFF1A237E).withOpacity(0.05),
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: const Color(0xFF1A237E).withOpacity(0.2))),
            child: Row(children: [
              const Icon(Icons.smart_toy, color: Color(0xFF1A237E)),
              const SizedBox(width: 8),
              Expanded(child: Text(t('ai_info'), style: const TextStyle(fontSize: 12, color: Colors.grey))),
            ]),
          ),
          const SizedBox(height: 16),
          SizedBox(width: double.infinity, height: 50,
            child: ElevatedButton(
              onPressed: () {
                final r = _aiCheck();
                if (r['ok']) {
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(t('approved')), backgroundColor: Colors.green));
                  Navigator.pop(context);
                } else {
                  showDialog(context: context, builder: (_) => AlertDialog(
                    title: Row(children: [
                      const Icon(Icons.smart_toy, color: Color(0xFF1A237E)),
                      const SizedBox(width: 8),
                      const Text('ИИ-Модератор'),
                    ]),
                    content: Column(mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(t('problems')),
                          const SizedBox(height: 8),
                          ...(r['warnings'] as List).map((w) =>
                              Padding(padding: const EdgeInsets.only(bottom: 4),
                                  child: Text(w.toString()))),
                        ]),
                    actions: [TextButton(onPressed: () => Navigator.pop(context),
                        child: Text(t('fix')))],
                  ));
                }
              },
              style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF1A237E),
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
              child: Text(t('publish'), style: const TextStyle(fontSize: 16)),
            ),
          ),
        ]),
      ),
    );
  }

  Widget _tf(TextEditingController ctrl, String label, IconData icon,
      {TextInputType type = TextInputType.text}) {
    return TextField(controller: ctrl, keyboardType: type,
        decoration: InputDecoration(labelText: label, prefixIcon: Icon(icon),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))));
  }

  Widget _drop(List<String> items, String? value, String hint, Function(String?) onChanged) {
    return DropdownButtonFormField<String>(
      value: value, hint: Text(hint),
      decoration: InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
      items: items.map((e) => DropdownMenuItem(value: e, child: Text(e))).toList(),
      onChanged: onChanged,
    );
  }
}

// ===== PROFILE =====
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(t('profile')),
          backgroundColor: const Color(0xFF1A237E), foregroundColor: Colors.white),
      body: ListView(padding: const EdgeInsets.all(16), children: [
        const CircleAvatar(radius: 50, backgroundColor: Color(0xFF1A237E),
          child: Icon(Icons.person, size: 50, color: Colors.white)),
        const SizedBox(height: 16),
        const Center(child: Text('+992 900 00 00 00',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold))),
        const SizedBox(height: 24),
        _item(Icons.home, t('my_ads')),
        _item(Icons.star, 'VIP & PREMIUM'),
        _item(Icons.card_giftcard, t('promos')),
        _item(Icons.settings, t('settings')),
        _item(Icons.help, t('help')),
        const SizedBox(height: 24),
        ElevatedButton(
          onPressed: () => Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (_) => const LoginScreen())),
          style: ElevatedButton.styleFrom(backgroundColor: Colors.red,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
          child: Text(t('logout')),
        ),
      ]),
    );
  }

  Widget _item(IconData icon, String title) {
    return ListTile(
      leading: Icon(icon, color: const Color(0xFF1A237E)),
      title: Text(title),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
      onTap: () {},
    );
  }
}
