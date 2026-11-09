function out=proj(mu,htheta,parameters)
bar_b_ext_proj=parameters.bar_b_ext_proj;

out=mu-eta1(htheta,parameters)*eta2(mu,htheta,parameters)*inv(bar_b_ext_proj).*htheta;
end

function out=eta1(s,parameters)
n_w=3;
bar_b_ext_proj=parameters.bar_b_ext_proj;
bar_hb_ext_proj=parameters.bar_hb_ext_proj;

dist=max(0,norm(s)-bar_b_ext_proj);

out=(bar_hb_ext_proj-bar_b_ext_proj)^(-n_w-1)*dist^(n_w+1);
end


function out=eta2(t,s,parameters)
bar_b_ext_proj=parameters.bar_b_ext_proj;
Delta_ext=parameters.Delta_ext;

aux=inv(bar_b_ext_proj)*t'*s;
out=aux+ (aux^2+Delta_ext^2)^(0.5);
out=0.5*out;
end
