function [ clusterID ] = clusteringRespond( responds, K )
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here

rResponds = reshape(responds, [], size(responds, 3));
clusterID = kmeans(rResponds, K);
clusterID = reshape(clusterID, size(responds, 1), []);
end

