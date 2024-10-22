pkg load image;

img = imread("tungsten_filament_shaded.tif");
shade = imread("tungsten_sensor_shading.tif");
imshow(img)
img = im2double(img);
shade = im2double(shade);
img = img ./ shade;

figure()
imshow(img)
