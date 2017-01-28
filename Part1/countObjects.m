function [L, count] = countObjects( input )
%Count number of blob in a BW image 
%   input: a BW image

% erosion and then dilation
input = imageOpenOpr(input, 3);
[L, count] = bwlabel(input);

end

