function dstate=f_flow(state, xp, parameters)

%%%
chi=state(1:2);
theta=state(3);

%%%

dchi=f_chi(chi,parameters);
dtheta=0;

dstate=[dchi;dtheta];

end

