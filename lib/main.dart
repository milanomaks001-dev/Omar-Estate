import 'package:flutter/material.dart';

void main() => runApp(const OmarEstateApp());

// ===== ДАННЫЕ =====
const List<String> tajikCities = [
  'Душанбе','Худжанд','Бохтар','Куляб','Истаравшан',
  'Канибадам','Пенджикент','Хорог','Турсунзаде','Вахдат',
  'Гиссар','Рогун','Исфара','Табошар','Бустон',
  'Фархор','Яван','Гиссар','Варзоб','Рашт',
  'Нурабад','Файзабад','Шахринав','Рудаки','Вахш',
  'Муминабад','Темурмалик','Ховалинг','Шаартуз',
  'Хамадони','Хуросон','Шамсиддин Шохин',
  'Ванч','Ишкашим','Мургаб','Рошткала','Рушан','Шугнан','Дарваз'
];

const List<String> propertyTypes = [
  'Квартира','Дом','Офис','Магазин','Участок','Новостройка'
];

class Property {
  final String title, location, price, area, type, phone;
  const Property({
    required this.title, required this.location,
    required this.price, required this.area,
    required this.type, required this.phone,
  });
}

final List<Property> sampleProperties = [
  const Property(title:'3-комнатная квартира',location:'Душанбе, район Сино',price:'650,000',area:'85 м²',type:'Квартира',phone:'+992 900 12 34 56'),
  const Property(title:'2-комнатная квартира',location:'Душанбе, Рудаки',price:'420,000',area:'65 м²',type:'Квартира',phone:'+992 900 23 45 67'),
  const Property(title:'Дом с участком',location:'Гиссар',price:'1,200,000',area:'200 м²',type:'Дом',phone:'+992 900 34 56 78'),
  const Property(title:'Офис в центре',location:'Душанбе, центр',price:'850,000',area:'120 м²',type:'Офис',phone:'+992 900 45 67 89'),
  const Property(title:'1-комнатная квартира',location:'Худжанд',price:'280,000',area:'45 м²',type:'Квартира',phone:'+992 900 56 78 90'),
  const Property(title:'Магазин',location:'Бохтар',price:'950,000',area:'150 м²',type:'Магазин',phone:'+992 900 67 89 01'),
];

