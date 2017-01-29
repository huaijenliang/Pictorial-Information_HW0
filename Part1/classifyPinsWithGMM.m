function [ labels ] = classifyPinsWithGMM( features, means, sigmas )
%UNTITLED6 Summary of this function goes here
%   Detailed explanation goes here

classNum = size(means, 1);
[rows, cols, dims] = size(features);

% prob = zeros(rows, cols, classNum);
features = reshape(features, [], dims, 1);

p = ones(classNum, 1) / classNum;
gmm = gmdistribution(means, sigmas, p);

prob = posterior(gmm, features);
prob = permute(prob, [1 3 2]);
prob = reshape(prob, rows, cols, classNum); 

[maxP, labels] = max(prob, [], 3);
labels = labels;% .* (maxP > 0.99);

end

