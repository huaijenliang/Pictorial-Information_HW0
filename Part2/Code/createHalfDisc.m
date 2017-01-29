function [ h ] = createHalfDisc( radius, orient )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
numR = numel(radius);
angStep = 180.0 / orient;
h = cell(numR, 2); % h{radius, 1} and h{radius, 2} are reversed
% h = cellfun(@ceil, f, 'UniformOutput', false);

for s = 1:numR
    diameter = radius(s);
    tempH = halfDisk(diameter);
    h{s, 1} = zeros(size(tempH, 1), size(tempH, 2), orient);
    h{s, 2} = zeros(size(tempH, 1), size(tempH, 2), orient);
    for o = 1:orient
        h{s, 1}(:, :, o) = imrotate(tempH, angStep * (o - 1), 'bilinear', 'crop');
        h{s, 2}(:, :, o) = imrotate(tempH, angStep * (o - 1) + 180, 'bilinear', 'crop');
    end
end

end

function [ hDisk ] = halfDisk( diameter )

radius = floor(diameter / 2);
[x, y] = meshgrid(-radius:radius, -radius:radius);
hDisk = ((x.^2 + y.^2) <= radius.^2);
hDisk = hDisk & (y < 0);

end

