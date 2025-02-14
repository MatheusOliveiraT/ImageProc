pkg load image;

img = imread('pratica5.png');
im = im2double(img);

[m, n] = size(im);

fourier = fft2(im, m*2, n*2);
shiftedFourier = fftshift(fourier);

spectrum = zeros(m*2, n*2, 'uint8');

for i = 1:m*2
  for j = 1:n*2
   spectrum(i, j) = abs(shiftedFourier(i, j));
  endfor
endfor

imshow(spectrum);

D0 = 20;

lowPassGaussian = zeros(m*2, n*2, 'double');

for i = 1:m*2
  for j = 1:n*2
    lowPassGaussian(i, j) = exp(-((((i - m)^2 + (j - n)^2)^(1/2))^2)/(2 * (D0^2)));
  endfor
endfor

shiftedGaussianFourierImage = shiftedFourier .* lowPassGaussian;
gaussianFourierImage = ifftshift(shiftedGaussianFourierImage);

gaussianImage = ifft2(gaussianFourierImage);
realImage = real(gaussianImage);

finalImage = realImage(1:m, 1:n);
final = im2uint8(finalImage);
figure();
imshow(final);
