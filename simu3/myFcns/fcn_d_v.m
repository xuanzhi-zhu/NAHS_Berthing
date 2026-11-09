function out = fcn_d_v(xp,parameters)
D_v=parameters.D_v;
v=xp(5:6);

out=-D_v*v;

end

