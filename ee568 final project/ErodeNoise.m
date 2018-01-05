function [output] = ErodeNoise(input,size)
seD = strel('diamond',size); %default size 1
output = imerode(input,seD);
end

