function out = kappa_0(x0,parameters)
xp=x0(1:7);

thrust=kappa_u0(xp,parameters);
torque=kappa_r0(x0,parameters);

out=[thrust;torque];

end

