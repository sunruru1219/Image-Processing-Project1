function s = power_law_trans(r, gamma)

s = double(r)^gamma;

if (s < 0)
    s = 0;
elseif (s > 256)
    s = 256;
end

end