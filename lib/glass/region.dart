class CountryDef {
  const CountryDef(
    this.code,
    this.en,
    this.zh,
    this.lat,
    this.lon, [
    this.aliases = const [],
  ]);

  final String code;
  final String en;
  final String zh;
  final double lat;
  final double lon;
  final List<String> aliases;
}

class CityDef {
  const CityDef(
    this.id,
    this.country,
    this.en,
    this.zh,
    this.lat,
    this.lon, [
    this.aliases = const [],
  ]);

  final String id;
  final String country;
  final String en;
  final String zh;
  final double lat;
  final double lon;
  final List<String> aliases;
}

const countryDefs = <CountryDef>[
  CountryDef('HK', 'Hong Kong', '香港', 22.32, 114.17, [
    '香港',
    '港',
    'hongkong',
    'hkg',
  ]),
  CountryDef('TW', 'Taiwan Region', '台湾地区', 23.7, 120.96, [
    '台湾',
    '臺灣',
    '台灣',
    '臺湾',
    'taiwan',
    'twn',
  ]),
  CountryDef('MO', 'Macao', '澳门', 22.2, 113.55, ['澳门', '澳門', 'macau', 'macao']),
  CountryDef('JP', 'Japan', '日本', 36.2, 138.25, ['日本', 'japan', 'jpn']),
  CountryDef('SG', 'Singapore', '新加坡', 1.35, 103.82, [
    '新加坡',
    '狮城',
    '獅城',
    'singapore',
    'sgp',
  ]),
  CountryDef('KR', 'South Korea', '韩国', 36.5, 127.9, [
    '韩国',
    '韓國',
    '南朝鲜',
    'korea',
    'kor',
  ]),
  CountryDef('US', 'United States', '美国', 39.8, -98.6, [
    '美国',
    '美國',
    'unitedstates',
    'america',
    'usa',
  ]),
  CountryDef('GB', 'United Kingdom', '英国', 52.5, -1.5, [
    '英国',
    '英國',
    'unitedkingdom',
    'britain',
    'england',
    'gbr',
  ]),
  CountryDef('DE', 'Germany', '德国', 51.2, 10.4, ['德国', '德國', 'germany', 'deu']),
  CountryDef('FR', 'France', '法国', 46.6, 2.4, ['法国', '法國', 'france', 'fra']),
  CountryDef('NL', 'Netherlands', '荷兰', 52.2, 5.3, [
    '荷兰',
    '荷蘭',
    'netherlands',
    'holland',
    'nld',
  ]),
  CountryDef('CA', 'Canada', '加拿大', 56.1, -106.3, ['加拿大', 'canada']),
  CountryDef('AU', 'Australia', '澳大利亚', -25.3, 133.8, [
    '澳大利亚',
    '澳洲',
    '澳大利亞',
    'australia',
    'aus',
  ]),
  CountryDef('RU', 'Russia', '俄罗斯', 61.5, 105.3, [
    '俄罗斯',
    '俄羅斯',
    'russia',
    'rus',
  ]),
  CountryDef('IN', 'India', '印度', 22.0, 79.0, ['印度', 'india']),
  CountryDef('TH', 'Thailand', '泰国', 15.9, 100.99, [
    '泰国',
    '泰國',
    'thailand',
    'tha',
  ]),
  CountryDef('VN', 'Vietnam', '越南', 14.06, 108.28, ['越南', 'vietnam', 'vnm']),
  CountryDef('PH', 'Philippines', '菲律宾', 12.88, 121.77, [
    '菲律宾',
    '菲律賓',
    'philippines',
    'phl',
  ]),
  CountryDef('MY', 'Malaysia', '马来西亚', 4.21, 101.98, [
    '马来西亚',
    '馬來西亞',
    '大马',
    'malaysia',
    'mys',
  ]),
  CountryDef('ID', 'Indonesia', '印度尼西亚', -0.79, 113.92, [
    '印度尼西亚',
    '印尼',
    'indonesia',
    'idn',
  ]),
  CountryDef('KH', 'Cambodia', '柬埔寨', 12.57, 104.99, [
    '柬埔寨',
    'cambodia',
    'khm',
  ]),
  CountryDef('MN', 'Mongolia', '蒙古', 46.86, 103.85, ['蒙古', 'mongolia', 'mng']),
  CountryDef('KZ', 'Kazakhstan', '哈萨克斯坦', 48.0, 67.0, [
    '哈萨克斯坦',
    'kazakhstan',
    'kaz',
  ]),
  CountryDef('TR', 'Turkey', '土耳其', 38.96, 35.24, [
    '土耳其',
    'turkey',
    'turkiye',
    'tur',
  ]),
  CountryDef('AE', 'UAE', '阿联酋', 23.42, 53.85, [
    '阿联酋',
    '阿聯酋',
    'uae',
    'emirates',
  ]),
  CountryDef('IL', 'Israel', '以色列', 31.05, 34.85, ['以色列', 'israel', 'isr']),
  CountryDef('SA', 'Saudi Arabia', '沙特', 23.89, 45.08, ['沙特', 'saudi']),
  CountryDef('IT', 'Italy', '意大利', 41.87, 12.57, ['意大利', 'italy', 'ita']),
  CountryDef('ES', 'Spain', '西班牙', 40.46, -3.75, ['西班牙', 'spain', 'esp']),
  CountryDef('PT', 'Portugal', '葡萄牙', 39.4, -8.22, ['葡萄牙', 'portugal', 'prt']),
  CountryDef('CH', 'Switzerland', '瑞士', 46.82, 8.23, [
    '瑞士',
    'switzerland',
    'che',
  ]),
  CountryDef('AT', 'Austria', '奥地利', 47.52, 14.55, [
    '奥地利',
    '奧地利',
    'austria',
    'aut',
  ]),
  CountryDef('SE', 'Sweden', '瑞典', 60.13, 18.64, ['瑞典', 'sweden', 'swe']),
  CountryDef('NO', 'Norway', '挪威', 60.47, 8.47, ['挪威', 'norway']),
  CountryDef('FI', 'Finland', '芬兰', 61.92, 25.75, [
    '芬兰',
    '芬蘭',
    'finland',
    'fin',
  ]),
  CountryDef('DK', 'Denmark', '丹麦', 56.26, 9.5, ['丹麦', '丹麥', 'denmark', 'dnk']),
  CountryDef('IE', 'Ireland', '爱尔兰', 53.41, -8.24, [
    '爱尔兰',
    '愛爾蘭',
    'ireland',
    'irl',
  ]),
  CountryDef('PL', 'Poland', '波兰', 51.92, 19.15, ['波兰', '波蘭', 'poland', 'pol']),
  CountryDef('UA', 'Ukraine', '乌克兰', 48.38, 31.17, [
    '乌克兰',
    '烏克蘭',
    'ukraine',
    'ukr',
  ]),
  CountryDef('RO', 'Romania', '罗马尼亚', 45.94, 24.97, ['罗马尼亚', 'romania', 'rou']),
  CountryDef('CZ', 'Czechia', '捷克', 49.82, 15.47, ['捷克', 'czech', 'cze']),
  CountryDef('HU', 'Hungary', '匈牙利', 47.16, 19.5, ['匈牙利', 'hungary', 'hun']),
  CountryDef('BE', 'Belgium', '比利时', 50.5, 4.47, [
    '比利时',
    '比利時',
    'belgium',
    'bel',
  ]),
  CountryDef('LU', 'Luxembourg', '卢森堡', 49.82, 6.13, [
    '卢森堡',
    'luxembourg',
    'lux',
  ]),
  CountryDef('IS', 'Iceland', '冰岛', 64.96, -19.02, [
    '冰岛',
    '冰島',
    'iceland',
    'isl',
  ]),
  CountryDef('GR', 'Greece', '希腊', 39.07, 21.82, ['希腊', '希臘', 'greece', 'grc']),
  CountryDef('BR', 'Brazil', '巴西', -14.24, -51.93, ['巴西', 'brazil', 'bra']),
  CountryDef('AR', 'Argentina', '阿根廷', -38.42, -63.62, [
    '阿根廷',
    'argentina',
    'arg',
  ]),
  CountryDef('CL', 'Chile', '智利', -35.68, -71.54, ['智利', 'chile', 'chl']),
  CountryDef('CO', 'Colombia', '哥伦比亚', 4.57, -74.3, ['哥伦比亚', 'colombia']),
  CountryDef('PE', 'Peru', '秘鲁', -9.19, -75.02, ['秘鲁', 'peru']),
  CountryDef('MX', 'Mexico', '墨西哥', 23.63, -102.55, ['墨西哥', 'mexico', 'mex']),
  CountryDef('ZA', 'South Africa', '南非', -30.56, 22.94, [
    '南非',
    'southafrica',
    'zaf',
  ]),
  CountryDef('EG', 'Egypt', '埃及', 26.82, 30.8, ['埃及', 'egypt', 'egy']),
  CountryDef('NG', 'Nigeria', '尼日利亚', 9.08, 8.68, ['尼日利亚', 'nigeria', 'nga']),
  CountryDef('NZ', 'New Zealand', '新西兰', -40.9, 174.89, [
    '新西兰',
    '紐西蘭',
    'newzealand',
    'nzl',
  ]),
  CountryDef('PK', 'Pakistan', '巴基斯坦', 30.38, 69.35, [
    '巴基斯坦',
    'pakistan',
    'pak',
  ]),
  CountryDef('BD', 'Bangladesh', '孟加拉', 23.68, 90.36, [
    '孟加拉',
    'bangladesh',
    'bgd',
  ]),
  CountryDef('NP', 'Nepal', '尼泊尔', 28.39, 84.12, ['尼泊尔', 'nepal', 'npl']),
  CountryDef('LA', 'Laos', '老挝', 19.86, 102.5, ['老挝', '老撾', 'laos', 'lao']),
  CountryDef('MM', 'Myanmar', '缅甸', 21.91, 95.96, ['缅甸', 'myanmar', 'mmr']),
  CountryDef('CN', 'China', '中国', 35.86, 104.2, [
    '中国',
    '中國',
    '大陆',
    '回国',
    'china',
    'chn',
  ]),
];

