im = imread("cat.JPG");
new_background=imread("ferrari.JPG");
sz=size(new_background);
im = imresize(im,sz(1:2));
%im_gray = rgb2gray(im);
figure;
imshow(im);

r=im(:,:,1);
g=im(:,:,2);
b=im(:,:,3);

figure
subplot(3,1,1);
histogram(r,'Facecolor',"r")
subplot(3,1,2);
histogram(g,'Facecolor',"g")
subplot(3,1,3);
histogram(b,'Facecolor',"b")
%{
n=15;
reds=zeros(n,1);
greens=zeros(n,1);
blues=zeros(n,1);
for i= 1:n
    [x,y] = ginput(1);
    x=round(x);
    y=round(y);
    background = double(squeeze(im(y, x, :)));
    reds(i)=background(1);
    greens(i)=background(2);
    blues(i)=background(3);
end


rt1=min(reds)
rt2=max(reds)
gt1=min(greens)
gt2=max(greens)
bt1=min(blues)
bt2=max(blues)
%}

rt1 =178
rt2 =206
gt1 =208
gt2 =232
bt1 =174
bt2 =203

mask=uint8(zeros(size(im,1), size(im,2)));

for i = 1:size(r,1)
    for j = 1:size(r,2)
        if(r(i,j)>=rt1 && r(i,j)<=rt2 && g(i,j)>=gt1 && g(i,j)<=gt2 && b(i,j)>=bt1 && b(i,j)<=bt2)
            r(i,j)=new_background(i,j,1);
            g(i,j)=new_background(i,j,2);
            b(i,j)=new_background(i,j,3);
            mask(i,j)=0;
            mask(i,j)=0;
            mask(i,j)=0;
        else
            mask(i,j)=1;
            mask(i,j)=1;
            mask(i,j)=1;
        end        
    end
end

figure;
%subplot(1,2,1);
imshow(mask.*255);
%subplot(1,2,2);
figure
imshow((1-mask).*255)

new_im = cat(3,r,g,b);
figure;
%subplot(1,2,1);
imshow(new_im);


new_background=imread("white_balance_input.jpg");
%im =  imresize(im,sz(1:2));
%mask = imresize(mask,sz(1:2));
new_background = imresize(new_background,sz(1:2));

new_im = (1-mask).*new_background + mask.*im;
%subplot(2,1,2);
figure
imshow(new_im);

%dog = imread("dog.jpeg");
%dog=imresize(dog,sz(1:2));
nyancat = imread("nyancat.jpeg");
nyancat=imresize(nyancat,sz(1:2));


new_im = (1-mask).*nyancat + mask.*im;
%subplot(2,1,2);
figure
imshow(new_im);

