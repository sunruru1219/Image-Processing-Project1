function n = hist_equa(f)
s = size(f);
h = zeros(1,256);
for i=1:s(1)
    for j=1:s(2)
        h(f(i,j) + 1) = h(f(i,j) + 1) + 1;
    end
end

for i=1:256
    h(i) = h(i)/(s(1)*s(2));
end


for i=2:256
    h(i) = h(i-1) + h(i);
end

n=f;
for i=1:s(1)
    for j=1:s(2)
        n(i,j) = round(h(f(i,j)+1)*255);
    end
end