const cityDefs = <CityDef>[
  CityDef('tokyo', 'JP', 'Tokyo', '东京', 35.68, 139.69, [
    '东京',
    '東京',
    'tokyo',
    'nrt',
    'hnd',
  ]),
  CityDef('osaka', 'JP', 'Osaka', '大阪', 34.69, 135.5, ['大阪', 'osaka', 'kix']),
  CityDef('nagoya', 'JP', 'Nagoya', '名古屋', 35.18, 136.91, ['名古屋', 'nagoya']),
  CityDef('fukuoka', 'JP', 'Fukuoka', '福冈', 33.59, 130.4, [
    '福冈',
    '福岡',
    'fukuoka',
  ]),
  CityDef('saitama', 'JP', 'Saitama', '埼玉', 35.86, 139.65, ['埼玉', 'saitama']),
  CityDef('sapporo', 'JP', 'Sapporo', '札幌', 43.06, 141.35, ['札幌', 'sapporo']),
  CityDef('taipei', 'TW', 'Taipei', '台北', 25.03, 121.57, [
    '台北',
    '臺北',
    'taipei',
  ]),
  CityDef('newtaipei', 'TW', 'New Taipei', '新北', 25.01, 121.47, [
    '新北',
    'newtaipei',
  ]),
  CityDef('taichung', 'TW', 'Taichung', '台中', 24.15, 120.67, [
    '台中',
    '臺中',
    'taichung',
  ]),
  CityDef('kaohsiung', 'TW', 'Kaohsiung', '高雄', 22.63, 120.3, [
    '高雄',
    'kaohsiung',
  ]),
  CityDef('hsinchu', 'TW', 'Hsinchu', '新竹', 24.8, 120.97, ['新竹', 'hsinchu']),
  CityDef('changhua', 'TW', 'Changhua', '彰化', 24.08, 120.54, [
    '彰化',
    'changhua',
  ]),
  CityDef('seoul', 'KR', 'Seoul', '首尔', 37.57, 126.98, [
    '首尔',
    '首爾',
    'seoul',
    'icn',
  ]),
  CityDef('chuncheon', 'KR', 'Chuncheon', '春川', 37.88, 127.73, [
    '春川',
    'chuncheon',
  ]),
  CityDef('busan', 'KR', 'Busan', '釜山', 35.18, 129.08, ['釜山', 'busan']),
  CityDef('losangeles', 'US', 'Los Angeles', '洛杉矶', 34.05, -118.24, [
    '洛杉矶',
    '洛杉磯',
    'losangeles',
    'lax',
  ]),
  CityDef('sanjose', 'US', 'San Jose', '圣何塞', 37.34, -121.89, [
    '圣何塞',
    '聖何塞',
    'sanjose',
  ]),
  CityDef('sanfrancisco', 'US', 'San Francisco', '旧金山', 37.77, -122.42, [
    '旧金山',
    '舊金山',
    '三藩市',
    'sanfrancisco',
    'sfo',
  ]),
  CityDef('siliconvalley', 'US', 'Silicon Valley', '硅谷', 37.39, -122.08, [
    '硅谷',
    '矽谷',
    'siliconvalley',
  ]),
  CityDef('seattle', 'US', 'Seattle', '西雅图', 47.61, -122.33, [
    '西雅图',
    '西雅圖',
    'seattle',
    'sea',
  ]),
  CityDef('portland', 'US', 'Portland', '波特兰', 45.52, -122.68, [
    '波特兰',
    'portland',
  ]),
  CityDef('phoenix', 'US', 'Phoenix', '凤凰城', 33.45, -112.07, [
    '凤凰城',
    '鳳凰城',
    'phoenix',
  ]),
  CityDef('lasvegas', 'US', 'Las Vegas', '拉斯维加斯', 36.17, -115.14, [
    '拉斯维加斯',
    'lasvegas',
  ]),
  CityDef('denver', 'US', 'Denver', '丹佛', 39.74, -104.99, ['丹佛', 'denver']),
  CityDef('dallas', 'US', 'Dallas', '达拉斯', 32.78, -96.8, [
    '达拉斯',
    '達拉斯',
    'dallas',
  ]),
  CityDef('chicago', 'US', 'Chicago', '芝加哥', 41.88, -87.63, ['芝加哥', 'chicago']),
  CityDef('atlanta', 'US', 'Atlanta', '亚特兰大', 33.75, -84.39, [
    '亚特兰大',
    'atlanta',
  ]),
  CityDef('miami', 'US', 'Miami', '迈阿密', 25.76, -80.19, [
    '迈阿密',
    '邁阿密',
    'miami',
  ]),
  CityDef('ashburn', 'US', 'Ashburn', '阿什本', 39.04, -77.49, ['阿什本', 'ashburn']),
  CityDef('washington', 'US', 'Washington', '华盛顿', 38.9, -77.04, [
    '华盛顿',
    '華盛頓',
    'washington',
  ]),
  CityDef('newyork', 'US', 'New York', '纽约', 40.71, -74.0, [
    '纽约',
    '紐約',
    'newyork',
    'nyc',
  ]),
  CityDef('london', 'GB', 'London', '伦敦', 51.51, -0.13, ['伦敦', '倫敦', 'london']),
  CityDef('manchester', 'GB', 'Manchester', '曼彻斯特', 53.48, -2.24, [
    '曼彻斯特',
    'manchester',
  ]),
  CityDef('frankfurt', 'DE', 'Frankfurt', '法兰克福', 50.11, 8.68, [
    '法兰克福',
    '法蘭克福',
    'frankfurt',
  ]),
  CityDef('berlin', 'DE', 'Berlin', '柏林', 52.52, 13.4, ['柏林', 'berlin']),
  CityDef('munich', 'DE', 'Munich', '慕尼黑', 48.14, 11.58, [
    '慕尼黑',
    'munich',
    'münchen',
    'muenchen',
  ]),
  CityDef('dusseldorf', 'DE', 'Düsseldorf', '杜塞尔多夫', 51.23, 6.77, [
    '杜塞尔多夫',
    'dusseldorf',
    'düsseldorf',
  ]),
  CityDef('paris', 'FR', 'Paris', '巴黎', 48.86, 2.35, ['巴黎', 'paris']),
  CityDef('marseille', 'FR', 'Marseille', '马赛', 43.3, 5.37, [
    '马赛',
    '馬賽',
    'marseille',
  ]),
  CityDef('amsterdam', 'NL', 'Amsterdam', '阿姆斯特丹', 52.37, 4.9, [
    '阿姆斯特丹',
    'amsterdam',
    'ams',
  ]),
  CityDef('toronto', 'CA', 'Toronto', '多伦多', 43.65, -79.38, [
    '多伦多',
    '多倫多',
    'toronto',
  ]),
  CityDef('vancouver', 'CA', 'Vancouver', '温哥华', 49.28, -123.12, [
    '温哥华',
    '溫哥華',
    'vancouver',
  ]),
  CityDef('montreal', 'CA', 'Montreal', '蒙特利尔', 45.5, -73.57, [
    '蒙特利尔',
    'montreal',
  ]),
  CityDef('sydney', 'AU', 'Sydney', '悉尼', -33.87, 151.21, [
    '悉尼',
    '雪梨',
    'sydney',
  ]),
  CityDef('melbourne', 'AU', 'Melbourne', '墨尔本', -37.81, 144.96, [
    '墨尔本',
    '墨爾本',
    'melbourne',
  ]),
  CityDef('moscow', 'RU', 'Moscow', '莫斯科', 55.76, 37.62, ['莫斯科', 'moscow']),
  CityDef('stpetersburg', 'RU', 'St Petersburg', '圣彼得堡', 59.93, 30.34, [
    '圣彼得堡',
    'petersburg',
  ]),
  CityDef('khabarovsk', 'RU', 'Khabarovsk', '伯力', 48.48, 135.08, [
    '伯力',
    '哈巴罗夫斯克',
    'khabarovsk',
  ]),
  CityDef('novosibirsk', 'RU', 'Novosibirsk', '新西伯利亚', 55.03, 82.92, [
    '新西伯利亚',
    'novosibirsk',
  ]),
  CityDef('mumbai', 'IN', 'Mumbai', '孟买', 19.08, 72.88, [
    '孟买',
    '孟買',
    'mumbai',
    'bombay',
  ]),
  CityDef('bangkok', 'TH', 'Bangkok', '曼谷', 13.76, 100.5, ['曼谷', 'bangkok']),
  CityDef('hanoi', 'VN', 'Hanoi', '河内', 21.03, 105.85, ['河内', '河內', 'hanoi']),
  CityDef('hochiminh', 'VN', 'Ho Chi Minh City', '胡志明市', 10.82, 106.63, [
    '胡志明',
    'hochiminh',
    'saigon',
  ]),
  CityDef('manila', 'PH', 'Manila', '马尼拉', 14.6, 120.98, [
    '马尼拉',
    '馬尼拉',
    'manila',
  ]),
  CityDef('kualalumpur', 'MY', 'Kuala Lumpur', '吉隆坡', 3.14, 101.69, [
    '吉隆坡',
    'kualalumpur',
  ]),
  CityDef('jakarta', 'ID', 'Jakarta', '雅加达', -6.21, 106.85, [
    '雅加达',
    '雅加達',
    'jakarta',
  ]),
  CityDef('phnompenh', 'KH', 'Phnom Penh', '金边', 11.56, 104.93, [
    '金边',
    '金邊',
    'phnompenh',
  ]),
  CityDef('istanbul', 'TR', 'Istanbul', '伊斯坦布尔', 41.01, 28.98, [
    '伊斯坦布尔',
    'istanbul',
  ]),
  CityDef('dubai', 'AE', 'Dubai', '迪拜', 25.2, 55.27, ['迪拜', '杜拜', 'dubai']),
  CityDef('telaviv', 'IL', 'Tel Aviv', '特拉维夫', 32.09, 34.78, [
    '特拉维夫',
    'telaviv',
  ]),
  CityDef('milan', 'IT', 'Milan', '米兰', 45.46, 9.19, ['米兰', '米蘭', 'milan']),
  CityDef('rome', 'IT', 'Rome', '罗马', 41.9, 12.5, ['罗马', '羅馬', 'rome']),
  CityDef('madrid', 'ES', 'Madrid', '马德里', 40.42, -3.7, [
    '马德里',
    '馬德里',
    'madrid',
  ]),
  CityDef('zurich', 'CH', 'Zurich', '苏黎世', 47.38, 8.54, [
    '苏黎世',
    '蘇黎世',
    'zurich',
    'zürich',
  ]),
  CityDef('vienna', 'AT', 'Vienna', '维也纳', 48.21, 16.37, [
    '维也纳',
    '維也納',
    'vienna',
  ]),
  CityDef('stockholm', 'SE', 'Stockholm', '斯德哥尔摩', 59.33, 18.07, [
    '斯德哥尔摩',
    'stockholm',
  ]),
  CityDef('oslo', 'NO', 'Oslo', '奥斯陆', 59.91, 10.75, ['奥斯陆', 'oslo']),
  CityDef('helsinki', 'FI', 'Helsinki', '赫尔辛基', 60.17, 24.94, [
    '赫尔辛基',
    'helsinki',
  ]),
  CityDef('copenhagen', 'DK', 'Copenhagen', '哥本哈根', 55.68, 12.57, [
    '哥本哈根',
    'copenhagen',
  ]),
  CityDef('dublin', 'IE', 'Dublin', '都柏林', 53.35, -6.26, ['都柏林', 'dublin']),
  CityDef('warsaw', 'PL', 'Warsaw', '华沙', 52.23, 21.01, ['华沙', '華沙', 'warsaw']),
  CityDef('kyiv', 'UA', 'Kyiv', '基辅', 50.45, 30.52, ['基辅', 'kyiv', 'kiev']),
  CityDef('saopaulo', 'BR', 'São Paulo', '圣保罗', -23.55, -46.63, [
    '圣保罗',
    '聖保羅',
    'saopaulo',
    'sãopaulo',
  ]),
  CityDef('buenosaires', 'AR', 'Buenos Aires', '布宜诺斯艾利斯', -34.6, -58.38, [
    '布宜诺斯艾利斯',
    'buenosaires',
  ]),
  CityDef('santiago', 'CL', 'Santiago', '圣地亚哥', -33.45, -70.67, [
    '圣地亚哥',
    'santiago',
  ]),
  CityDef('mexicocity', 'MX', 'Mexico City', '墨西哥城', 19.43, -99.13, [
    '墨西哥城',
    'mexicocity',
  ]),
  CityDef('johannesburg', 'ZA', 'Johannesburg', '约翰内斯堡', -26.2, 28.05, [
    '约翰内斯堡',
    'johannesburg',
  ]),
  CityDef('cairo', 'EG', 'Cairo', '开罗', 30.04, 31.24, ['开罗', '開羅', 'cairo']),
  CityDef('lagos', 'NG', 'Lagos', '拉各斯', 6.52, 3.38, ['拉各斯', 'lagos']),
  CityDef('auckland', 'NZ', 'Auckland', '奥克兰', -36.85, 174.76, [
    '奥克兰',
    'auckland',
  ]),
  CityDef('almaty', 'KZ', 'Almaty', '阿拉木图', 43.24, 76.89, ['阿拉木图', 'almaty']),
  CityDef('shanghai', 'CN', 'Shanghai', '上海', 31.23, 121.47, [
    '上海',
    'shanghai',
  ]),
  CityDef('beijing', 'CN', 'Beijing', '北京', 39.9, 116.4, ['北京', 'beijing']),
  CityDef('shenzhen', 'CN', 'Shenzhen', '深圳', 22.54, 114.06, [
    '深圳',
    'shenzhen',
  ]),
  CityDef('guangzhou', 'CN', 'Guangzhou', '广州', 23.13, 113.26, [
    '广州',
    '廣州',
    'guangzhou',
  ]),
  CityDef('hangzhou', 'CN', 'Hangzhou', '杭州', 30.27, 120.16, [
    '杭州',
    'hangzhou',
  ]),
];

