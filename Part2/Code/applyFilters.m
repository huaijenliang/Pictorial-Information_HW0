function [ responds ] = applyFilters( img, f )
%Apply filter bank to input image
% Input Argument:
%   img       -input image
%   f         -input filter bank (cell array)
% Output Argument:
%   responds  -output filter responds

scale = size(f, 1);
orient = size(f{1}, 3);
responds = zeros(size(img, 1), size(img, 2), scale * orient);

for s = 1:scale
    for o = 1:orient
        filter = f{s}(:, :, o);
        responds(:, :, ((s - 1) * orient + o)) = imfilter(img, filter, 'conv');
    end
end

end


