function [L, count] = countObjects( input )
%Count number of blob in a BW image 
%   input: a BW image

% erosion and then dilation
input = bwmorph(input, 'open');
[L, count] = bwlabel(input);

end

