function [ output_img ] = imageOpenOpr( img, radius )
%UNTITLED7 Summary of this function goes here
%   Detailed explanation goes here

d = strel('disk', radius);
output_img = imerode(img, d);
output_img = imdilate(output_img, d);

end

