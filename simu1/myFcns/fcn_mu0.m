function out = fcn_mu0(x0,parameters)

%%%%%
xp=x0(1:7);
state=x0(8:10);

%%%
chi=state(1:2);
% theta=state(3);

%%%
x0_0=[xp;chi;0];%theta=0
x0_1=[xp;chi;1];%theta=1
V0_0=fcn_V0(x0_0,parameters);%theta=0
V0_1=fcn_V0(x0_1,parameters);%theta=1

out=fcn_V0(x0,parameters) - min(V0_0,V0_1);

end

