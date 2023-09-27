
im = imread("white_balance_input.jpg");
im = double(im)./255;
gamma = 2.2
im = im.^(gamma);
figure;
%axis on;
%subplot(1,4,1);
imshow(im);
size(im);
r=im(:,:,1);
g=im(:,:,2);
b=im(:,:,3);

mr = mean(mean(r));
mg = mean(mean(g));
mb = mean(mean(b));
mrgb=[mr,mg,mb]'

%%PIXEL BASED CORRECTION
[x,y] = ginput(1);
x=round(x)
y=round(y)

pixel_vals = double(squeeze(im(y, x, :)))

gain = mean(mrgb)./pixel_vals
%gain = pixel_vals./mrgb

rc=r.*gain(1);
gc=g.*gain(2);
bc=b.*gain(3);

im_pixel_corrected = cat(3,rc,gc,bc);

%subplot(1,4,2);
figure
imshow(im_pixel_corrected)

corrected_pixel_vals = double(squeeze(im_pixel_corrected(y, x, :)))

%%GREY WORLD CORRECTION1
%grey=[0.5 0.5 0.5]'
grey=mean(mrgb);
gain=grey./mrgb

rc=r.*gain(1);
gc=g.*gain(2);
bc=b.*gain(3);

im_grey_corrected = cat(3,rc,gc,bc);

%subplot(1,4,3);
figure
imshow(im_grey_corrected);

r=im_grey_corrected(:,:,1);
g=im_grey_corrected(:,:,2);
b=im_grey_corrected(:,:,3);
mr = mean(mean(r));
mg = mean(mean(g));
mb = mean(mean(b));
gray_corrected_mrgb=[mr,mg,mb]'


im_pixel_corrected = im_pixel_corrected.^(1/gamma);
im_grey_corrected = im_grey_corrected.^(1/gamma);

figure
imshow(im_pixel_corrected);
figure
imshow(im_grey_corrected);
        


