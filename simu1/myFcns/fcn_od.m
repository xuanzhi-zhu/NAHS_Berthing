function out = fcn_od(x0,parameters)

k_q=parameters.k_q;
S=parameters.S;

%%%%%
xp=x0(1:7);
state=x0(8:10);

%%%
chi=state(1:2);
theta=state(3);

y=fcn_xi(xp,chi,parameters);

dalpha=fcn_dalpha(x0,parameters);

out=-k_q*Dh0_Dy(y,theta,parameters)*S*y ...
       -dalpha;

end

