function [ f ] = createFilterBank( scales, orient )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

sobel = [ 1 2 1; 0 0 0; -1 -2 -1];
num_scales = numel(scales);
f = cell(num_scales, 1);

angStep = 360.0 / orient;
for s = 1:num_scales
    g = gaussian((5 + (s - 1) * 2), scales(s));
    tempF = conv2(sobel, g);
    % keyboard
    rotateF = zeros(size(tempF, 1), size(tempF, 2), orient);
    for o = 1:orient
        rotateF(:, :, o) =  imrotate(tempF, angStep * (o - 1), 'bilinear', 'crop');
    end
    f{s} = rotateF;
end

end

