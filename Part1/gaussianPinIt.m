function [ output_args ] = gaussianPinIt( filename )
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here

img = imread(filename);
img_d = im2double(img);
img_f = imgaussfilt(img_d);

img_red = im2double(imread('red_pin.png'));
img_green = im2double(imread('green_pin.png'));
img_blue = im2double(imread('blue_pin.png'));
img_yellow = im2double(imread('yellow_pin.png'));
img_white = im2double(imread('white_pin.png'));
img_trans = im2double(imread('trans_pin.png'));

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
feature_trans = computeFeature(img_trans);
[mean_trans, sigma_trans] = computeMeanAndVar(feature_trans);
% keyboard
means = cat(1, mean_red, mean_green, mean_blue, mean_yellow, mean_white);%, mean_trans);
sigmas = cat(3, sigma_red, sigma_green, sigma_blue, sigma_yellow, sigma_white);%, sigma_trans);

features = computeFeature(img_f);
labels = classifyPins(features, means, sigmas);
labels_gmm = classifyPinsWithGMM(features, means, sigmas);
l = repmat(labels_gmm, [1 1 3]);
img(l ~= 0) = 0;
imshow(img)
end

