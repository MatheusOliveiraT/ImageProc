pkg load image;

img = imread("pratica4.jpg");
im = im2double(img);

m = 9;
n = 9;

filter = zeros(m, n, "float");
for i = 1:m
  for j = 1:n
    filter(i, j) = 1/(m*n);
  endfor
endfor

I = filter2(filter, im);
imshow(I); # a borda da imagem fica mais escura com aplicação do filtro com as bordas com 0

im2 = padarray(im, [(m-1)/2,(n-1)/2], 'replicate');
J = filter2(filter, im2, 'valid');

figure();
imshow(J);

sobel1 = zeros(3, 3, "int8");
sobel2 = zeros(3, 3, "int8");

sobel1(1, 1) = -1;
sobel1(1, 2) = -2;
sobel1(1, 3) = -1;
sobel1(3, 1) = 1;
sobel1(3, 2) = 2;
sobel1(3, 3) = 1;

sobel2(1, 1) = -1;
sobel2(2, 1) = -2;
sobel2(3, 1) = -1;
sobel2(1, 3) = 1;
sobel2(2, 3) = 2;
sobel2(3, 3) = 1;

im3 = padarray(im, [1, 1], 'replicate');
sb1 = filter2(sobel1, im3);
sb2 = filter2(sobel2, im3);

K = abs(sb1) + abs(sb2);
figure();
imshow(K);
