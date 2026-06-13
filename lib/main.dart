import 'package:flutter/material.dart';

void main() {
  runApp(const OmarEstateApp());
}

// ==================== COLORS ====================
const Color kPrimary = Color(0xFF1A237E);
const Color kPrimaryLight = Color(0xFF1565C0);
const Color kAccent = Color(0xFFFFD700);
const Color kVip = Color(0xFFFF6B35);
const Color kPremium = Color(0xFFFFD700);

// ==================== MODELS ====================
class Property {
  final String title;
  final String location;
  final String price;
  final String type;
  final String dealType;
  final String city;
  final bool isVip;
  final bool isPremium;

  Property({
    required this.title,
    required this.location,
    required this.price,
    required this.type,
    required this.dealType,
    required this.city,
    this.isVip = false,
    this.isPremium = false,
  });
}

// ==================== DATA ====================
final List<Property> sampleProperties = [
  Property(title: '3-комнатная квартира', location: 'Душанбе, район Сино', price: '650,000 сом', type: 'Квартира', dealType: 'Продажа', city: 'Душанбе', isPremium: true),
  Property(title: '2-комнатная квартира', location: 'Душанбе, Рудаки', price: '2,500 сом', type: 'Квартира', dealType: 'Аренда', city: 'Душанбе', isVip: true),
  Property(title: 'Дом с участком', location: 'Гиссар', price: '1,200,000 сом', type: 'Дом', dealType: 'Продажа', city: 'Гиссар'),
  Property(title: 'Офис в центре', location: 'Душанбе, центр', price: '850,000 сом', type: 'Офис', dealType: 'Продажа', city: 'Душанбе'),
  Property(title: 'Земельный участок', location: 'Турсунзаде', price: '120,000 сом', type: 'Земля', dealType: 'Продажа', city: 'Турсунзаде'),
  Property(title: 'Новостройка 1 комн.', location: 'Душанбе, Шохмансур', price: '380,000 сом', type: 'Квартира', dealType: 'Продажа', city: 'Душанбе', isVip: true),
  Property(title: 'Гостиница', location: 'Худжанд', price: '2,500,000 сом', type: 'Гостиница', dealType: 'Продажа', city: 'Худжанд', isPremium: true),
];

const List<String> cities = ['Душанбе', 'Худжанд', 'Бохтар', 'Куляб', 'Истаравшан', 'Канибадам', 'Пенджикент', 'Хорог', 'Турсунзаде', 'Вахдат', 'Гиссар', 'Рогун', 'Исфара', 'Варзоб', 'Рашт'];
const List<String> dealTypes = ['Продажа', 'Аренда', 'Суточная аренда', 'Долгосрочная аренда', 'Обмен', 'Совместная аренда'];
const List<String> propertyTypes = ['Квартира', 'Дом', 'Офис', 'Магазин', 'Участок', 'Новостройка', 'Дача', 'Гараж', 'Склад', 'Гостиница', 'Производство', 'Земля'];

// ==================== APP ====================
class OmarEstateApp extends StatefulWidget {
  const OmarEstateApp({super.key});

  @override
  State<OmarEstateApp> createState() => _OmarEstateAppState();
}

class _OmarEstateAppState extends State<OmarEstateApp> {
  String _lang = 'RU';

  void setLang(String lang) => setState(() => _lang = lang);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Omar Estate',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: kPrimary),
        useMaterial3: true,
      ),
      home: SplashScreen(lang: _lang, onLangChange: setLang),
    );
  }
}

// ==================== SPLASH ====================
class SplashScreen extends StatefulWidget {
  final String lang;
  final Function(String) onLangChange;
  const SplashScreen({super.key, required this.lang, required this.onLangChange});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (_) => LoginScreen(lang: widget.lang, onLangChange: widget.onLangChange),
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [kPrimary, kPrimaryLight],
          ),
        ),
        child: const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 60,
                backgroundColor: Colors.white,
                child: Text('OMAR', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: kPrimary)),
              ),
              SizedBox(height: 24),
              Text('OMAR ESTATE', style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.white, letterSpacing: 3)),
              SizedBox(height: 8),
              Text('Бо Ақл Биёв! 🏠', style: TextStyle(fontSize: 18, color: Colors.white70)),
              SizedBox(height: 4),
              Text('Найди дом своей мечты!', style: TextStyle(fontSize: 14, color: Colors.white60)),
            ],
          ),
        ),
      ),
    );
  }
}

