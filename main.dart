import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  runApp(ExploreBangladeshApp(prefs: prefs));
}

class ExploreBangladeshApp extends StatefulWidget {
  const ExploreBangladeshApp({super.key, required this.prefs});
  final SharedPreferences prefs;

  @override
  State<ExploreBangladeshApp> createState() => _ExploreBangladeshAppState();
}

class _ExploreBangladeshAppState extends State<ExploreBangladeshApp> {
  bool english = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Explore Bangladesh',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF087F5B)),
        useMaterial3: true,
        scaffoldBackgroundColor: const Color(0xFFF7F9F7),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFFF7F9F7),
          foregroundColor: Color(0xFF173B2F),
          elevation: 0,
        ),
      ),
      home: TourismHome(
        prefs: widget.prefs,
        english: english,
        onLanguageChanged: (value) => setState(() => english = value),
      ),
    );
  }
}

class Destination {
  const Destination({
    required this.id,
    required this.bn,
    required this.en,
    required this.districtBn,
    required this.districtEn,
    required this.divisionBn,
    required this.divisionEn,
    required this.categoryBn,
    required this.categoryEn,
    required this.descriptionBn,
    required this.descriptionEn,
    required this.imageUrl,
    required this.lat,
    required this.lng,
  });

  final String id, bn, en, districtBn, districtEn, divisionBn, divisionEn;
  final String categoryBn, categoryEn, descriptionBn, descriptionEn, imageUrl;
  final double lat, lng;

  String name(bool en) => en ? this.en : bn;
  String district(bool en) => en ? districtEn : districtBn;
  String division(bool en) => en ? divisionEn : divisionBn;
  String category(bool en) => en ? categoryEn : categoryBn;
  String description(bool en) => en ? descriptionEn : descriptionBn;
}

