pkg load image;

img = imread("pollen.jpg");
im = zeros(889, 889, "uint8");
im = img;
imshow(im);

r1 = 90;
r2 = 140;
s1 = 20;
s2 = 230;

func = zeros(1, 256, "uint8");

m1 = (s1-0) / (r1-0);
for i = 1:r1
  func(i) = 0 + m1 * (i - 0);
endfor

m2 = (s2-s1) / (r2-r1);
for i = r1+1:r2
  func(i) = s1 + m2 * (i - r1);
endfor

m3 = (255-s2) / (255-r2);
for i = r2+1:256
  func(i) = s2 + m3 * (i - r2);
endfor

figure();
plot(1:256, func);

[linhas, colunas] = size(im);

for i = 1:linhas
  for j = 1:colunas
   pixel_value = im(i, j);
   im(i, j) = func(pixel_value);
  endfor
 endfor

 figure();
 imshow(im);