// ==================== LOGIN ====================
class LoginScreen extends StatefulWidget {
  final String lang;
  final Function(String) onLangChange;
  const LoginScreen({super.key, required this.lang, required this.onLangChange});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _phoneController = TextEditingController();
  final _promoController = TextEditingController();
  bool _showPromo = false;

  String t(String ru, String tj) => widget.lang == 'RU' ? ru : tj;

  void _login() {
    if (_phoneController.text.length < 7) return;
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (_) => MainScreen(
          phone: _phoneController.text,
          lang: widget.lang,
          onLangChange: widget.onLangChange,
        ),
      ),
    );
  }

  void _guestLogin() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (_) => MainScreen(
          phone: '',
          lang: widget.lang,
          onLangChange: widget.onLangChange,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [kPrimary, kPrimaryLight],
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
                    _LangButton(label: 'RU', selected: widget.lang == 'RU', onTap: () => widget.onLangChange('RU')),
                    const SizedBox(width: 12),
                    _LangButton(label: 'ТЧ', selected: widget.lang == 'TJ', onTap: () => widget.onLangChange('TJ')),
                  ],
                ),
                const SizedBox(height: 32),
                const CircleAvatar(
                  radius: 50,
                  backgroundColor: Colors.white,
                  child: Text('OMAR', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: kPrimary)),
                ),
                const SizedBox(height: 24),
                Text(
                  t('Добро пожаловать!', 'Хуш омадед!'),
                  style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
                ),
                const SizedBox(height: 8),
                Text(
                  t('Войдите по номеру телефона', 'Рақами телефонатонро ворид кунед'),
                  style: const TextStyle(fontSize: 14, color: Colors.white70),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 32),
                TextField(
                  controller: _phoneController,
                  keyboardType: TextInputType.phone,
                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    labelText: t('Номер телефона', 'Рақами телефон'),
                    labelStyle: const TextStyle(color: Colors.white70),
                    hintText: '+992 XXX XX XX XX',
                    hintStyle: const TextStyle(color: Colors.white38),
                    prefixIcon: const Icon(Icons.phone, color: Colors.white70),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(color: Colors.white38),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(color: Colors.white),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                GestureDetector(
                  onTap: () => setState(() => _showPromo = !_showPromo),
                  child: Text(
                    t('Есть промо-код?', 'Промо-код доред?'),
                    style: const TextStyle(color: Colors.white70, decoration: TextDecoration.underline),
                  ),
                ),
                if (_showPromo) ...[
                  const SizedBox(height: 12),
                  TextField(
                    controller: _promoController,
                    style: const TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      labelText: t('Промо-код', 'Промо-код'),
                      labelStyle: const TextStyle(color: Colors.white70),
                      prefixIcon: const Icon(Icons.card_giftcard, color: Colors.white70),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(color: Colors.white38),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(color: Colors.white),
                      ),
                    ),
                  ),
                ],
                const SizedBox(height: 24),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: _login,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: kPrimary,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    ),
                    child: Text(t('Войти', 'Даромадан'), style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  ),
                ),
                const SizedBox(height: 16),
                TextButton(
                  onPressed: _guestLogin,
                  child: Text(t('Как гость', 'Ҳамчун меҳмон'), style: const TextStyle(color: Colors.white70)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _LangButton extends StatelessWidget {
  final String label;
  final bool selected;
  final VoidCallback onTap;
  const _LangButton({required this.label, required this.selected, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        decoration: BoxDecoration(
          color: selected ? Colors.white : Colors.transparent,
          border: Border.all(color: Colors.white),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(label, style: TextStyle(color: selected ? kPrimary : Colors.white, fontWeight: FontWeight.bold)),
      ),
    );
  }
}

// ==================== MAIN SCREEN ====================
class MainScreen extends StatefulWidget {
  final String phone;
  final String lang;
  final Function(String) onLangChange;
  const MainScreen({super.key, required this.phone, required this.lang, required this.onLangChange});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final screens = [
      HomeScreen(lang: widget.lang, onLangChange: widget.onLangChange),
      FavoritesScreen(lang: widget.lang),
      ProfileScreen(phone: widget.phone, lang: widget.lang),
    ];

    String t(String ru, String tj) => widget.lang == 'RU' ? ru : tj;

    return Scaffold(
      body: screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        selectedItemColor: kPrimary,
        unselectedItemColor: Colors.grey,
        onTap: (i) => setState(() => _currentIndex = i),
        items: [
          BottomNavigationBarItem(icon: const Icon(Icons.home), label: t('Главная', 'Асосӣ')),
          BottomNavigationBarItem(icon: const Icon(Icons.favorite), label: t('Избранное', 'Дӯстдоштахо')),
          BottomNavigationBarItem(icon: const Icon(Icons.person), label: t('Профиль', 'Профил')),
        ],
      ),
    );
  }
}

