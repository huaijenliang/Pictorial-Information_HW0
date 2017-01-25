function [ h ] = createHalfDisc( f )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

h = cell(scale, 1);
h = cellfun(@ceil, f, 'UniformOutput', false);

end

