%% CMSC 426: Project 1 Starter Code
% Written by: Nitin J. Sanket (nitinsan@terpmail.umd.edu)
% PhD in CS Student at University of Maryland, College Park

load('filters');

%% Generate Oriented Gaussian Filter Bank
% Display all the Gaussian Filter Bank and save image as GaussianFB_ImageName.png,
% use command saveas
scales = [1, 1.5, 2];
f = createFilterBank(scales, 16);
f_LM = makeLMfilters();
f_S = makeSfilters();
f_MR = makeRFSfilters();
% fig_f = displayFilterBank(f);

%% Generate Half-disk masks
% Display all the GHalf-disk masks and save image as HDMasks_ImageName.png,
% use command saveas
radius = [9, 13, 15];
h = createHalfDisc(radius, 8);
% fig_h = displayHalfDisc(h);
save('filters_gaussian', 'f', 'h');

imageDir = '../TestImages/';
testImg = dir([imageDir, '*.jpg']);

for i = 1:length(testImg)
    disp(strcat('Computing pb-lite for ', testImg(i).name));
    PbLite = myPbLite(imageDir, testImg(i).name, f, h);
end



