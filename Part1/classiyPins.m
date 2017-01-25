function [ labels ] = classiyPins( features, means, sigmas )
%Classigy pins by using gaussian model
%   Detailed explanation goes here

classNum = size(means, 3);
[rows, cols, dims] = size(features);

labels = zeros(rows, cols, classNum);

features = reshape(features, [], dims, 1);

for c = 1:classNum
    labels(:, :, c) = mvnpdf(features, means(:, :, c), sigmas(:, :, c));
end

end

