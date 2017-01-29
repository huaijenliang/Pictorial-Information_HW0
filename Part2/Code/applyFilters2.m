function [ responds ] = applyFilters2( img, f )
%Apply filter bank to input image
% Input Argument:
%   img       -input image
%   f         -input filter bank
% Output Argument:
%   responds  -output filter responds

numF = size(f, 3);
responds = zeros(size(img, 1), size(img, 2), numF);

for i = 1:numF
    responds(:, :, i) = imfilter(img, f(:, :, i), 'conv');
end

end
