import { isUpwardDiagonalSwipe } from '../utils/SwipeDirection';

@Component
export struct AngleSwipeView {
  minDistance: number = 80;
  angleTolerance: number = 20;
  onSwipe: () => void = () => {};

  @Builder
  defaultContent() {
  }

  @BuilderParam content: () => void = this.defaultContent;

  build() {
    Stack() {
      this.content();
    }
    .width('100%')
    .height('100%')
    .gesture(
      PanGesture({ direction: PanDirection.All, distance: 1 })
        .onActionEnd((event: GestureEvent) => {
          if (isUpwardDiagonalSwipe(event.offsetX, event.offsetY, {
            minDistance: this.minDistance,
            angleTolerance: this.angleTolerance
          })) {
            this.onSwipe();
          }
        })
    )
  }
}
