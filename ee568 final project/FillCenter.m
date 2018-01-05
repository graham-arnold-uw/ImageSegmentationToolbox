function [output] = FillCenter(input, size)
seD = strel('diamond',size); %default size = 6
input = imdilate(input,seD);
output = imerode(input,seD);
end

