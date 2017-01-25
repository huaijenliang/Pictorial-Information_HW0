function [ output_args ] = gaussianPinIt( input_args )
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here

img_red = imread('red_pin.png');
img_green = imread('green_pin.png');
img_blue = imread('blue_pin.png');
img_yellow = imread('yellow_pin.png');
img_white = imread('white_pin.png');
img_trans = imread('trans_pin.png');

feature_red = computeFeature(img_red);
[mean_red, sigma_red] = computeMeanAndVar(feature_red);
feature_green = computeFeature(img_green);
[mean_green, sigma_green] = computeMeanAndVar(feature_green);
feature_blue = computeFeature(img_blue);
[mean_blue, sigma_blue] = computeMeanAndVar(feature_blue);
feature_yellow = computeFeature(img_yellow);
[mean_yellow, sigma_yellow] = computeMeanAndVar(feature_yellow);
feature_white = computeFeature(img_white);
[mean_white, sigma_white] = computeMeanAndVar(feature_white);
feature_trans = computeFeature(img_trnas);
[mean_trans, sigma_trans] = computeMeanAndVar(feature_trans);
end