final RegExp _infoPattern = RegExp(
  r'剩余|流量|到期|过期|套餐|官网|重置|expire|traffic|remaining|reset',
  caseSensitive: false,
);

const _isoAliases = <String, String>{'UK': 'GB', 'EN': 'GB'};

const _codeBlacklist = {
  'IN',
  'IT',
  'IS',
  'NO',
  'LA',
  'CO',
  'PE',
  'ID',
  'BE',
  'CH',
  'CA',
  'DE',
  'ES',
  'PT',
  'MY',
  'SA',
  'AT',
  'PL',
};

final Map<String, CountryDef> countryByCode = {
  for (final c in countryDefs) c.code: c,
};

final Map<String, CityDef> cityById = {for (final c in cityDefs) c.id: c};

final RegExp _flagPattern = RegExp(
  r'[\u{1F1E6}-\u{1F1FF}]{2}|\u{1F3F4}[\u{E0060}-\u{E007F}]+|\u{1F3F3}\u{FE0F}?\u{200D}\u{1F308}|\u{1F3F4}\u{200D}\u{2620}\u{FE0F}?',
  unicode: true,
);

final RegExp _separators = RegExp(r'[\s_\-\.·|/\\()\[\]【】（）「」:：,，+]+');

String stripFlags(String name) {
  return name
      .replaceAll(_flagPattern, '')
      .replaceAll(RegExp(r'^\s+|\s+$'), '')
      .replaceAll(RegExp(r'\s{2,}'), ' ');
}

