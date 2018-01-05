%% Part1 
clear all; close all
image = imread('6.png');     % read image
image = rgb2gray(image);
image = imadjust(image);
iamage = wiener2(image,[5 5]);
imshow(image);
%%
clear all 
close all
image = imread('5.png');    % read image
%image = rgb2gray(image);
%image = imadjust(image);
% get image dimensions: an RGB image has three planes
% reshaping puts the RGB layers next to each other generating
% a two dimensional grayscale image
[height, width, planes] = size(image);
rgb = reshape(image, height, width * planes);

imagesc(rgb);
%%% visualize RGB planes
colorbar                    % display colorbar

r = image(:,:, 1);% red channe
%r = med_filter(r,5);
figure
imshow(r);

g = image(:,:, 2); % green channel
%g = med_filter(g,5);
%g = rgb2gray(g);
figure
imshow(g);
b = image(:,:, 3); % blue channel
%b = med_filter(b,5);
%b = rgb2gray(b);
figure
imshow(b);

%%
% apply the blueness calculation
greenness = double(g) - max(double(r), double(b));
test = max(double(r), double(b));
figure
%imagesc(greenness);
for i = 1:471
    for j = 1:631
        if greenness(i,j) < 0
            greenness(i,j) = 0;
        else
            greenness(i,j) = 1;
        end
    end
end
title('hello');% visualize RGB planes
colorbar  
figure

greenness = 1-greenness;
greenness = logical(greenness);

imshow(greenness);
%% find biggest object in binary image
greenness = bwareafilt(greenness,1);
figure
imshow(greenness);
%% green segmentation alg
clear all;
close all;
y = imread('5.png');
yd = double(y)/255;
% Greenness = G*(G-R)*(G-B)
greenness = yd(:,:,2).*(yd(:,:,2)-yd(:,:,1)).*(yd(:,:,2)-yd(:,:,3));
% Threshold the greenness value
thresh = 0.2*mean(greenness(greenness>0));
isgreen = greenness < thresh;
%greenness = 1-isgreen;
imshow(isgreen);
greenness = isgreen;
BWfinal = greenness;
% Thicken the outline to expand the greenscreen mask a little
%% post processing
mask = imfill(greenness, 'holes');
figure 
imshow(mask);
mask = imclearborder(mask, 1);
figure
imshow(mask);
seD = strel('diamond',1);
BWfinal = imdilate(mask,seD);
BWfinal = imdilate(BWfinal,seD);
BWfinal = imerode(BWfinal,seD);
BWfinal = imerode(BWfinal,seD);
figure
imshow(BWfinal);
%%
% create a label image, where all pixels having the same value
% belong to the same object, example
% 1 1 0 1 1 0      1 1 0 2 2 0
% 0 1 0 0 0 0      0 1 0 0 0 0
% 0 0 0 1 1 0  ->  0 0 0 3 3 0
% 0 0 1 1 1 0      0 0 3 3 3 0
% 1 0 0 0 1 0      4 0 0 0 3 0
BWfinal = bwselect(BWfinal);
figure
imshow(BWfinal);


%% fill center
seD = strel('diamond',6);
BWfinal = imdilate(BWfinal,seD);
BWfinal = imerode(BWfinal,seD);
figure
imshow(BWfinal);

%% smooth edges

seD = strel('disk',5);
BWfinal = imdilate(BWfinal,seD);
BWfinal = imerode(BWfinal,seD);
figure
imshow(BWfinal);

%% erode noise
seD = strel('diamond',1);
BWfinal = imerode(BWfinal,seD);
figure
imshow(BWfinal);

%% dilate edges 
seD = strel('disk',5);
BWfinal = imdilate(BWfinal,seD);
figure
imshow(BWfinal);
%% find biggest object in binary image
BWfinal = bwareafilt(BWfinal,1);
figure
imshow(BWfinal);
