function [ f ] = createFilterBank( scale, orient )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

sobel = [ 1 2 1; 0 0 0; -1 -2 -1];
f = cell(scale, 1);

angStep = 360.0 / orient;
for s = 1:scale
    g = gaussian(5, 3);
    tempF = conv2(sobel, g);
    % keyboard
    rotateF = zeros(size(tempF, 1), size(tempF, 2), orient);
    for o = 1:orient
        rotateF(:, :, o) =  cropCenter(imrotate(tempF, angStep * (o - 1)), size(tempF, 1), size(tempF, 2));
    end
    f{s} = rotateF;
end

end