// ==================== HOME ====================
class HomeScreen extends StatefulWidget {
  final String lang;
  final Function(String) onLangChange;
  const HomeScreen({super.key, required this.lang, required this.onLangChange});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String? _selectedCity;
  String? _selectedDeal;
  String? _selectedType;

  String t(String ru, String tj) => widget.lang == 'RU' ? ru : tj;

  List<Property> get filtered => sampleProperties.where((p) {
    if (_selectedCity != null && p.city != _selectedCity) return false;
    if (_selectedDeal != null && p.dealType != _selectedDeal) return false;
    if (_selectedType != null && p.type != _selectedType) return false;
    return true;
  }).toList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimary,
        foregroundColor: Colors.white,
        title: Text(t('Omar Estate', 'Омар Эстейт'), style: const TextStyle(fontWeight: FontWeight.bold)),
        actions: [
          IconButton(icon: const Icon(Icons.search), onPressed: () {}),
          IconButton(
            icon: const Icon(Icons.language),
            onPressed: () => widget.onLangChange(widget.lang == 'RU' ? 'TJ' : 'RU'),
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            color: Colors.grey[100],
            padding: const EdgeInsets.all(8),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(child: _FilterDropdown(
                      hint: t('Город', 'Шаҳр'),
                      value: _selectedCity,
                      items: cities,
                      onChanged: (v) => setState(() => _selectedCity = v),
                    )),
                    const SizedBox(width: 8),
                    Expanded(child: _FilterDropdown(
                      hint: t('Тип сделки', 'Намуди муомила'),
                      value: _selectedDeal,
                      items: dealTypes,
                      onChanged: (v) => setState(() => _selectedDeal = v),
                    )),
                    IconButton(
                      icon: const Icon(Icons.close, color: Colors.grey),
                      onPressed: () => setState(() {
                        _selectedCity = null;
                        _selectedDeal = null;
                        _selectedType = null;
                      }),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                _FilterDropdown(
                  hint: t('Тип недвижимости', 'Намуди амвол'),
                  value: _selectedType,
                  items: propertyTypes,
                  onChanged: (v) => setState(() => _selectedType = v),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(12),
              itemCount: filtered.length,
              itemBuilder: (ctx, i) => PropertyCard(property: filtered[i], lang: widget.lang),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        backgroundColor: kPrimary,
        foregroundColor: Colors.white,
        icon: const Icon(Icons.add),
        label: Text(t('Добавить', 'Илова кардан')),
      ),
    );
  }
}

class _FilterDropdown extends StatelessWidget {
  final String hint;
  final String? value;
  final List<String> items;
  final Function(String?) onChanged;
  const _FilterDropdown({required this.hint, required this.value, required this.items, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey[300]!),
      ),
      child: DropdownButton<String>(
        value: value,
        hint: Text(hint, style: const TextStyle(fontSize: 13)),
        isExpanded: true,
        underline: const SizedBox(),
        items: items.map((e) => DropdownMenuItem(value: e, child: Text(e, style: const TextStyle(fontSize: 13)))).toList(),
        onChanged: onChanged,
      ),
    );
  }
}