const places = <Destination>[
  Destination(
    id: 'cox', bn: 'কক্সবাজার সমুদ্র সৈকত', en: "Cox's Bazar Sea Beach",
    districtBn: 'কক্সবাজার', districtEn: "Cox's Bazar",
    divisionBn: 'চট্টগ্রাম', divisionEn: 'Chattogram',
    categoryBn: 'সমুদ্র সৈকত', categoryEn: 'Beach',
    descriptionBn: 'দীর্ঘ বালুকাময় সৈকত, সূর্যাস্ত এবং সমুদ্রের দৃশ্য উপভোগ করার জনপ্রিয় গন্তব্য। ভ্রমণের আগে স্থানীয় নির্দেশনা ও আবহাওয়া দেখে নিন।',
    descriptionEn: 'A popular destination for a long sandy shoreline, sunsets, and sea views. Check local guidance and weather before travelling.',
    imageUrl: 'https://images.unsplash.com/photo-1500375592092-40eb2168fd21?w=1200',
    lat: 21.4272, lng: 92.0058,
  ),
  Destination(
    id: 'sajek', bn: 'সাজেক ভ্যালি', en: 'Sajek Valley',
    districtBn: 'রাঙামাটি', districtEn: 'Rangamati',
    divisionBn: 'চট্টগ্রাম', divisionEn: 'Chattogram',
    categoryBn: 'পাহাড়', categoryEn: 'Hills',
    descriptionBn: 'পাহাড়, মেঘ ও সবুজ উপত্যকার জন্য পরিচিত। যাত্রার আগে রাস্তার অবস্থা, অনুমতি এবং স্থানীয় ভ্রমণ নির্দেশনা যাচাই করুন।',
    descriptionEn: 'Known for hills, clouds, and green valleys. Check road conditions, permits, and local travel guidance before visiting.',
    imageUrl: 'https://images.unsplash.com/photo-1464822759023-fed622ff2c3b?w=1200',
    lat: 23.3814, lng: 92.2938,
  ),
  Destination(
    id: 'sundarbans', bn: 'সুন্দরবন', en: 'The Sundarbans',
    districtBn: 'খুলনা', districtEn: 'Khulna',
    divisionBn: 'খুলনা', divisionEn: 'Khulna',
    categoryBn: 'ম্যানগ্রোভ বন', categoryEn: 'Mangrove forest',
    descriptionBn: 'বিশ্বখ্যাত ম্যানগ্রোভ বন, নদী ও বন্যপ্রাণীর আবাসস্থল। নির্ধারিত অনুমোদিত ট্যুর ও বন বিভাগের নিয়ম মেনে ভ্রমণ করুন।',
    descriptionEn: 'A world-famous mangrove forest with rivers and wildlife. Visit through authorised tours and follow forest department rules.',
    imageUrl: 'https://images.unsplash.com/photo-1448375240586-882707db888b?w=1200',
    lat: 21.9497, lng: 89.1833,
  ),
  Destination(
    id: 'jaflong', bn: 'জাফলং', en: 'Jaflong',
    districtBn: 'সিলেট', districtEn: 'Sylhet',
    divisionBn: 'সিলেট', divisionEn: 'Sylhet',
    categoryBn: 'নদী ও পাহাড়', categoryEn: 'River & hills',
    descriptionBn: 'নদী, পাথর, সবুজ পাহাড় এবং প্রাকৃতিক দৃশ্যের জন্য পরিচিত। নদীর স্রোত ও স্থানীয় নিরাপত্তা নির্দেশনা খেয়াল রাখুন।',
    descriptionEn: 'Known for its river, stones, green hills, and scenic views. Pay attention to river currents and local safety advice.',
    imageUrl: 'https://images.unsplash.com/photo-1501785888041-af3ef285b470?w=1200',
    lat: 25.1631, lng: 92.0175,
  ),
  Destination(
    id: 'sreemangal', bn: 'শ্রীমঙ্গল চা বাগান', en: 'Sreemangal Tea Gardens',
    districtBn: 'মৌলভীবাজার', districtEn: 'Moulvibazar',
    divisionBn: 'সিলেট', divisionEn: 'Sylhet',
    categoryBn: 'চা বাগান', categoryEn: 'Tea gardens',
    descriptionBn: 'সবুজ চা বাগান, শান্ত গ্রামীণ পরিবেশ ও প্রকৃতি উপভোগের জন্য সুন্দর স্থান। ব্যক্তিগত বাগানে প্রবেশের আগে অনুমতি নিন।',
    descriptionEn: 'A scenic area for green tea gardens, peaceful countryside, and nature. Ask permission before entering private gardens.',
    imageUrl: 'https://images.unsplash.com/photo-1563911892437-1f7eda490e9a?w=1200',
    lat: 24.3065, lng: 91.7296,
  ),
  Destination(
    id: 'saintmartin', bn: 'সেন্ট মার্টিন দ্বীপ', en: 'Saint Martin Island',
    districtBn: 'কক্সবাজার', districtEn: "Cox's Bazar",
    divisionBn: 'চট্টগ্রাম', divisionEn: 'Chattogram',
    categoryBn: 'দ্বীপ', categoryEn: 'Island',
    descriptionBn: 'প্রবাল দ্বীপ ও নীল সমুদ্রের জন্য পরিচিত। পরিবেশ সংরক্ষণ ও মৌসুমি ভ্রমণ-নিয়ম পরিবর্তিত হতে পারে, তাই যাওয়ার আগে সরকারি নির্দেশনা যাচাই করুন।',
    descriptionEn: 'Known for coral scenery and blue water. Environmental protections and seasonal travel rules may change, so verify official guidance before visiting.',
    imageUrl: 'https://images.unsplash.com/photo-1519046904884-53103b34b206?w=1200',
    lat: 20.6274, lng: 92.3223,
  ),
  Destination(
    id: 'kuakata', bn: 'কুয়াকাটা সমুদ্র সৈকত', en: 'Kuakata Sea Beach',
    districtBn: 'পটুয়াখালী', districtEn: 'Patuakhali',
    divisionBn: 'বরিশাল', divisionEn: 'Barishal',
    categoryBn: 'সমুদ্র সৈকত', categoryEn: 'Beach',
    descriptionBn: 'সমুদ্রের বিস্তৃত দৃশ্য এবং সূর্যোদয়-সূর্যাস্ত দেখার জন্য পরিচিত। আবহাওয়া ও জোয়ারের অবস্থা দেখে ভ্রমণ করুন।',
    descriptionEn: 'Known for wide sea views and sunrise and sunset scenery. Check weather and tide conditions when planning a visit.',
    imageUrl: 'https://images.unsplash.com/photo-1473116763249-2faaef81ccda?w=1200',
    lat: 21.8167, lng: 90.1167,
  ),
  Destination(
    id: 'lalbagh', bn: 'লালবাগ কেল্লা', en: 'Lalbagh Fort',
    districtBn: 'ঢাকা', districtEn: 'Dhaka',
    divisionBn: 'ঢাকা', divisionEn: 'Dhaka',
    categoryBn: 'ঐতিহাসিক স্থান', categoryEn: 'Historic site',
    descriptionBn: 'পুরান ঢাকার ঐতিহাসিক মুঘল স্থাপত্যের একটি গুরুত্বপূর্ণ নিদর্শন। প্রবেশমূল্য ও খোলার সময় যাওয়ার আগে যাচাই করুন।',
    descriptionEn: 'An important Mughal-era historic landmark in Old Dhaka. Verify admission fees and opening hours before visiting.',
    imageUrl: 'https://images.unsplash.com/photo-1595658658481-d53d3f999875?w=1200',
    lat: 23.7195, lng: 90.3880,
  ),
];

