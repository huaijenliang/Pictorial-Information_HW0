function [ counts ] = colorPinIt( filename )
%load image and count the total number of colored pin
%   filename: image's path
img = imread(filename);
img_d = im2double(img);

g = gaussian(5, 3);
img_f = imfilter(img_d, g);
% imshow(img_f)
% imwrite(img_f, 'denoisedImage.png');
img_bw = ~im2bw(rgb2gray(img_f));
% img_bw = bwmorph(img_bw, 'open');
% imwrite(img_bw, 'beforeOpen.png');
[L, counts.all] = countObjects(img_bw);
img_bw = (L > 0);
% imwrite(img_bw, 'afterOpen.png');
% imshow(img_bw);

img_lab = rgb2lab(img_f);
mask.red = img_lab(:, :, 2) > 30;
% mask.red = repmat(mask.red, [1 1 3]);
mask.green = img_lab(:, :, 2) < -20;
% mask.green = repmat(mask.green, [1 1 3]);
mask.blue = img_lab(:, :, 3) < -20;
% mask.blue = repmat(mask.blue, [1 1 3]);
mask.yellow = img_lab(:, :, 3) > 50;
% mask.yellow = repmat(mask.yellow, [1 1 3]);
[L, counts.red] = countObjects(mask.red);
mask.red = repmat((L > 0), [1 1 3]);
[L, counts.green] = countObjects(mask.green);
mask.green = repmat((L > 0), [1 1 3]);
[L, counts.blue] = countObjects(mask.blue);
mask.blue = repmat((L > 0), [1 1 3]);
[L, counts.yellow] = countObjects(mask.yellow);
mask.yellow = repmat((L > 0), [1 1 3]);
img_red = img;
img_red(~mask.red) = 0;
img_green = img;
img_green(~mask.green) = 0;
img_blue = img;
img_blue(~mask.blue) = 0;
img_yellow = img;
img_yellow(~mask.yellow) = 0;
imwrite(img_red, 'redC.png');
imwrite(img_green, 'greenC.png');
imwrite(img_blue, 'blueC.png');
imwrite(img_yellow, 'yellowC.png');
end