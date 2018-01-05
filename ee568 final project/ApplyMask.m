function [output] = ApplyMask(input,original)
output = bsxfun(@times, original, cast(input,class(original)));
end

