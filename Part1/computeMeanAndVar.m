function [ m, sigma ] = computeMeanAndVar( value, mask )
%Compute mean and sigma of the input value
%   Detailed explanation goes here

m = mean(value(mask));
sigma = cov(value(mask));

end

