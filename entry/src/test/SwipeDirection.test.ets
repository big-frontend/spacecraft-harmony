import { describe, it, expect } from '@ohos/hypium';
import { isUpwardDiagonalSwipe } from '../main/ets/utils/SwipeDirection';

export default function swipeDirectionTest() {
  describe('SwipeDirection', () => {
    it('accepts a right-up 45 degree swipe', 0, () => {
      expect(isUpwardDiagonalSwipe(120, -120)).assertTrue();
    });

    it('accepts a left-up 45 degree swipe', 0, () => {
      expect(isUpwardDiagonalSwipe(-120, -120)).assertTrue();
    });

    it('rejects a swipe that is too short', 0, () => {
      expect(isUpwardDiagonalSwipe(20, -20)).assertFalse();
    });

    it('rejects a mostly vertical upward swipe', 0, () => {
      expect(isUpwardDiagonalSwipe(20, -120)).assertFalse();
    });

    it('rejects a downward diagonal swipe', 0, () => {
      expect(isUpwardDiagonalSwipe(120, 120)).assertFalse();
    });
  });
}
