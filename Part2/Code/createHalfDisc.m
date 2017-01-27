function [ h ] = createHalfDisc( f )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
scale = size(f, 1);
orient = size(f{1}, 3);
angStep = 360.0 / orient;
h = cell(scale, 2); % h{scale, 1} and h{scale, 2} are reversed
% h = cellfun(@ceil, f, 'UniformOutput', false);

for s = 1:scale
    diameter = size(f{s}, 1);
    tempH = halfDisk(diameter);
    h{s, 1} = zeros(size(f{s}));
    h{s, 2} = zeros(size(f{s}));
    for o = 1:orient
        h{s, 1}(:, :, o) = cropCenter(imrotate(tempH, angStep * (o - 1)), size(tempH, 1), size(tempH, 2));
        h{s, 2}(:, :, o) = cropCenter(imrotate(tempH, angStep * (o - 1) + 180), size(tempH, 1), size(tempH, 2));
    end
end

end

function [ hDisk ] = halfDisk( diameter )

radius = floor(diameter / 2);
[x, y] = meshgrid(-radius:radius, -radius:radius);
hDisk = ((x.^2 + y.^2) <= radius.^2);
hDisk = hDisk & (y < 0);

end

