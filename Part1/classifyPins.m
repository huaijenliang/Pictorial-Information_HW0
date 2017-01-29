function [ labels ] = classifyPins( features, means, sigmas )
%Classigy pins by using gaussian model
%   Detailed explanation goes here

classNum = size(means, 1);
[rows, cols, dims] = size(features);

prob = zeros(rows, cols, classNum);
labels = zeros(rows, cols, classNum);

features = reshape(features, [], dims, 1);

for c = 1:classNum
    tempProb = mvnpdf(features, means(c, :), sigmas(:, :, c));
    prob(:, :, c) = reshape(tempProb, rows, cols);
    labels(:, :, c) = prob(:, :, c) > 0.6;% (0.5 * max(max(prob(:, :, c))));
    labels(:, :, c) = imageOpenOpr(labels(:, :, c), 3);
end


end