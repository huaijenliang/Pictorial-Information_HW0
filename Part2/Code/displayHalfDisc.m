function [ fig ] = displayHalfDisc( h )
%UNTITLED15 Summary of this function goes here
%   Detailed explanation goes here

scale = size(h, 1);
orient = size(h{1, 1}, 3);

fig = figure;

for s = 1:scale
    for o = 1:orient
        h1 = h{s, 1}(:, :, o);
        h2 = h{s, 2}(:, :, o);
        fig;
        subplot(scale, orient * 2, (s - 1) * orient * 2 + o * 2 - 1), imshow(h1);
        subplot(scale, orient * 2, (s - 1) * orient * 2 + o * 2), imshow(h2);
    end
end

end