String? _flagToCode(String name) {
  final match = RegExp(
    r'[\u{1F1E6}-\u{1F1FF}]{2}',
    unicode: true,
  ).firstMatch(name);
  if (match == null) return null;
  final runes = match.group(0)!.runes.toList();
  if (runes.length != 2) return null;
  final code = String.fromCharCodes(runes.map((r) => r - 0x1F1E6 + 0x41));
  return code;
}

class RegionKey {
  const RegionKey(this.country, [this.city]);

  final String country;
  final String? city;

  String get id => city == null ? country : '$country/$city';

  CountryDef? get countryDef => countryByCode[country];

  CityDef? get cityDef => city == null ? null : cityById[city];

  double get lat => cityDef?.lat ?? countryDef?.lat ?? 0;

  double get lon => cityDef?.lon ?? countryDef?.lon ?? 0;

  String label({required bool zh}) {
    final c = countryDef;
    final countryName = c == null ? country : (zh ? c.zh : c.en);
    final ci = cityDef;
    if (ci == null) return countryName;
    return zh ? '${ci.zh} $countryName' : '${ci.en} $countryName';
  }

  @override
  bool operator ==(Object other) => other is RegionKey && other.id == id;

  @override
  int get hashCode => id.hashCode;

  @override
  String toString() => id;
}

