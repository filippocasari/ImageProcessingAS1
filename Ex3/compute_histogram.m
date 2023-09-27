function [h, density_function] =compute_histogram(image, index, verbose)
    if(verbose)

        channels =["red" "green" "blue"];
        fprintf("Histogram for channel %s\n", channels(index));
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
            
            density_function(i)=(sum(h(1:i)))*255./(size(image, 1)*size(image, 2))/255;
    end
    

end