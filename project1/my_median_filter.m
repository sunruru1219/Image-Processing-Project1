function n = my_median_filter(image, x, y, filter_size)
s = size(image);
image_size = s(1);
range = (filter_size-1)/2;

index = 1;
arr = [];
for i = x-range:x+range
    for j = y-range:y+range
        if (i > 0 && i <= image_size && j > 0 && j <= image_size)
            arr(index) = image(i, j);
            index = index + 1;
        end
    end
end

n = median(arr, 'all');

end