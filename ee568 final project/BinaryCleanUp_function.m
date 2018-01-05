function [output] = BinaryCleanUp_function(input)
    output = imfill(input, 'holes');
    output = imclearborder(output, 1);
    seD = strel('diamond',1);
    output = imdilate(output,seD);
    output = imdilate(output,seD);
    output = imerode(output,seD);
    output = imerode(output,seD);
end

