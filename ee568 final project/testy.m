clear all;
close all;
image = imread('5.png');
scaling = 0.10;
binary = CK(image);
figure
imshow(binary);
binaryClean = BinaryCleanUp_function(binary);
figure
imshow(binaryClean);
binarySelect = ManualSelectObj(binaryClean);
figure
imshow(binarySelect);
binaryFill = FillCenter(binarySelect,6);
figure
imshow(binaryFill);
%% 
masked = ApplyMask(binaryFill,image);
imshow(masked);
