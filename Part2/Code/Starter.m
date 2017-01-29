%% CMSC 426: Project 1 Starter Code
% Written by: Nitin J. Sanket (nitinsan@terpmail.umd.edu)
% PhD in CS Student at University of Maryland, College Park

img = imread('../TestImages/1.jpg');
img = im2double(img);
im = rgb2gray(img);

load('filters');

%% Generate Oriented Gaussian Filter Bank
% Display all the Gaussian Filter Bank and save image as GaussianFB_ImageName.png,
% use command saveas
scales = [5, 9, 13];
% f = createFilterBank(scales, 16);
fig_f = displayFilterBank(f);

%% Generate Half-disk masks
% Display all the GHalf-disk masks and save image as HDMasks_ImageName.png,
% use command saveas
% h = createHalfDisc(f);
fig_h = displayHalfDisc(h);

%% Generate Texton Map
% Filter image using oriented gaussian filter bank
responds = applyFilters(im, f);
% Generate texture id's using K-means clustering
K = 64;
textureID = clusteringRespond(responds, K);

% Display texton map and save image as TextonMap_ImageName.png,
% use command saveas
fig_texture = imagesc(textureID); colormap(jet);

%% Generate Texton Gradient (tg)
% Perform Chi-square calculation on Texton Map
tg = computeGradient(textureID, h, K);
% Display tg and save image as tg_ImageName.png,
% use command saveas

%% Generate Brightness Map
% Perform brightness binning 
img_lab = rgb2lab(img);
brightID = floor(img_lab(:, :, 1) / 4);
bK = floor(256 / 4);

% Display brightness map and save image as BrightnessMap_ImageName.png,
% use command saveas

%% Generate Brightness Gradient (bg)
% Perform Chi-square calculation on Brightness Map
bg = computeGradient(brightID, h, bK);
% Display bg and save image as bg_ImageName.png,
% use command saveas

%% Generate Color Gradient (bg)
% Perform Chi-square calculation on Color Map
colorAID = floor(img_lab(:, :, 2) / 4);
colorBID = floor(img_lab(:, :, 3) / 4);
cK = floor(256 / 4);
cgA = computeGradient(colorAID, h, cK);
cgB = computeGradient(colorBID, h, cK);
cg = cgA + cgB;
% Display bg and save image as cg_ImageName.png,
% use command saveas

%% Get Sobel Baseline
% Uncomment the bottom line
% im is the grayscale version of the original image
% DO NOT CHANGE THE VALUES IN THE FOLLOWING FUNCTION!!
SobelPb = sobel_pb(im,0.08:0.02:.3);

% Display SobelPb and save image as SobelPb_ImageName.png
% use command saveas

%% Get Canny Baseline
% Uncomment the bottom line
% im is the grayscale version of the original image
% DO NOT CHANGE THE VALUES IN THE FOLLOWING FUNCTION!!
CannyPb = canny_pb(im,0.1:0.1:.7,1:1:4);

% Display CannyPb and save image as CannyPb_ImageName.png
% use command saveas

%% Combine responses to get pb-lite output
% A simple combination function would be: PbLite = (tg+gb).*(SobelPb+CannyPb)
PbLite = (tg + bg).*(SobelPb + CannyPb);
% Display PbLite and save image as PbLite_ImageName.png
% use command saveas



