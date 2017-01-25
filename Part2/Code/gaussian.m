function [ g ] = gaussian( size, sig )
%Create sizeXsize gaussian kernel with sigma = sig
%   Detailed explanation goes here
[X Y] = meshgrid(fix(-size / 2):fix(size / 2), fix(-size / 2):fix(size / 2));
g = exp(-(X.^2 + Y.^2) / (2 * sig.^2));
%normalized
g = g ./ sum(g(:));
end