class TourismHome extends StatefulWidget {
  const TourismHome({
    super.key,
    required this.prefs,
    required this.english,
    required this.onLanguageChanged,
  });

  final SharedPreferences prefs;
  final bool english;
  final ValueChanged<bool> onLanguageChanged;

  @override
  State<TourismHome> createState() => _TourismHomeState();
}

class _TourismHomeState extends State<TourismHome> {
  int tab = 0;
  String query = '';
  late Set<String> favorites;

  bool get en => widget.english;
  String tr(String bn, String english) => en ? english : bn;

  @override
  void initState() {
    super.initState();
    favorites = (widget.prefs.getStringList('favorites') ?? <String>[]).toSet();
  }

  Future<void> toggleFavorite(Destination d) async {
    setState(() {
      if (!favorites.add(d.id)) favorites.remove(d.id);
    });
    await widget.prefs.setStringList('favorites', favorites.toList());
  }

  List<Destination> get visiblePlaces {
    Iterable<Destination> list = tab == 1
        ? places.where((p) => favorites.contains(p.id))
        : places;
    final q = query.trim().toLowerCase();
    if (q.isNotEmpty) {
      list = list.where((p) =>
          p.bn.toLowerCase().contains(q) ||
          p.en.toLowerCase().contains(q) ||
          p.districtBn.toLowerCase().contains(q) ||
          p.districtEn.toLowerCase().contains(q) ||
          p.divisionBn.toLowerCase().contains(q) ||
          p.divisionEn.toLowerCase().contains(q));
    }
    return list.toList();
  }

