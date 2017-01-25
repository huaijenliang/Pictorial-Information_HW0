function [ labels ] = classifyPins( features, means, sigmas )
%Classigy pins by using gaussian model
%   Detailed explanation goes here

classNum = size(means, 3);
[rows, cols, dims] = size(features);

prob = zeros(rows, cols, classNum);

features = reshape(features, [], dims, 1);

for c = 1:classNum
    tempProb = mvnpdf(features, means(:, :, c), sigmas(:, :, c));
    prob(:, :, c) = reshape(tempProb, rows, cols);
end

[~, labels] = max(prob, [], 3);

end