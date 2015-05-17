function image = decode_image(qimage, centers)
% image = decode_image(qimage, centers)
%
% Input:
% 'qimage'   7 x 7 matrix    input quantized image
% 'centers'  k x 16 matrix   4x4 patch representatives (as vectors)
%
% Output:
% 'image'    28 x 28 matrix  28x28 image

r = 4;
image = zeros(28,28);
for i=1:r:28
  for j=1:r:28
    c = qimage(ceil(i/r),ceil(j/r));
    image(i:i+r-1,j:j+r-1) = reshape(centers(c,:),r,r);
  end
end