// ==================== PROPERTY CARD ====================
class PropertyCard extends StatelessWidget {
  final Property property;
  final String lang;
  const PropertyCard({super.key, required this.property, required this.lang});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(
          color: property.isPremium ? kPremium : property.isVip ? kVip : Colors.transparent,
          width: property.isPremium || property.isVip ? 2 : 0,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                height: 160,
                decoration: BoxDecoration(
                  color: kPrimary.withOpacity(0.1),
                  borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
                ),
                child: const Center(child: Icon(Icons.home, size: 60, color: kPrimary)),
              ),
              if (property.isPremium)
                Positioned(
                  top: 8, left: 8,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(color: kPremium, borderRadius: BorderRadius.circular(6)),
                    child: const Row(
                      children: [
                        Icon(Icons.star, color: Colors.white, size: 14),
                        SizedBox(width: 4),
                        Text('PREMIUM', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 12)),
                      ],
                    ),
                  ),
                ),
              if (property.isVip)
                Positioned(
                  top: 8, left: 8,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(color: kVip, borderRadius: BorderRadius.circular(6)),
                    child: const Text('🔥 VIP', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 12)),
                  ),
                ),
              Positioned(
                top: 8, right: 8,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(6)),
                  child: Text(property.dealType, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(property.title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                const SizedBox(height: 4),
                Row(children: [
                  const Icon(Icons.location_on, size: 14, color: Colors.grey),
                  const SizedBox(width: 4),
                  Text(property.location, style: const TextStyle(fontSize: 13, color: Colors.grey)),
                ]),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(property.price, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: kPrimary)),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(color: Colors.grey[100], borderRadius: BorderRadius.circular(6)),
                      child: Text(property.type, style: const TextStyle(fontSize: 12, color: Colors.grey)),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ==================== FAVORITES ====================
class FavoritesScreen extends StatelessWidget {
  final String lang;
  const FavoritesScreen({super.key, required this.lang});

  @override
  Widget build(BuildContext context) {
    String t(String ru, String tj) => lang == 'RU' ? ru : tj;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimary,
        foregroundColor: Colors.white,
        title: Text(t('Избранное', 'Дӯстдоштахо'), style: const TextStyle(fontWeight: FontWeight.bold)),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.favorite_border, size: 80, color: Colors.grey),
            const SizedBox(height: 16),
            Text(t('Нет избранных объявлений', 'Эълонҳои дӯстдошта нест'), style: const TextStyle(color: Colors.grey, fontSize: 16)),
          ],
        ),
      ),
    );
  }
}

// ==================== PROFILE ====================
class ProfileScreen extends StatelessWidget {
  final String phone;
  final String lang;
  const ProfileScreen({super.key, required this.phone, required this.lang});

  @override
  Widget build(BuildContext context) {
    String t(String ru, String tj) => lang == 'RU' ? ru : tj;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimary,
        foregroundColor: Colors.white,
        title: Text(t('Профиль', 'Профил'), style: const TextStyle(fontWeight: FontWeight.bold)),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 24),
            const CircleAvatar(radius: 50, backgroundColor: kPrimary, child: Icon(Icons.person, size: 50, color: Colors.white)),
            const SizedBox(height: 12),
            Text(
              phone.isEmpty ? t('Гость', 'Меҳмон') : phone,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 24),
            _ProfileItem(icon: Icons.home, label: t('Мои объявления', 'Эълонҳои ман'), onTap: () {}),
            _ProfileItem(icon: Icons.star, label: 'VIP & PREMIUM', onTap: () => _showVipDialog(context, lang)),
            _ProfileItem(icon: Icons.card_giftcard, label: t('Промо-коды', 'Промо-кодҳо'), onTap: () {}),
            _ProfileItem(icon: Icons.settings, label: t('Настройки', 'Танзимот'), onTap: () {}),
            _ProfileItem(icon: Icons.help, label: t('Помощь', 'Кӯмак'), onTap: () {}),
            const SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (_) => LoginScreen(lang: lang, onLangChange: (_) {})),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                  child: Text(t('Выйти', 'Баромадан'), style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                ),
              ),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  void _showVipDialog(BuildContext context, String lang) {
    String t(String ru, String tj) => lang == 'RU' ? ru : tj;
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('VIP & PREMIUM'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _VipOption(title: '🔥 VIP', desc: t('7 дней в топе', '7 рӯз дар боло'), price: '5 сомони'),
            const SizedBox(height: 12),
            _VipOption(title: '⭐ PREMIUM', desc: t('30 дней в топе', '30 рӯз дар боло'), price: '15 сомони'),
          ],
        ),
        actions: [TextButton(onPressed: () => Navigator.pop(context), child: Text(t('Закрыть', 'Бастан')))],
      ),
    );
  }
}

class _ProfileItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;
  const _ProfileItem({required this.icon, required this.label, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: kPrimary),
      title: Text(label),
      trailing: const Icon(Icons.chevron_right, color: Colors.grey),
      onTap: onTap,
    );
  }
}

class _VipOption extends StatelessWidget {
  final String title;
  final String desc;
  final String price;
  const _VipOption({required this.title, required this.desc, required this.price});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(color: kPrimary.withOpacity(0.1), borderRadius: BorderRadius.circular(8)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            Text(desc, style: const TextStyle(color: Colors.grey, fontSize: 13)),
          ]),
          Text(price, style: const TextStyle(color: kPrimary, fontWeight: FontWeight.bold, fontSize: 16)),
        ],
      ),
    );
  }
}
