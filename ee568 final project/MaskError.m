mask = imread('mask.png');
ground = imread('6_ground.png');
error = computeErrorRate(mask,ground);
