function p = projectorCOL(u,v)
% This operator projects the vector v
% orthogonally onto the line spanned by vector u
if u == 0
    dimension = length(u);
    p = zeros(dimension,1);
    warning('Vector u is ZERO vector.');
else
    uv = (u.')*v;
    uu = (u.')*u;
    p = (uv/uu).*u;
end
end