class _AliasEntry {
  const _AliasEntry(this.alias, this.country, this.city);

  final String alias;
  final String country;
  final String? city;
}

List<_AliasEntry>? _cityAliases;
List<_AliasEntry>? _countryAliases;

List<_AliasEntry> _buildCityAliases() {
  final list = <_AliasEntry>[
    for (final c in cityDefs)
      for (final a in c.aliases) _AliasEntry(a.toLowerCase(), c.country, c.id),
  ];
  list.sort((a, b) => b.alias.length.compareTo(a.alias.length));
  return list;
}

List<_AliasEntry> _buildCountryAliases() {
  final list = <_AliasEntry>[
    for (final c in countryDefs)
      for (final a in c.aliases)
        if (a.length > 1 || !RegExp(r'^[a-z]+$').hasMatch(a))
          _AliasEntry(a.toLowerCase(), c.code, null),
  ];
  list.sort((a, b) => b.alias.length.compareTo(a.alias.length));
  return list;
}

bool _isAscii(String s) => s.codeUnits.every((c) => c < 128);

bool _containsAlias(String normalized, String spaced, String alias) {
  if (!_isAscii(alias)) return normalized.contains(alias);
  if (alias.length <= 3) {
    return RegExp('(^|[^a-z])$alias(\$|[^a-z])').hasMatch(spaced);
  }
  return normalized.contains(alias);
}

