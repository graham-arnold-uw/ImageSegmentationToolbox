function [output] = DilateEdges(input,size)
seD = strel('disk',size); %default size 5
output = imdilate(input,seD);
end

