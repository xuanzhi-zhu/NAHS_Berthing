function out = fcn_d_o(xp,parameters)
d_o=parameters.d_o;
o=xp(7);

out=-d_o*o;

end

