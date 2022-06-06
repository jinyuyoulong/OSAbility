OSAbility SDK 使用说明

架构图：
------------------------------
| U3D业务 	|
------------------------------
| Native原生业务 	|
------------------------------
| 录音 | 录视频 | 其他SDK 业务 |
------------------------------
| OSAbility |
------------------------------
| Apple framework 	|
------------------------------

常用模式：
- 录音模式
- 听歌模式
- 后台播放模式

常见场景：
- 来电/闹钟 中断 播放/录音
- 前后台切换 中断 播放/录音
- 拔插耳机等外设状态变更，会影响去背景音

OSAbility SDK接入流程：
swift 工程或 pod库：
```
import OSAbility

...

AudioSessionManager.shared().setRecordSession()
```
OC 工程或Pod库
```
#import <OSAbility/OSAbility-umbrella.h>

...
使用
[AudioSessionManager.shared setRecordSession];
```

通知动作：
routeChangeNoti // audio session 音频路由更改，category更改，连接/断开外设
InterruptionNoti // 音频 中断 继续

```
OC 监听
[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(audioSessionRouteChanged:)
                                                 name:AudioSessionManager.routeChangeNoti
                                               object:nil];

swift监听
NotificationCenter.default.addObserver(self, selector: #selector(xxx(info:)),
                                               name: AudioSessionManager.routeChangeNoti,
                                               object: nil)
```