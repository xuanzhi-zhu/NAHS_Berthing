function out = alpha2(s,parameters)
%continuously differentiable
%alpha2(0)=0
%strictly increasing on real

k_alpha2=10;%0.1  %smaller==>smaller initial control

out=k_alpha2*s;

end

