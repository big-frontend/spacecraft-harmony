import { promptAction } from '@kit.ArkUI';
import { AngleSwipeView } from '../components/AngleSwipeView';

@Component
export struct SplashAd {
  onFinish: () => void = () => {};
  @State statusMessage: string = '欢迎进入开屏广告页';

  build() {
    NavDestination() {
      RelativeContainer() {
        AngleSwipeView({
          onSwipe: () => {
            this.statusMessage = '45° 斜上滑触发';
            promptAction.showToast({
              message: '检测到左上/右上斜上滑',
              duration: 2000,
              bottom: 100
            });
          }
        }) {
          Column({ space: 16 }) {
            Text('开屏广告')
              .fontSize(32)
              .fontWeight(FontWeight.Bold)

            Text('在这个页面内执行斜上滑手势')
              .fontSize(18)

            Text(this.statusMessage)
              .fontSize(16)

            Button('进入首页')
              .fontSize(18)
              .onClick(() => {
                this.onFinish();
              })
          }
          .alignItems(HorizontalAlign.Center)
          .justifyContent(FlexAlign.Center)
          .width('100%')
          .height('100%')
        }

        Button('跳过')
          .fontSize(16)
          .padding({ left: 16, right: 16, top: 8, bottom: 8 })
          .alignRules({
            top: { anchor: '__container__', align: VerticalAlign.Top },
            right: { anchor: '__container__', align: HorizontalAlign.End }
          })
          .margin({ top: 24, right: 16 })
          .onClick(() => {
            this.onFinish();
          })
      }
      .width('100%')
      .height('100%')
    }
    .hideTitleBar(true)
    .hideToolBar(true)
  }
}