  @override
  Widget build(BuildContext context) {
    final list = visiblePlaces;
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 18,
        title: Row(
          children: [
            Container(
              width: 38, height: 38,
              decoration: BoxDecoration(
                color: const Color(0xFF087F5B),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Icon(Icons.travel_explore, color: Colors.white),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                'Explore Bangladesh',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w800,
                  letterSpacing: -0.3,
                ),
              ),
            ),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12),
            child: TextButton(
              onPressed: () => widget.onLanguageChanged(!en),
              child: Text(en ? 'বাংলা' : 'EN',
                style: const TextStyle(fontWeight: FontWeight.bold)),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(18, 12, 18, 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      tr('বাংলাদেশ ঘুরে দেখুন', 'Discover Bangladesh'),
                      style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                        fontWeight: FontWeight.w900,
                        color: const Color(0xFF163B2E),
                        height: 1.15,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      tr('পাহাড়, সমুদ্র, বন ও ঐতিহ্যের নতুন ঠিকানা খুঁজুন।',
                         'Find your next escape among hills, beaches, forests and heritage.'),
                      style: TextStyle(color: Colors.grey.shade700, height: 1.4),
                    ),
                    const SizedBox(height: 18),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [BoxShadow(
                          color: Colors.black.withValues(alpha: 0.04),
                          blurRadius: 16, offset: const Offset(0, 5),
                        )],
                      ),
                      child: TextField(
                        onChanged: (v) => setState(() => query = v),
                        decoration: InputDecoration(
                          hintText: tr('স্থান, জেলা বা বিভাগ খুঁজুন', 'Search places, districts...'),
                          prefixIcon: const Icon(Icons.search),
                          border: InputBorder.none,
                          contentPadding: const EdgeInsets.symmetric(vertical: 16),
                        ),
                      ),
                    ),
                    const SizedBox(height: 22),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          tab == 1 ? tr('আপনার পছন্দ', 'Your favorites')
                              : tr('জনপ্রিয় গন্তব্য', 'Popular destinations'),
                          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        Text('${list.length} ${tr('টি স্থান', 'places')}',
                          style: TextStyle(color: Colors.grey.shade600, fontSize: 12)),
                      ],
                    ),
                    const SizedBox(height: 12),
                  ],
                ),
              ),
            ),
            if (list.isEmpty)
              SliverFillRemaining(
                hasScrollBody: false,
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(24),
                    child: Text(
                      tr('কোনো স্থান পাওয়া যায়নি। অন্য নামে খুঁজুন।',
                         'No places found. Try another search.'),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              )
            else
              SliverPadding(
                padding: const EdgeInsets.fromLTRB(18, 0, 18, 20),
                sliver: SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      final place = list[index];
                      return DestinationCard(
                        destination: place,
                        english: en,
                        favorite: favorites.contains(place.id),
                        onFavorite: () => toggleFavorite(place),
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => DestinationDetail(
                              destination: place,
                              english: en,
                              favorite: favorites.contains(place.id),
                              onFavorite: () => toggleFavorite(place),
                            ),
                          ),
                        ),
                      );
                    },
                    childCount: list.length,
                  ),
                ),
              ),
          ],
        ),
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: tab,
        onDestinationSelected: (v) => setState(() {
          tab = v;
          query = '';
        }),
        destinations: [
          NavigationDestination(
            icon: const Icon(Icons.explore_outlined),
            selectedIcon: const Icon(Icons.explore),
            label: tr('ঘুরে দেখুন', 'Explore'),
          ),
          NavigationDestination(
            icon: const Icon(Icons.favorite_border),
            selectedIcon: const Icon(Icons.favorite),
            label: tr('পছন্দ', 'Favorites'),
          ),
        ],
      ),
    );
  }
}

class DestinationCard extends StatelessWidget {
  const DestinationCard({
    super.key,
    required this.destination,
    required this.english,
    required this.favorite,
    required this.onFavorite,
    required this.onTap,
  });

  final Destination destination;
  final bool english, favorite;
  final VoidCallback onFavorite, onTap;

