function error = computeErrorRate(mask, ground) 

% mask is the binary segmentation mask that you computed using your 
% segmentation algorithm for an image. ground is the given ground-truth 
% mask for that image. Both, mask and ground should be of size M x N,
% where M and N are the dimensions of the given images. Both, mask and 
% ground are matrices of the same type, for example, logical. When you load 
% the ground truth masks using imread, they are loaded in as uint8 matrices.
% 
% The output error is computed using the XOR measure equation given in the final project
% write up. Report this error in your project report.
% 
% Example usage:
% mask = eye(5);
% ground = eye(5);
% error = computeErrorRate(mask, ground) % this would give an error rate of 0 on the command window.

mask = uint8(mask);
ground = uint8(ground);
error = nnz(bitxor(mask, ground)) / nnz(bitor(mask, ground)) * 100;
end