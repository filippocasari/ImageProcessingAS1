addpath("images/");
addpath("Ex4/");
im = imread("ferrari.JPG");
%im = rgb2hsv(im);
%disp(class(im));
user_input = input('Please choose: 1 or 2 or 3 (global, local, adaptive): ');
if(user_input==1)

    fig=figure;
    
    subplot(3,1,1);
    [h1, new_image_red]=global_equalizer(im, 1, true);
    bar(h1);
    grid on;
    subplot(3,1,2);
    [h2, new_image_green]=global_equalizer(im, 2, true);
    bar(h2);
    grid on;
    subplot(3,1,3);
    [h3, new_image_blue]=global_equalizer(im, 3, true);
    bar(h3);
    sgtitle('Histogram new equalized image') ;
    
    grid on;
    
    figure;
    
    subplot(2,1,1);
    imshow(im);
    title("original");
    subplot(2,1,2);
    new_image = cat(3, new_image_red, new_image_green, new_image_blue);
    %disp(size(im));
    %disp(size(new_image));
    imshow(new_image);
    title("Global histogram equalization image");
    imwrite(new_image, "Ex4/global_equalizer.jpg");
    figure;
    %disp(new_image(1:1, :, :));
    %disp(class(new_image));
    histogram(new_image, 256);
elseif(user_input==2)



% -----------       local histogram equalization mathod -----------



    window_size=1000;
    new_image_red=local_equalizer(im, 1, window_size);
    
    
    new_image_green=local_equalizer(im, 2, window_size);
    
    new_image_blue=local_equalizer(im, 3, window_size);
    
    figure;
    
    subplot(2,1,1);
    imshow(im);
    title("original");
    subplot(2,1,2);
    new_image = cat(3, new_image_red, new_image_green, new_image_blue);
    %disp(size(im));
    %disp(size(new_image));
    imshow(new_image);
    title("Local histogram equalization image");
    imwrite(new_image, "Ex4/local_equalizator.jpg");
    %figure;
    %disp(new_image(1:1, :, :));
    %disp(class(new_image));
    %histogram(new_image, 256); 
else


%----------------------     adaptive local histogram equalization -----
    figure;
    %im2 = imread("white_balance_input.jpg");
    im2 = imresize(im, 0.1);
    window_size=50;
    new_image_red=adaptive_equalizer(im2, 1, window_size);
    
    
    new_image_green=adaptive_equalizer(im2, 2, window_size);
    
    
    new_image_blue=adaptive_equalizer(im2, 3, window_size);
    
    
    
    subplot(2,1,1);
    imshow(im2);
    title("original");
    subplot(2,1,2);
    new_image = cat(3, new_image_red, new_image_green, new_image_blue);
    
    imshow(new_image);
    title("Adaptive Local histogram equalization image");
    
    imwrite(new_image, "Ex4/adaptive_equalizator.jpg");
end


