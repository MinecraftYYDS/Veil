import 'package:material_ui/material_ui.dart';

class GlassStrings {
  const GlassStrings(this.zh);

  final bool zh;

  static GlassStrings of(BuildContext context) {
    final locale = Localizations.maybeLocaleOf(context);
    return GlassStrings(locale?.languageCode == 'zh');
  }

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
      ? '本应用是 FlClash 的修改版本，依据 GNU GPL-3.0 许可证发布。原项目 © chen08209 及贡献者。'
      : 'This app is a modified version of FlClash, released under the GNU GPL-3.0. Original project © chen08209 and contributors.';
  String get quit => zh ? '退出' : 'Quit';
  String get hide => zh ? '隐藏到托盘' : 'Hide to tray';
}
