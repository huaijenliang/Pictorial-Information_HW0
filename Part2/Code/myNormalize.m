function [ output ] = myNormalize( input )
%UNTITLED7 Summary of this function goes here
%   Detailed explanation goes here

minIn = min(input(:));
maxIn = max(input(:));
output = (input - minIn) ./ (maxIn - minIn);

end

