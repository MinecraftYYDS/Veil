import 'package:fl_clash/glass/region.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final cases = <String, String?>{
    '🇯🇵 日本 东京 01': 'JP/tokyo',
    '🇭🇰 香港 IPLC 02': 'HK',
    '香港-01': 'HK',
    'HK 03 x1.5': 'HK',
    '🇸🇬 Singapore 01': 'SG',
    '新加坡 狮城 02': 'SG',
    '🇺🇸 美国 洛杉矶 01': 'US/losangeles',
    'US-LosAngeles-02': 'US/losangeles',
    'United States San Jose': 'US/sanjose',
    '🇬🇧 英国 伦敦': 'GB/london',
    'UK London 01': 'GB/london',
    '🇩🇪 Germany Frankfurt': 'DE/frankfurt',
    '🇹🇼 台湾 台北 01': 'TW/taipei',
    '台湾省 02': 'TW',
    'Taiwan 03': 'TW',
    'JP-Osaka': 'JP/osaka',
    '广港 IPLC 01': 'HK',
    '上海-日本 01': 'JP',
    '剩余流量：100 GB': null,
    '套餐到期：2026-12-31': null,
    'France Paris': 'FR/paris',
    '🇰🇷 韩国 首尔': 'KR/seoul',
    'Romania 01': 'RO',
    'Oman 01': null,
  };
  for (final entry in cases.entries) {
    test('parse ${entry.key}', () {
      expect(parseRegion(entry.key)?.id, entry.value);
    });
  }

  test('strip flags', () {
    expect(stripFlags('🇯🇵 日本 东京 01'), '日本 东京 01');
    expect(stripFlags('🇹🇼台湾'), '台湾');
  });

  test('labels', () {
    expect(const RegionKey('JP', 'tokyo').label(zh: false), 'Tokyo Japan');
    expect(const RegionKey('JP', 'tokyo').label(zh: true), '东京 日本');
    expect(const RegionKey('TW').label(zh: true), '台湾地区');
    expect(const RegionKey('TW', 'taipei').label(zh: false), 'Taipei Taiwan Region');
  });
}