/// Infers the exit region of a proxy node from its display name.
RegionKey? parseRegion(String rawName) {
  if (_infoPattern.hasMatch(rawName)) return null;
  final cityAliases = _cityAliases ??= _buildCityAliases();
  final countryAliases = _countryAliases ??= _buildCountryAliases();
  final flag = _flagToCode(rawName);
  final name = stripFlags(rawName);
  final lower = name.toLowerCase();
  final spaced = lower.replaceAll(_separators, ' ');
  final normalized = spaced.replaceAll(' ', '');

  RegionKey? pick(RegionKey? found) {
    if (found == null) return null;
    if (found.country == 'CN') return null;
    return found;
  }

  _AliasEntry? cityHit;
  for (final entry in cityAliases) {
    if (_containsAlias(normalized, spaced, entry.alias)) {
      if (cityHit == null) {
        cityHit = entry;
      } else if (cityHit.country == 'CN' && entry.country != 'CN') {
        cityHit = entry;
        break;
      }
      if (cityHit.country != 'CN') break;
    }
  }
  _AliasEntry? countryHit;
  for (final entry in countryAliases) {
    if (entry.alias == '港' && !normalized.contains('港')) continue;
    if (_containsAlias(normalized, spaced, entry.alias)) {
      if (countryHit == null) {
        countryHit = entry;
      } else if (countryHit.country == 'CN' && entry.country != 'CN') {
        countryHit = entry;
      }
      if (countryHit.country != 'CN') break;
    }
  }
  String? codeHit;
  for (final token in name.split(_separators)) {
    final t = token.replaceAll(RegExp(r'\d+$'), '');
    if (t.length == 2 &&
        t == t.toUpperCase() &&
        RegExp(r'^[A-Z]{2}$').hasMatch(t)) {
      if (t == 'GB') continue;
      final code = _isoAliases[t] ?? t;
      if (countryByCode.containsKey(code) && !_codeBlacklist.contains(code)) {
        codeHit = code;
        break;
      }
    }
  }
  if (codeHit == null) {
    for (final token in name.split(_separators)) {
      final t = token.replaceAll(RegExp(r'\d+$'), '');
      if (t.length == 2 &&
          t != 'GB' &&
          RegExp(r'^[A-Z]{2}$').hasMatch(t) &&
          countryByCode.containsKey(t)) {
        codeHit = t;
        break;
      }
    }
  }

  final city = cityHit;
  if (city != null && city.country != 'CN') {
    if (countryHit != null &&
        countryHit.country != city.country &&
        countryHit.country != 'CN') {
      return RegionKey(countryHit.country);
    }
    return RegionKey(city.country, city.city);
  }
  final flagCode = flag == null ? null : (_isoAliases[flag] ?? flag);
  if (flagCode != null &&
      flagCode != 'CN' &&
      countryByCode.containsKey(flagCode)) {
    return RegionKey(flagCode);
  }
  final country = countryHit;
  if (country != null && country.country != 'CN') {
    return RegionKey(country.country);
  }
  if (codeHit != null && codeHit != 'CN') {
    return RegionKey(codeHit);
  }
  return pick(city == null ? null : RegionKey(city.country, city.city)) ??
      (flagCode == 'CN' || country?.country == 'CN' || city?.country == 'CN'
          ? RegionKey('CN', city?.city)
          : null);
}
