import 'package:material_ui/material_ui.dart';

class GlassStrings {
  const GlassStrings(this.zh, [this.lang = 'en']);

  final bool zh;

  /// Language code; appearance and icon strings are also in Japanese and Russian.
  final String lang;

  static GlassStrings of(BuildContext context) {
    final code = Localizations.maybeLocaleOf(context)?.languageCode ?? 'en';
    return GlassStrings(code == 'zh', code);
  }

  String _t(String zh, String en, String ja, String ru) => switch (lang) {
    'zh' => zh,
    'ja' => ja,
    'ru' => ru,
    _ => en,
  };

  String get appearance => _t('外观', 'Appearance', '外観', 'Оформление');
  String get themeLight => _t('浅色', 'Light', 'ライト', 'Светлая');
  String get themeDark => _t('深色', 'Dark', 'ダーク', 'Тёмная');
  String get themeSystem => _t('跟随系统', 'System', 'システム', 'Системная');
  String get icon => _t('图标', 'Icon', 'アイコン', 'Значок');
  String get iconLight => _t('浅灰', 'Light', 'ライト', 'Светлый');
  String get iconDark => _t('深灰', 'Grey', 'グレー', 'Серый');
  String get iconHintAndroid => _t(
    '桌面图标可能需要几秒钟才会更新',
    'The launcher may take a few seconds to show the new icon',
    'ホーム画面のアイコンは反映まで数秒かかる場合があります',
    'Значок на рабочем столе может обновиться через несколько секунд',
  );
  String get iconHintDesktop => _t(
    '窗口、任务栏与托盘图标立即切换；已安装的快捷方式图标不变',
    'Window, taskbar and tray icons switch now; installed shortcuts keep theirs',
    'ウィンドウ・タスクバー・トレイは即時に切り替わります（ショートカットは変わりません）',
    'Значки окна, панели задач и трея меняются сразу; ярлыки остаются прежними',
  );

  String get save => zh ? '保存' : 'Save';
  String get cancel => zh ? '取消' : 'Cancel';
  String get settings => zh ? '设置' : 'Settings';
  String get chooseRegion => zh ? '选择地区' : 'Choose a region';
  String get autoBest => zh ? '自动 · 最低延迟' : 'Auto · lowest latency';
  String get noProfile => zh ? '尚未导入配置' : 'No profile yet';
  String get importHint =>
      zh ? '在设置中导入机场订阅' : 'Import a subscription in Settings';
  String get direct => zh ? '直连模式' : 'Direct mode';
  String get noRegions =>
      zh ? '当前配置未识别到地区节点' : 'No regional nodes found in this profile';
  String get tapToSwitch => zh ? '轻点地图切换地区' : 'Tap the map to switch region';
  String get timeout => zh ? '超时' : 'Timeout';
  String get testing => zh ? '测速中' : 'Testing';
  String nodes(int n) => zh ? '$n 个节点' : '$n node${n == 1 ? '' : 's'}';
  String get running => zh ? '已连接' : 'Connected';
  String get stopped => zh ? '未连接' : 'Disconnected';
  String get start => zh ? '启动' : 'Start';
  String get stop => zh ? '停止' : 'Stop';
  String get trafficStats => zh ? '流量统计' : 'Traffic stats';
  String get profilesCardHint =>
      zh ? '导入机场订阅链接或配置文件' : 'Import a subscription URL or file';
  String get importUrl => zh ? '导入' : 'Import';
  String get update => zh ? '更新' : 'Update';
  String get manage => zh ? '管理' : 'Manage';
  String get tunHintDesktop =>
      zh ? '接管全部流量，需要管理员权限' : 'Routes all traffic, needs admin rights';
  String get tunHintAndroid =>
      zh ? '通过 VPN 接管设备流量' : 'Route device traffic through the VPN';
  String get alwaysOnTop => zh ? '窗口置顶' : 'Always on top';
  String get alwaysOnTopDesc =>
      zh ? '让小组件保持在其它窗口之上' : 'Keep the widget above other windows';
  String get tools => zh ? '更多工具' : 'More tools';
  String get upload => zh ? '上传' : 'Upload';
  String get download => zh ? '下载' : 'Download';
  String get total => zh ? '累计' : 'Total';
  String get license => zh
      ? 'Veil 是 FlClash（作者 chen08209）的修改版本，依据 GNU GPL-3.0 许可证发布。原项目 © chen08209 及贡献者。地图数据来自 Natural Earth（公共领域），图标字形基于 Outfit 字体（SIL OFL 1.1）。'
      : 'Veil is a modified version of FlClash by chen08209, released under the GNU GPL-3.0. Original project © chen08209 and contributors. Map data from Natural Earth (public domain); icon lettering based on the Outfit typeface (SIL OFL 1.1).';
  String get quit => zh ? '退出' : 'Quit';
  String get hide => zh ? '隐藏到托盘' : 'Hide to tray';
}
