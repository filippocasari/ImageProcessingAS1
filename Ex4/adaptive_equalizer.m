function [new_image] =adaptive_equalizer(image, index, wind_size)
    
    channels =["red" "green" "blue"];
    new_image = zeros(size(image, 1), size(image,2), 'uint8');
    
    [rows, cols, ~]= size(new_image);
    
    fprintf("Adaptive Local Histogram Equalization for channel %s\n", channels(index));
    
    
    for i=(1+wind_size):(rows-wind_size)
        for j=(1+wind_size):(cols-wind_size)
            
            
                window_matrix= image(i-wind_size:i+wind_size,j-wind_size:j+wind_size, :);
            
                [~, new_image(i-wind_size:i+wind_size, j-wind_size:j+wind_size)] =  global_equalizer(window_matrix, index, false);   

            
        end
    end
    fprintf('\n');
    

end

