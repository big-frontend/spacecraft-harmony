import { promptAction } from '@kit.ArkUI';
import { AngleSwipeView } from '../components/AngleSwipeView';
import { PageRoute } from '../constants/PageRoute';

@Entry
@Component
struct Index {
  private pageStack: NavPathStack = new NavPathStack();
  private hasShownSplashAd: boolean = false;
  @State isSplashShowing: boolean = false;
  @State message: string = 'Hello World';
  @State splashStatusMessage: string = '欢迎进入开屏广告页';

  aboutToAppear() {
    if (!this.hasShownSplashAd) {
      this.hasShownSplashAd = true;
      this.openSplashAd();
    }
  }

  @Builder
  private buildDestination(name: string) {
    if (name === PageRoute.SPLASH_AD) {
      NavDestination() {
        RelativeContainer() {
          AngleSwipeView({
            onSwipe: () => {
              this.splashStatusMessage = '45° 斜上滑触发';
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

              Text(this.splashStatusMessage)
                .fontSize(16)

              Button('进入首页')
                .fontSize(18)
                .onClick(() => {
                  this.closeSplashAd();
                })
            }
            .alignItems(HorizontalAlign.Center)
            .justifyContent(FlexAlign.Center)
            .width('100%')
            .height('100%')
          }

          Button('跳过')
            .fontSize(16)
            .padding({
              left: 16,
              right: 16,
              top: 8,
              bottom: 8
            })
            .alignRules({
              top: { anchor: '__container__', align: VerticalAlign.Top },
              right: { anchor: '__container__', align: HorizontalAlign.End }
            })
            .margin({ top: 24, right: 16 })
            .onClick(() => {
              this.closeSplashAd();
            })
        }
        .width('100%')
        .height('100%')
      }
      .hideTitleBar(true)
      .hideToolBar(true)
    }
  }

  private openSplashAd() {
    if (this.isSplashShowing) {
      return;
    }

    this.splashStatusMessage = '欢迎进入开屏广告页';
    this.isSplashShowing = true;
    this.pageStack.pushPathByName(PageRoute.SPLASH_AD, null);
  }

  private closeSplashAd() {
    if (!this.isSplashShowing) {
      return;
    }

    this.isSplashShowing = false;
    this.pageStack.pop();
  }

  private tryOpenBusinessDialog() {
    if (this.isSplashShowing) {
      promptAction.showToast({
        message: '开屏广告展示中，不弹业务弹窗',
        duration: 1500,
        bottom: 100
      });
      return;
    }

    AlertDialog.show({
      title: '业务弹窗',
      message: '开屏广告关闭后，业务弹窗才允许显示。',
      primaryButton: {
        value: '知道了',
        action: () => {
        }
      }
    });
  }

  build() {
    Navigation(this.pageStack) {

      Column({ space: 24 }) {
        Text('首页')
          .fontSize(32)
          .fontWeight(FontWeight.Bold)

        Text(this.message)
          .id('HelloWorld')
          .fontSize(28)
          .fontWeight(FontWeight.Medium)
          .onClick(() => {
            this.message = '点击了首页文字';
            this.openSplashAd();
          })

        Button('重新打开开屏广告')
          .fontSize(18)
          .onClick(() => {
            this.openSplashAd();
          })

        Button('显示业务弹窗')
          .fontSize(18)
          .onClick(() => {
            this.tryOpenBusinessDialog();
          })
      }

      .justifyContent(FlexAlign.Center)
      .alignItems(HorizontalAlign.Center)
      .height('100%')
      .width('100%')
    }

    .hideTitleBar(true)
    .navDestination(this.buildDestination)
    .height('100%')
    .width('100%')
  }
}
