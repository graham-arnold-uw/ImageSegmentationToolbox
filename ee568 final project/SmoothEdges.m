function [output] = SmoothEdges(input, size)
seD = strel('disk',size); %default size 5
input = imdilate(input,seD);
output = imerode(input,seD);
end

