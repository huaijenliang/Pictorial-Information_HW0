function [ g ] = computeGradient( input, h , K)
%UNTITLED10 Summary of this function goes here
%   Detailed explanation goes here

scale = size(h, 1);
orient = size(h{1, 1}, 3);
g = zeros(size(input, 1), size(input, 2), scale * orient);


for s = 1:scale
    for o = 1:orient
        tempG = input * 0;
        for k = 1:K
            tmp = (input == k);
            g_i = imfilter(tmp, h{s, 1}(:, :, o), 'conv');
            h_i = imfilter(tmp, h{s, 2}(:, :, o), 'conv');
            tempG = tempG + (g_i - h_i).^2 / (g_i + h_i);
        end
        g(:, :, ((s - 1) * orient + o)) = tempG;
    end
end

end

