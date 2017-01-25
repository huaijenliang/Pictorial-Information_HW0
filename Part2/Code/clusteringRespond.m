function [ clusterID ] = clusteringRespond( responds, K )
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here

responds = reshape(responds, [], size(respond, 3));
clusterID = kmeans(responds, K);

end

