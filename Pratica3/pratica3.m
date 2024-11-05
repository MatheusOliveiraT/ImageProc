pkg load image;

img = imread("imagem.jpg");
im = img;
imshow(im);
L = 256;

[linhas, colunas] = size(im);
[counts, x] = imhist(im);

MN = linhas * colunas;

func = zeros(1, 256, "float");

for i = 1:L
  func(i) = (L-1) * (counts(i)/MN);
endfor

func2 = zeros(1, 256, "uint8");

for i = 1:L
  for j = 1:i
    func2(i) += func(j);
  endfor
endfor

figure();
plot(1:256, func2);

for i = 1:linhas
  for j = 1:colunas
    pixel_value = im(i, j);
    im(i, j) = func2(pixel_value);
  endfor
endfor

figure();
imshow(im);
