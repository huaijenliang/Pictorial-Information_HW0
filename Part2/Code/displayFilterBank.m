function [ fig ] = displayFilterBank( f )
%UNTITLED12 Summary of this function goes here
%   Detailed explanation goes here

scale = size(f, 1);
orient = size(f{1}, 3);

ff = tight_subplot(scale, orient, [.0001 .003], [.00001 .000001], [.001 .001]);;

for s = 1:scale
    for o = 1:orient
        filter = f{s}(:, :, o);
        filter = filter - min(filter(:));
        filter = filter / max(filter(:));
        axes(ff((s - 1) * orient + o)), imshow(filter);
    end
end

end

