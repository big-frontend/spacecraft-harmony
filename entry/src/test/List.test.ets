import localUnitTest from './LocalUnit.test';
import pageRouteTest from './PageRoute.test';
import swipeDirectionTest from './SwipeDirection.test';

export default function testsuite() {
  localUnitTest();
  pageRouteTest();
  swipeDirectionTest();
}
