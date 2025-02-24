pkg load image;

img = imread("imagem.jpg");
img = im2double(img);

hsvimg = rgb2hsv(img);
H = hsvimg(:,:,1);
S = hsvimg(:,:,2);
I = hsvimg(:,:,3);

[m, n] = size(I);

fourier = fft2(I, m*2, n*2);
shiftedFourier = fftshift(fourier);

notch = imread('notch.png');
notch = rgb2gray(notch);
notch = im2double(notch);

shiftedNotchFourierImage = shiftedFourier .* notch;
notchFourierImage = ifftshift(shiftedNotchFourierImage);

notchImage = ifft2(notchFourierImage);
realImage = real(notchImage);

finalImage = realImage(1:m, 1:n);
final = im2uint8(finalImage);

for i = 1:m
  for j = 1:n
    final(i, j) = final(i, j) ^ 1.05;
  endfor
endfor

final = im2double(final);

img_reconstruida = cat(3, H, S, final);
img_reconstruida = hsv2rgb(img_reconstruida);
figure();
imshow(img_reconstruida);
