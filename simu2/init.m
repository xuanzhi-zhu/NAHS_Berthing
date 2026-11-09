%rho, Drho, DDrho should be changed accordingly
%h_ast, Dh_ast, DDh_ast should be changed accordingly
%alpha1, Dalpha1 should be changed accordingly

clear all
close all
clc

rng('shuffle');
addpath('./myFcns/')

%desired configuration
p_d=[0;0];
q_d=[0;1];%unit
v_d=[0;0];
o_d=0;


%vessel paras
m_0=22.405;%mass
m_x=2;%added mass in surge======================
m_y=6;%added mass in sway======================
J_0=4.1484;%inertia
J_z=2;%added mass in yaw======================
d_u=5;%linear damping coefficient in surge======================
d_nu=15;%linear damping coefficient in sway======================
d_r=10;%linear damping coefficient in yaw======================

m_u=m_0+m_x;
m_nu=m_0+m_y;
m_r=J_0+J_z;
J=m_r;
M=diag([m_u;m_nu]);
D_v=diag([d_u;d_nu]);
d_o=d_r;

%input configuration
d=0.58;%distance between the 2 thrusters
P=[1,1;-0.5*d,0.5*d];


%%%=========================================================
% %geometry of experimental vessel: p_i in {B}
% p_1=[0.5;-0.35];
% p_2=[0.265;-0.46];
% p_3=[-0.325;-0.46];
% p_4=[-0.6;-0.38];
% p_5=[-0.6;0.38];
% p_6=[-0.325;0.46];
% p_7=[0.265;0.46];
% p_8=[0.5;0.35];
% 
% vertices=[p_1 p_2 p_3 p_4 p_5 p_6 p_7 p_8];

%geometry of simulation vessel: p_i in {B}
p_1=[0.6;0];
p_2=[0.2;-0.3];
p_3=[-0.3;-0.2];
p_4=[-0.3;0.2];
p_5=[0.2;0.3];

vertices=[p_1 p_2 p_3 p_4 p_5];
%%%=========================================================


N=numel(vertices)/2;
bar_x=max(abs(vertices(2,:)));
Delta=0.1;%safe margin

%synergistic
varpi=10/180*pi;%PE angular velocity
h_p=0.25*d_nu^2;%I3)
h_q=20;
h_o=100;
k_u=2.5*1/m_u*(0.5*d_nu-d_u);%>1/m_u*(0.5*d_nu-d_u)%smaller==>smaller control
k_q=0.02;%smaller==>smaller error
k_o=0.005;%smaller==>smaller control
q_ast=[1;0];%fixed as per I4) <===> xi=q_ast iff q=q_d
r=[0;1];%unit,\neq q_ast

if r'*q_ast==0 %C2)
    minus1_scale=0.6;%\in(0,1)
    positive1_scale=0.4;%\in(0,1)
else
    minus1_scale=0.5;%\in(0,1)
    positive1_scale=0.5;%\in(0,1)
end
minus1_value=minus1_scale*(2-(1+r'*q_ast)) + 1+r'*q_ast;
positive1_value=positive1_scale*(2-(1-r'*q_ast)) + 1-r'*q_ast;
slope_h_ast=(positive1_value-minus1_value)/2;
intercept_h_ast=positive1_value-slope_h_ast*1;

parameters=struct();
parameters.para_h_ast.slope_h_ast=slope_h_ast;
parameters.para_h_ast.intercept_h_ast=intercept_h_ast;

delta_ast=min([h_ast(-1,parameters)-1-r'*q_ast; ...
                        2-h_ast(-r'*q_ast,parameters); ...
                        h_ast(1,parameters)-1+r'*q_ast]);
aux_scale=0.5;%\in(0,1)
delta=aux_scale*h_q*delta_ast;%\in(0,h_q*delta_ast)

%aux paras
e1=[1;0];
e2=[0;1];
S=[0,-1;1,0];

% parameters

parameters.p_d=p_d;
parameters.q_d=q_d;
parameters.v_d=v_d;
parameters.o_d=o_d;

parameters.m_u=m_u;
parameters.m_nu=m_nu;
parameters.J=J;
parameters.M=M;
parameters.d_u=d_u;
parameters.d_nu=d_nu;
parameters.D_v=D_v;
parameters.d_o=d_o;

parameters.d=d;
parameters.P=P;

parameters.vertices=vertices;
parameters.N=N;
parameters.bar_x=bar_x;
parameters.Delta=Delta;

parameters.varpi=varpi;
parameters.h_p=h_p;
parameters.h_q=h_q;
parameters.h_o=h_o;
parameters.k_u=k_u;
parameters.k_q=k_q;
parameters.k_o=k_o;
parameters.q_ast=q_ast;
parameters.r=r;
parameters.delta=delta;
parameters.delta_ast=delta_ast;

parameters.e1=e1;
parameters.e2=e2;
parameters.S=S;



%initial plant state
p_0=[0;0];
q_0=[0;-1];%unit
v_0=[0;0];
o_0=0;

xp_0=[p_0;q_0;v_0;o_0];

%initial controller state
chi_0=[0;1];%unit
% theta_0=1;% 1
theta_0=0;% 1

xc_0=[chi_0;theta_0];

%initial cal_V0 (check Lyapunov)
cal_V0_ini=0;

% simulation horizon
TSPAN = [0 300];
JSPAN = [0 30*TSPAN(2)];
% rule=2;%2 for flow
                                                                        
% solver tolerances
AbsTol = 1e-3;
RelTol = AbsTol*0.01;
MaxStep = 1e-2;%

dim_xp=numel(xp_0);

dim_x0=numel([xp_0;xc_0]);


%%%%%CBF
% verify key condition: \sum_{i\in\Imc} \exp(\pm k e_2\tp p_i) e_1\tp p_i \neq 0
k=20;%para for smoothing polygon
parameters.k=k;
check_minus=0;
check_positive=0;
for i=1:1:N
    check_minus=check_minus+exp(-k*vertices(2,i))*vertices(1,i);
    check_positive=check_positive+exp(k*vertices(2,i))*vertices(1,i);
end
if abs(check_minus)<eps || abs(check_positive)<eps
    fprintf('Change k');
else
    fprintf('k is okay for CBF');
end
fprintf('\n');
% verify key condition: k>inv(Delta)*log(N)
if k<=inv(Delta)*log(N)
    fprintf('Enlarge k');
else
    fprintf('k is okay for LAS');
end

%verify initial conditions is safe
%both a<=0 and vertheta1<=0    iff     \in\Omc
fprintf('\n');    
x0_0=[xp_0;xc_0];
if  a(x0_0,parameters)<=0
    fprintf('state in set C1');
else
    fprintf('state not in set C1');
end
fprintf('\n');
if  vartheta1(x0_0,parameters)<=0
    fprintf('state in set C2');
else
    fprintf('state not in set C2');
end