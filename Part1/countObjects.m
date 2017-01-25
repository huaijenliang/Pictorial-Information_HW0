function [L, count] = countObjects( input )
%Count number of blob in a BW image 
%   input: a BW image

% dilation and then erosion
input = bwmorph(input, 'open');
[L, count] = bwlabel(input);

end

