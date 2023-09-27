image = imread("ferrari.JPG");
image_not_scaled=image;
gamma =2.2;
image = im2double(image);
image_raw = image.^(gamma);

figure;
set(gcf, 'Units', 'Inches', 'Position', [0, 0, 16, 10]);
ax1=subplot(2,2,1);
%ax1.Position(3:4)=[300, 300];

imshow(image);
title("Original");
ax2=subplot(2,2,2);
%ax2.Position(3:4)=[300, 300];

imshow(image_raw);
title("RAW");


more_bright= (image_raw*2);
more_bright = imadjust(more_bright, [], [], 0.5);
%more_bright = rescale(more_bright);
%fprintf("max value: %d", max(more_bright));
ax3=subplot(2,2,3);
%ax3.Position(3:4)=[300, 300];

imshow(more_bright);
title("More Brightness");
more_contrast = image_raw.^1.8;
ax4 = subplot(2,2,4);
%ax4.Position(3:4)=[300, 300];

imshow(more_contrast);
title("More Contrast");
imwrite(new_image, "subplots.jpg");
figure;
subplot(1,3,1);
new_image_red=image_not_scaled;
new_image_red(:,:, 2:3)=0;
imshow(new_image_red);

subplot(1,3,2);
new_image_green=image_not_scaled;
new_image_green(:,:, 1)=0;
new_image_green(:,:, 3)=0;
imshow(new_image_green);
subplot(1,3,3);
new_image_blue=image_not_scaled;
new_image_blue(:,:, 1:2)=0;

imshow(new_image_blue);

new_image = image;
new_image(:,:, 1)=0.5;
new_image(:,:, 2)=0.5;
new_image(:,:, 3)=0.5;
%imshow(new_image);

%1.3
%histogram_plotter(image_not_scaled);
%figure;
%subplot(1,3,1);
%imhist(image_not_scaled(:,:,1));
%title("RED")
%imhist(image_not_scaled(:,:,2));
%subplot(1,3,1);
%imhist(image_not_scaled(:,:,3));





