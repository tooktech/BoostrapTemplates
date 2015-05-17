function qimage = quantize_image(image, centers)
% qimage = quantize_image(image, centers)
%
% Input:
% 'image'   28 x 28 matrix   28x28 input image
% 'centers'  k x 16 matrix   4x4 patch representatives (as vectors)
%
% Output:
% 'qimage'   7 x 7 matrix    quantized image

r = 4;
qimage = zeros(28/r,28/r);
for i=1:r:28
  for j=1:r:28
    [~,c] = min(sum(bsxfun(@minus,centers,vec(image(i:i+r-1,j:j+r-1))').^2,2));
    qimage(ceil(i/r),ceil(j/r)) = c;
  end
end

function v = vec(matrix)
% Returns the vector obtained by stacking columns of given matrix.
v = matrix(:);
