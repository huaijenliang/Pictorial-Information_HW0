function [ label ] = classiyPins( features, means, sigmas )
%Classigy pins by using gaussian model
%   Detailed explanation goes here

[rows, cols, ~] = size(features);

labels = zeros(rows, cols);

for r = 1:rows
    for c = 1:cols
        labels(r, c) = findMaxGaussian(features(r, c, :), means, sigmas);
    end
end

end

