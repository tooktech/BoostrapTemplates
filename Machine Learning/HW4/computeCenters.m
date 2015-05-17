function centers = computeCenters(patches)
    centers.centers_8 = streaming_kemeans(patches, 8);
    centers.centers_16 = streaming_kemeans(patches, 16);
    centers.centers_32 = streaming_kemeans(patches, 32);
    centers.centers_64 = streaming_kemeans(patches, 64);
end 