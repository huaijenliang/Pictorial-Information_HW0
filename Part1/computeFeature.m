function [ output ] = computeFeature( input )
%Compute a M x N x 1 feature vector from M x N x k input matrix
%   Detailed explanation goes here

output = input(:, :, 1:3);% ./ sum(input(:, :, 3), 3);

end

