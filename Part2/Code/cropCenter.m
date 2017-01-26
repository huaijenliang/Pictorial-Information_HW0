function [ output_img ] = cropCenter( img, height, width )
%UNTITLED9 Summary of this function goes here
%   Detailed explanation goes here

[rows, cols]  = size(img);

center_x = floor((rows + 1) / 2);
center_y = floor((cols + 1) / 2);
start_x = center_x - floor(height / 2);
end_x = center_x + floor(height / 2);
start_y = center_y - floor(width / 2);
end_y = center_y + floor(width / 2);

output_img = img(start_x:end_x, start_y:end_y);
end

