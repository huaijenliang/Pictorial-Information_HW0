function [ m, sigma ] = computeMeanAndVar( value )
%Compute mean and sigma of the input value
%   Detailed explanation goes here

val = reshape(value, [], size(value, 3));
m = mean(val);
sigma = cov(val);

end