// ===== APP =====
class OmarEstateApp extends StatelessWidget {
  const OmarEstateApp({super.key});
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
        child: const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(radius: 70, backgroundColor: Colors.white,
                child: Text('OMAR', style: TextStyle(fontSize: 26,
                    fontWeight: FontWeight.bold, color: Color(0xFF1A237E)))),
              SizedBox(height: 24),
              Text('OMAR ESTATE', style: TextStyle(fontSize: 30,
                  fontWeight: FontWeight.bold, color: Colors.white, letterSpacing: 3)),
              SizedBox(height: 8),
              Text('Real Estate Agency',
                  style: TextStyle(fontSize: 16, color: Colors.white70)),
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
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const CircleAvatar(radius: 50, backgroundColor: Colors.white,
                  child: Text('OMAR', style: TextStyle(fontSize: 20,
                      fontWeight: FontWeight.bold, color: Color(0xFF1A237E)))),
                const SizedBox(height: 32),
                const Text('Добро пожаловать!',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold,
                        color: Colors.white)),
                const SizedBox(height: 8),
                const Text('Войдите по номеру телефона',
                    style: TextStyle(fontSize: 14, color: Colors.white70)),
                const SizedBox(height: 40),
                TextField(
                  controller: _phoneController,
                  keyboardType: TextInputType.phone,
                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    labelText: 'Номер телефона',
                    labelStyle: const TextStyle(color: Colors.white70),
                    prefixIcon: const Icon(Icons.phone, color: Colors.white70),
                    hintText: '+992 XXX XX XX XX',
                    hintStyle: const TextStyle(color: Colors.white38),
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
                const SizedBox(height: 24),
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (_) => const HomeScreen()));
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: const Color(0xFF1A237E),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
                    ),
                    child: const Text('Войти',
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  ),
                ),
                const SizedBox(height: 16),
                TextButton(
                  onPressed: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (_) => const HomeScreen()));
                  },
                  child: const Text('Войти как гость',
                      style: TextStyle(color: Colors.white70)),
                ),
              ],
            ),
          ),
        ),
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
  int _currentIndex = 0;
  String? _selectedCity;
  String? _selectedType;

  List<Property> get filteredProperties {
    return sampleProperties.where((p) {
      if (_selectedCity != null && !p.location.contains(_selectedCity!)) return false;
      if (_selectedType != null && p.type != _selectedType) return false;
      return true;
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Omar Estate',
            style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: const Color(0xFF1A237E),
        foregroundColor: Colors.white,
        actions: [
          IconButton(icon: const Icon(Icons.search), onPressed: () {}),
          IconButton(icon: const Icon(Icons.notifications_outlined), onPressed: () {}),
        ],
      ),
      body: Column(
        children: [
          // Фильтры
          Container(
            color: const Color(0xFF1A237E).withOpacity(0.05),
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            child: Row(
              children: [
                Expanded(
                  child: DropdownButtonFormField<String>(
                    value: _selectedCity,
                    hint: const Text('Город', style: TextStyle(fontSize: 13)),
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                    ),
                    items: tajikCities.map((c) => DropdownMenuItem(value: c, child: Text(c, style: const TextStyle(fontSize: 13)))).toList(),
                    onChanged: (v) => setState(() => _selectedCity = v),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: DropdownButtonFormField<String>(
                    value: _selectedType,
                    hint: const Text('Тип', style: TextStyle(fontSize: 13)),
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                    ),
                    items: propertyTypes.map((t) => DropdownMenuItem(value: t, child: Text(t, style: const TextStyle(fontSize: 13)))).toList(),
                    onChanged: (v) => setState(() => _selectedType = v),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.clear, color: Color(0xFF1A237E)),
                  onPressed: () => setState(() { _selectedCity = null; _selectedType = null; }),
                ),
              ],
            ),
          ),
          // Список
          Expanded(
            child: filteredProperties.isEmpty
                ? const Center(child: Text('Ничего не найдено'))
                : ListView.builder(
                    padding: const EdgeInsets.all(12),
                    itemCount: filteredProperties.length,
                    itemBuilder: (ctx, i) => _buildCard(filteredProperties[i]),
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
        label: const Text('Добавить'),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        selectedItemColor: const Color(0xFF1A237E),
        onTap: (i) => setState(() => _currentIndex = i),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Главная'),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Избранное'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Профиль'),
        ],
      ),
    );
  }

  Widget _buildCard(Property p) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: InkWell(
        onTap: () => Navigator.push(context,
            MaterialPageRoute(builder: (_) => PropertyDetailScreen(property: p))),
        borderRadius: BorderRadius.circular(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 140,
              decoration: BoxDecoration(
                color: const Color(0xFF1A237E).withOpacity(0.1),
                borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
              ),
              child: Stack(
                children: [
                  const Center(child: Icon(Icons.home, size: 60, color: Color(0xFF1A237E))),
                  Positioned(top: 8, right: 8,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: const Color(0xFF1A237E),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(p.type,
                          style: const TextStyle(color: Colors.white, fontSize: 11)),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(p.title, style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 4),
                  Row(children: [
                    const Icon(Icons.location_on, size: 14, color: Colors.grey),
                    const SizedBox(width: 2),
                    Text(p.location, style: const TextStyle(fontSize: 13, color: Colors.grey)),
                  ]),
                  const SizedBox(height: 8),
                  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                    Text('${p.price} сомони',
                        style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Color(0xFF1A237E))),
                    Text(p.area, style: const TextStyle(fontSize: 13, color: Colors.grey)),
                  ]),
                ],
              ),
            ),
          ],
        ),
      ),
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 220,
              color: const Color(0xFF1A237E).withOpacity(0.1),
              child: const Center(child: Icon(Icons.home, size: 80, color: Color(0xFF1A237E))),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(property.title,
                      style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 8),
                  Row(children: [
                    const Icon(Icons.location_on, color: Color(0xFF1A237E)),
                    Text(property.location, style: const TextStyle(fontSize: 15)),
                  ]),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _infoBox('Цена', '${property.price} сомони'),
                      _infoBox('Площадь', property.area),
                      _infoBox('Тип', property.type),
                    ],
                  ),
                  const SizedBox(height: 24),
                  const Text('Контакт продавца',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 12),
                  Row(children: [
                    Expanded(
                      child: ElevatedButton.icon(
                        onPressed: () {},
                        icon: const Icon(Icons.phone),
                        label: Text(property.phone),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF1A237E),
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    ElevatedButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.chat),
                      label: const Text('WhatsApp'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                      ),
                    ),
                  ]),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _infoBox(String label, String value) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFF1A237E).withOpacity(0.08),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(children: [
        Text(label, style: const TextStyle(fontSize: 12, color: Colors.grey)),
        const SizedBox(height: 4),
        Text(value, style: const TextStyle(fontSize: 13, fontWeight: FontWeight.bold)),
      ]),
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
  final _titleController = TextEditingController();
  final _priceController = TextEditingController();
  final _areaController = TextEditingController();
  final _phoneController = TextEditingController();
  String? _selectedCity;
  String? _selectedType;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Добавить объявление'),
        backgroundColor: const Color(0xFF1A237E),
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Container(
              height: 150,
              width: double.infinity,
              decoration: BoxDecoration(
                color: const Color(0xFF1A237E).withOpacity(0.08),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: const Color(0xFF1A237E).withOpacity(0.3)),
              ),
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.add_photo_alternate, size: 48, color: Color(0xFF1A237E)),
                  SizedBox(height: 8),
                  Text('Добавить фото', style: TextStyle(color: Color(0xFF1A237E))),
                ],
              ),
            ),
            const SizedBox(height: 16),
            _buildField('Заголовок объявления', _titleController, Icons.title),
            const SizedBox(height: 12),
            DropdownButtonFormField<String>(
              value: _selectedType,
              hint: const Text('Тип недвижимости'),
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.home),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              ),
              items: propertyTypes.map((t) => DropdownMenuItem(value: t, child: Text(t))).toList(),
              onChanged: (v) => setState(() => _selectedType = v),
            ),
            const SizedBox(height: 12),
            DropdownButtonFormField<String>(
              value: _selectedCity,
              hint: const Text('Выберите город/район'),
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.location_on),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              ),
              items: tajikCities.map((c) => DropdownMenuItem(value: c, child: Text(c))).toList(),
              onChanged: (v) => setState(() => _selectedCity = v),
            ),
            const SizedBox(height: 12),
            _buildField('Цена (сомони)', _priceController, Icons.monetization_on,
                type: TextInputType.number),
            const SizedBox(height: 12),
            _buildField('Площадь (м²)', _areaController, Icons.square_foot,
                type: TextInputType.number),
            const SizedBox(height: 12),
            _buildField('Номер телефона', _phoneController, Icons.phone,
                type: TextInputType.phone),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Объявление добавлено!')),
                  );
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF1A237E),
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
                child: const Text('Опубликовать', style: TextStyle(fontSize: 16)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildField(String label, TextEditingController ctrl, IconData icon,
      {TextInputType type = TextInputType.text}) {
    return TextField(
      controller: ctrl,
      keyboardType: type,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );
  }
}
// ===== AI MODERATOR =====
class AIModerator {
  static Map<String, dynamic> checkProperty({
    required String title,
    required String price,
    required String phone,
    required String city,
  }) {
    List<String> warnings = [];
    bool approved = true;

    // Проверка цены
    final priceNum = int.tryParse(price.replaceAll(',', '').replaceAll(' ', ''));
    if (priceNum != null) {
      if (priceNum < 10000) {
        warnings.add('⚠️ Цена слишком низкая — возможное мошенничество');
        approved = false;
      }
      if (priceNum > 50000000) {
        warnings.add('⚠️ Цена слишком высокая — проверьте правильность');
      }
    }

    // Проверка телефона
    if (phone.length < 9) {
      warnings.add('⚠️ Неверный формат номера телефона');
      approved = false;
    }
    if (!phone.startsWith('+992') && !phone.startsWith('992') && !phone.startsWith('0')) {
      warnings.add('⚠️ Номер не таджикский (+992)');
    }

    // Проверка заголовка
    if (title.length < 5) {
      warnings.add('⚠️ Заголовок слишком короткий');
      approved = false;
    }
    if (title.contains('СРОЧНО') || title.contains('БЕСПЛАТНО')) {
      warnings.add('⚠️ Подозрительные слова в заголовке');
    }

    // Проверка города
    if (city.isEmpty) {
      warnings.add('⚠️ Не указан город');
      approved = false;
    }

    return {
      'approved': approved && warnings.isEmpty,
      'warnings': warnings,
      'score': warnings.isEmpty ? 100 : (100 - warnings.length * 20),
    };
  }
}
