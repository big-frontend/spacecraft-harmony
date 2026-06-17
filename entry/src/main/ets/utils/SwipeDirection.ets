export interface SwipeDetectionOptions {
  minDistance?: number;
  targetAngle?: number;
  angleTolerance?: number;
}

const DEFAULT_MIN_DISTANCE: number = 80;
const DEFAULT_TARGET_ANGLE: number = 45;
const DEFAULT_ANGLE_TOLERANCE: number = 20;

export function isUpwardDiagonalSwipe(
  offsetX: number,
  offsetY: number,
  options: SwipeDetectionOptions = {}
): boolean {
  const minDistance: number = options.minDistance ?? DEFAULT_MIN_DISTANCE;
  const targetAngle: number = options.targetAngle ?? DEFAULT_TARGET_ANGLE;
  const angleTolerance: number = options.angleTolerance ?? DEFAULT_ANGLE_TOLERANCE;

  if (offsetY >= 0) {
    return false;
  }

  const distance: number = Math.hypot(offsetX, offsetY);
  if (distance < minDistance) {
    return false;
  }

  const absoluteAngle: number = Math.atan2(Math.abs(offsetY), Math.abs(offsetX)) * 180 / Math.PI;
  return Math.abs(absoluteAngle - targetAngle) <= angleTolerance;
}
