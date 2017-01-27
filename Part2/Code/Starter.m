%% CMSC 426: Project 1 Starter Code
% Written by: Nitin J. Sanket (nitinsan@terpmail.umd.edu)
% PhD in CS Student at University of Maryland, College Park

img = imread('../TestImages/1.jpg');
im = rgb2gray(img);

%% Generate Oriented Gaussian Filter Bank
% Display all the Gaussian Filter Bank and save image as GaussianFB_ImageName.png,
% use command saveas
f = createFilterBank(2, 16);

%% Generate Half-disk masks
% Display all the GHalf-disk masks and save image as HDMasks_ImageName.png,
% use command saveas
h = createHalfDisc(f);

%% Generate Texton Map
% Filter image using oriented gaussian filter bank
responds = applyFilters(im, f);
% Generate texture id's using K-means clustering
K = 64;
textureID = clusteringRespond(responds, K);
% Display texton map and save image as TextonMap_ImageName.png,
% use command saveas

%% Generate Texton Gradient (tg)
% Perform Chi-square calculation on Texton Map
tg = computeGradient(textureID, h, K);
% Display tg and save image as tg_ImageName.png,
% use command saveas

%% Generate Brightness Map
% Perform brightness binning 
brightID = floor(im / 4);
bK = floor(256 / 4);

% Display brightness map and save image as BrightnessMap_ImageName.png,
% use command saveas

%% Generate Brightness Gradient (bg)
% Perform Chi-square calculation on Brightness Map
bg = computeGradient(brightID, h, bK);
% Display bg and save image as bg_ImageName.png,
% use command saveas

%% Get Sobel Baseline
% Uncomment the bottom line
% im is the grayscale version of the original image
% DO NOT CHANGE THE VALUES IN THE FOLLOWING FUNCTION!!
% SobelPb = sobel_pb(im,0.08:0.02:.3);

% Display SobelPb and save image as SobelPb_ImageName.png
% use command saveas

%% Get Canny Baseline
% Uncomment the bottom line
% im is the grayscale version of the original image
% DO NOT CHANGE THE VALUES IN THE FOLLOWING FUNCTION!!
% CannyPb = canny_pb(im,0.1:0.1:.7,1:1:4);

% Display CannyPb and save image as CannyPb_ImageName.png
% use command saveas

%% Combine responses to get pb-lite output
% A simple combination function would be: PbLite = (tg+gb).*(SobelPb+CannyPb)

% Display PbLite and save image as PbLite_ImageName.png
% use command saveas



