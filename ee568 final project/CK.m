function [greenness] = CK(image)

    [height, width, planes] = size(image);
    rgb = reshape(image, height, width * planes);

    r = image(:,:, 1);% red channe

    g = image(:,:, 2); % green channel

    b = image(:,:, 3); % blue channel

    greenness = double(g) - max(double(r), double(b));

    for i = 1:height
        for j = 1:width
            if greenness(i,j) < 0
                greenness(i,j) = 0;
            else
                greenness(i,j) = 1;
            end
        end
    end

    greenness = 1-greenness;
    greenness = logical(greenness);

end

