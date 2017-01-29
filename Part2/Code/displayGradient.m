function [ output ] = displayGradient( input )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here

input = input - min(input(:));
output = input / max(input(:));
imshow(output)

end

