function [ PbLite ] = myPbLite( imgDir, imgPath, f, h )
%UNTITLED6 Summary of this function goes here
%   Detailed explanation goes here

[imgName, ~] = strtok(imgPath, '.');
img = imread(strcat(imgDir, imgPath));
img = im2double(img);
im = rgb2gray(img);

%% Generate Texton Map
% Filter image using oriented gaussian filter bank
% responds = applyFilters(im, f.GG);
% responds_LM = applyFilters2(im, f.LM);
% responds_S = applyFilters2(im, f.S);
% responds_MR = applyFilters2(im, f.MR);

% Generate texture id's using K-means clustering
K = 64;
% textureID = clusteringRespond(responds, K);
% textureID_LM = clusteringRespond(responds_LM, K);
% textureID_S = clusteringRespond(responds_S, K);
% textureID_MR = clusteringRespond(responds_MR, K);
% save(strcat('results/textonCluster_', imgName), 'textureID', 'textureID_LM', 'textureID_S', 'textureID_MR');
load(strcat('results/textonCluster_', imgName));

% Display texton map and save image as TextonMap_ImageName.png,
% use command saveas
fig_texture = imagesc(textureID); colormap(jet);
saveas(gcf, strcat('../Images/TextonMap/TextonMap_', imgName, '.png'))
close
%% Generate Texton Gradient (tg)
% Perform Chi-square calculation on Texton Map
tg = computeGradient(textureID, h, K);
tg = mean(tg, 3);
tg_n = myNormalize(tg);
% Display tg and save image as tg_ImageName.png,
% use command saveas
imshow(tg_n)
saveas(gcf, strcat('../Images/tg/tg_', imgName, '.png'))
close

%% Generate Brightness Map
% Perform brightness binning 
img_lab = rgb2lab(img);
minLab = arrayfun(@(x) min(min(img_lab(:, :, x))), 1:size(img_lab, 3));
maxLab = arrayfun(@(x) max(max(img_lab(:, :, x))), 1:size(img_lab, 3));
bK = K;
binsL = linspace(minLab(1), maxLab(1), bK + 1);
brightID = getID(img_lab(:, :, 1), binsL);
fig_bright = imagesc(brightID); colormap(jet);
saveas(gcf, strcat('../Images/BrightnessMap/BrightnessMap_', imgName, '.png'))
% Display brightness map and save image as BrightnessMap_ImageName.png,
% use command saveas

%% Generate Brightness Gradient (bg)
% Perform Chi-square calculation on Brightness Map
bg = computeGradient(brightID, h, bK);
bg = mean(bg, 3);
bg_n = myNormalize(bg);
% Display bg and save image as bg_ImageName.png,
% use command saveas
imshow(bg_n)
saveas(gcf, strcat('../Images/bg/bg_', imgName, '.png'))
close

%% Generate Color Gradient (bg)
% Perform Chi-square calculation on Color Map
cK = K;
binsA = linspace(minLab(2), maxLab(2), cK + 1);
binsB = linspace(minLab(3), maxLab(3), cK + 1);
colorAID = getID(img_lab(:, :, 2), binsA);
colorBID = getID(img_lab(:, :, 3), binsB);
cgA = computeGradient(colorAID, h, cK);
cgB = computeGradient(colorBID, h, cK);
cg = cgA + cgB;
cg = mean(cg, 3);
cg_n = myNormalize(cg);
% Display bg and save image as cg_ImageName.png,
% use command saveas
imshow(cg_n)
saveas(gcf, strcat('results/cg/', imgName, '.png'))
close

%% Get Sobel Baseline
% Uncomment the bottom line
% im is the grayscale version of the original image
% DO NOT CHANGE THE VALUES IN THE FOLLOWING FUNCTION!!
SobelPb = sobel_pb(im,0.08:0.02:.3);

% Display SobelPb and save image as SobelPb_ImageName.png
% use command saveas
imshow(SobelPb)
saveas(gcf, strcat('../Images/SobelPb/SobelPb_', imgName, '.png'))
close

%% Get Canny Baseline
% Uncomment the bottom line
% im is the grayscale version of the original image
% DO NOT CHANGE THE VALUES IN THE FOLLOWING FUNCTION!!
CannyPb = canny_pb(im,0.1:0.1:.7,1:1:4);

% Display CannyPb and save image as CannyPb_ImageName.png
% use command saveas
imshow(CannyPb)
saveas(gcf, strcat('../Images/CannyPb/CannyPb_', imgName, '.png'))
close

%% Combine responses to get pb-lite output
% A simple combination function would be: PbLite = (tg+gb).*(SobelPb+CannyPb)
PbLite = (tg + bg + cg).*(0.5 * SobelPb + 0.5 * CannyPb);
PbLite = myNormalize(PbLite);
% Display PbLite and save image as PbLite_ImageName.png
% use command saveas
imshow(PbLite)
saveas(gcf, strcat('../Images/PbLite/PbLite_', imgName, '.png'))
imwrite(PbLite, strcat('results/PbLite/', imgName, '.png'))
close

end

