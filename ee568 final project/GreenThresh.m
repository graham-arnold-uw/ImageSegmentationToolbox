function [isgreen] = GreenThresh(y,scaling)
    yd = double(y)/255;
    % Greenness = G*(G-R)*(G-B)
    greenness = yd(:,:,2).*(yd(:,:,2)-yd(:,:,1)).*(yd(:,:,2)-yd(:,:,3));
    % Threshold the greenness value
    thresh = scaling*mean(greenness(greenness>0));
    isgreen = greenness < thresh;
    

