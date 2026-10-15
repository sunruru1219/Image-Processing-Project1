function n = my_spatial_filter(image, x, y, filter, filter_size)
s = size(image);
image_size = s(1);
range = (filter_size-1)/2;
index=1;
n = 0;
for i = x-range:x+range
    for j = y-range:y+range
        % in origianl image range
        if (i > 0 && i <= image_size && j > 0 && j <= image_size)
            n = n + filter(index) * image(i, j);
            if (n < 0) 
                n = 0;
            elseif (n > 255) 
                n = 255;
            end
        end
        index = index + 1;  
    end
end

end