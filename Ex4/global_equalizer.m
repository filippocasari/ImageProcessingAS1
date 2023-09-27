function [h, new_image] =global_equalizer(image, index, verbose)
    if(verbose)

        channels =["red" "green" "blue"];
        fprintf("Global Histogram Equalization for channel %s\n", channels(index));
    end
    %image=double(image);
    h=zeros(256,1);
    %disp(max(image(:,:)));
    for i=1:size(image, 1)
        for j=1:size(image,2)
            h(image(i,j,index)+1)=h(image(i,j,index)+1)+1;
        end
    
    end
    density_function=zeros(256,1);

    for i=1:size(density_function, 1)
            
            density_function(i)=(sum(h(1:i)))*255./(size(image, 1)*size(image, 2));
    end
    
    
    

    new_image = zeros(size(image, 1), size(image, 2), 'uint8');
    for i=1:size(new_image, 1)
        for j=1:size(new_image, 2)
            new_image(i, j)=ceil(density_function(image(i, j, index)+1));
        end
    end
    h=zeros(256,1);
    %disp(max(image(:,:)));
    for i=1:size(new_image, 1)
        for j=1:size(new_image,2)
            h(new_image(i,j)+1)=h(new_image(i,j)+1)+1;
        end
    
    end

end