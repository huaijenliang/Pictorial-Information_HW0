function [ output_ID ] = getID( input, bins )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

output_ID = zeros(size(input));

for i = 1:(numel(bins) - 1)
    mask = ((input >= bins(i)) & (input < bins(i + 1)));
    output_ID(mask) = i; 
end

end

