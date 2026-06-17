import { describe, it, expect } from '@ohos/hypium';
import { PageRoute } from '../main/ets/constants/PageRoute';

export default function pageRouteTest() {
  describe('PageRoute', () => {
    it('exposes the splash ad navigation destination name', 0, () => {
      expect(PageRoute.SPLASH_AD).assertEqual('SplashAd');
    });
  });
}
