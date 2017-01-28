function [ counts ] = colorPinIt( filename )
%load image and count the total number of colored pin
%   filename: image's path
img = imread(filename);
img_d = im2double(img);
g = gaussian(5, 0.5);
img_f = imfilter(img_d, g);
imshow(img_f)
imwrite(img_f, 'denoisedImage.png');
img_lab = rgb2lab(img_f);
mask.red = img_lab(:, :, 2) > 30;
% mask.red = repmat(mask.red, [1 1 3]);
mask.green = img_lab(:, :, 2) < -30;
% mask.green = repmat(mask.green, [1 1 3]);
mask.blue = img_lab(:, :, 3) < -20;
% mask.blue = repmat(mask.blue, [1 1 3]);
mask.yellow = img_lab(:, :, 3) > 50;
% mask.yellow = repmat(mask.yellow, [1 1 3]);
[~, counts.red] = countObjects(mask.red);
[~, counts.green] = countObjects(mask.green);
[~, counts.blue] = countObjects(mask.blue);
[~, counts.yellow] = countObjects(mask.yellow);
% img_red = img;
% img_red(~mask.red) = 0;
% img_green = img;
% img_green(~mask.green) = 0;
% img_blue = img;
% img_blue(~mask.blue) = 0;
% img_yellow = img;
% img_yellow(~mask.yellow) = 0;
% imshow(img_yellow)
end