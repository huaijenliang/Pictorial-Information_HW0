HW0 for Pictorial Information

Part 1:

To use color information to segment out colored objects, simply call function
[ counts ] = colorPinIt( filename )
	filename = the string of the path of an input image
	counts = a struct of the number of objects of each color

To use gaussian model to segment out colored objects, simply call function
[ labels, labels_gmm, outImg ] = gaussianPinIt( filename )
	filename = the string of the path of an input image
	labels = a MxNxC logical matrix represent each pixel wheather belong to a color or not
		M, N: the size of the input image
		C: the number of color to classify(1:red, 2:green, 3:blue, 4:yellow, 5:white, 6:transparent)
	labels = a MxN matrix represent each pixel belong which color
		1:red, 2:green, 3:blue, 4:yellow, 5:white, 6:transparent


Part 2:

To run Pb-Lite on all test images, simply run Starter.m
To run a specific images, simply call function
function [ PbLite ] = myPbLite( imgDir, imgPath, f, h )
	imgDir = the string of the path to the folder contains the target image
	imgPath = the string of the name of the target image
	f = a struct contains different type of filter banks
	h = half-disk
		you can load filter banks and half-disk from filters_gaussian.mat
	PbLite = Output response of pb-lite in [0, 1]