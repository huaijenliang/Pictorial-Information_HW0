function [ m, sigma ] = computeMeanAndVar( value )
%Compute mean and sigma of the input value
%   Detailed explanation goes here

m = mean(value);
sigma = cov(value);

end

