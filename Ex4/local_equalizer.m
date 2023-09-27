function [new_image] =local_equalizer(image, index, wind_size)
    
    wind_size=wind_size/2;
    new_image = zeros(size(image, 1), size(image,2), 'uint8');
    %padded_image = padarray(image, [wind_size wind_size], 0);
    [rows, cols, ~]= size(new_image);
    %fprintf("size padded image %d %d %d\n", size(padded_image));
    %fprintf("size new image %d %d %d %d\n", size(new_image));
    channels =["red" "green" "blue"];
    fprintf("Local Histogram Equalization for channel %s\n", channels(index));
    %disp(padded_image(1:5,1:5, index));
    % 301...6700
    for i=(1+wind_size):(wind_size*2):(rows-wind_size)+1
        for j=(1+wind_size):(wind_size*2):(cols-wind_size)+1
            if(j==(cols-wind_size)+1 || i==(rows-wind_size)+1)
                window_matrix= image(i-wind_size:i+wind_size-1,j-wind_size:j+wind_size-1, :);
            
                [~, new_image(i-wind_size:i+wind_size-1, j-wind_size:j+wind_size-1)]=  global_equalizer(window_matrix, index, false);   %compute_density_value(window_matrix, wind_size);
            else
            
                window_matrix= image(i-wind_size:i+wind_size,j-wind_size:j+wind_size, :);
            
                [~, new_image(i-wind_size:i+wind_size, j-wind_size:j+wind_size)]=  global_equalizer(window_matrix, index, false);   %compute_density_value(window_matrix, wind_size);

            end
        end
    end
    fprintf('\n');
    
    
    

end

function[pdf_value]=compute_density_value(image, wind_size)
    %values_array=zeros(256);
    wind_size_items=wind_size*wind_size;

    pdf_value=0;
    for i=1:256
         %values_array(i) = ;
         pdf_value=pdf_value+(sum(image == i-1, "all")/(wind_size_items))*255;

         %fprintf("%d ", sum(image(:) == i-1));
         
    end

end