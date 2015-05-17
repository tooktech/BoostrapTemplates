function [] = compare_side_by_side(testdata, centers, image_index)
    %quantize image by centers, and make comparision side by side
    colormap(1 - gray);
    %centers_8 = centers.centers_8;
    quantized_image = decode_qimage(quantize_image(testdata(:, :, image_index), centers), centers);
    imagesc([testdata(:, :, image_index), quantized_image]);
end