  @override
  Widget build(BuildContext context) {
    final d = destination;
    return Card(
      margin: const EdgeInsets.only(bottom: 15),
      clipBehavior: Clip.antiAlias,
      elevation: 0,
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
        side: BorderSide(color: Colors.black.withValues(alpha: 0.045)),
      ),
      child: InkWell(
        onTap: onTap,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Image.network(
                  d.imageUrl,
                  height: 190,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  errorBuilder: (_, __, ___) => Container(
                    height: 190,
                    color: const Color(0xFFDDEBE3),
                    child: const Center(
                      child: Icon(Icons.landscape, size: 52, color: Color(0xFF087F5B)),
                    ),
                  ),
                ),
                Positioned(
                  left: 12, top: 12,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 11, vertical: 7),
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.94),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Text(d.category(english),
                      style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w700)),
                  ),
                ),
                Positioned(
                  right: 10, top: 10,
                  child: Material(
                    color: Colors.white.withValues(alpha: 0.95),
                    shape: const CircleBorder(),
                    child: IconButton(
                      onPressed: onFavorite,
                      icon: Icon(favorite ? Icons.favorite : Icons.favorite_border,
                        color: favorite ? Colors.red : const Color(0xFF173B2F)),
                      tooltip: english ? 'Toggle favorite' : 'পছন্দে রাখুন',
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 13, 15, 15),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(d.name(english),
                          style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w800)),
                        const SizedBox(height: 5),
                        Row(
                          children: [
                            Icon(Icons.location_on_outlined,
                              size: 15, color: Colors.grey.shade600),
                            const SizedBox(width: 3),
                            Text('${d.district(english)}, ${d.division(english)}',
                              style: TextStyle(fontSize: 12, color: Colors.grey.shade700)),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const Icon(Icons.arrow_forward_ios, size: 16, color: Color(0xFF087F5B)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DestinationDetail extends StatelessWidget {
  const DestinationDetail({
    super.key,
    required this.destination,
    required this.english,
    required this.favorite,
    required this.onFavorite,
  });

  final Destination destination;
  final bool english, favorite;
  final VoidCallback onFavorite;

  @override
  Widget build(BuildContext context) {
    final d = destination;
    final title = d.name(english);
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 280,
            pinned: true,
            actions: [
              IconButton(
                onPressed: onFavorite,
                icon: Icon(favorite ? Icons.favorite : Icons.favorite_border,
                  color: favorite ? Colors.red : Colors.white),
              ),
            ],
            flexibleSpace: FlexibleSpaceBar(
              title: Text(title, maxLines: 1, overflow: TextOverflow.ellipsis),
              background: Image.network(
                d.imageUrl, fit: BoxFit.cover,
                errorBuilder: (_, __, ___) => Container(
                  color: const Color(0xFFDDEBE3),
                  child: const Icon(Icons.landscape, size: 80),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 7),
                    decoration: BoxDecoration(
                      color: const Color(0xFFE0F2E8),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Text(d.category(english),
                      style: const TextStyle(color: Color(0xFF087F5B), fontWeight: FontWeight.w700)),
                  ),
                  const SizedBox(height: 14),
                  Row(
                    children: [
                      const Icon(Icons.location_on, color: Color(0xFF087F5B)),
                      const SizedBox(width: 6),
                      Expanded(child: Text(
                        '${d.district(english)}, ${d.division(english)}',
                        style: const TextStyle(fontWeight: FontWeight.w600),
                      )),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Text(english ? 'About this place' : 'স্থানটি সম্পর্কে',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w800)),
                  const SizedBox(height: 8),
                  Text(d.description(english),
                    style: const TextStyle(fontSize: 16, height: 1.65)),
                  const SizedBox(height: 22),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(english ? 'Location coordinates' : 'অবস্থান (GPS)',
                          style: const TextStyle(fontWeight: FontWeight.w800)),
                        const SizedBox(height: 8),
                        Text('${d.lat}, ${d.lng}'),
                        const SizedBox(height: 6),
                        Text(
                          english
                            ? 'Verify directions and access conditions before travelling.'
                            : 'যাত্রার আগে দিকনির্দেশ ও প্রবেশের শর্ত যাচাই করুন।',
                          style: TextStyle(color: Colors.grey.shade700, height: 1.4),
                        ),
                        const SizedBox(height: 10),
                        OutlinedButton.icon(
                          onPressed: () => ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text(english
                              ? 'Map links will be added in the next version.'
                              : 'পরবর্তী সংস্করণে ম্যাপের লিংক যোগ করা হবে।')),
                          ),
                          icon: const Icon(Icons.map_outlined),
                          label: Text(english ? 'Map (coming soon)' : 'ম্যাপ (পরে যোগ হবে)'),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
