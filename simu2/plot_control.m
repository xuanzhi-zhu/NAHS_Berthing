clear all
close all
clc

rng('shuffle');
addpath('./myFcns/')

load data

time_length=numel(tout);


%%%CS1: safe hybrid
tau_u_kappa2_vec=tau_u_kappa2.signals.values;
tau_r_kappa2_vec=tau_r_kappa2.signals.values;

tau_u_kappa2_vec=reshape(tau_u_kappa2_vec,[1 time_length]);
tau_r_kappa2_vec=reshape(tau_r_kappa2_vec,[1 time_length]);

%%%CS2: nominal hybrid
tau_u_kappa0_vec=tau_u_kappa0.signals.values;
tau_r_kappa0_vec=tau_r_kappa0.signals.values;

tau_u_kappa0_vec=reshape(tau_u_kappa0_vec,[1 time_length]);
tau_r_kappa0_vec=reshape(tau_r_kappa0_vec,[1 time_length]);

%%%CS3: safe continuous
tau_u_kappa3_vec=tau_u_kappa3.signals.values;
tau_r_kappa3_vec=tau_r_kappa3.signals.values;

tau_u_kappa3_vec=reshape(tau_u_kappa3_vec,[1 time_length]);
tau_r_kappa3_vec=reshape(tau_r_kappa3_vec,[1 time_length]);

%%%CS4: nominal continuous
tau_u_kappa4_vec=tau_u_kappa4.signals.values;
tau_r_kappa4_vec=tau_r_kappa4.signals.values;

tau_u_kappa4_vec=reshape(tau_u_kappa4_vec,[1 time_length]);
tau_r_kappa4_vec=reshape(tau_r_kappa4_vec,[1 time_length]);

%%%https://bluerobotics.com/store/thrusters/t100-t200-thrusters/m200-motor/
bar_F=5.63*9.81;
lbar_F=2.81*9.81;

%%%range of (thrust,torque) based on (lbar_F,bar_F)
range_face_vec=1:1:4;
point1=[bar_F bar_F];
point2=[bar_F -lbar_F];
point3=[-lbar_F -lbar_F];
point4=[-lbar_F bar_F];
point1_=P*point1';
point2_=P*point2';
point3_=P*point3';
point4_=P*point4';

range_vertices_vec=[point1_';point2_';point3_';point4_'];


layout = [1;1;1;1]*ones(1,9);
h=create_axis(layout,16,...
    'innerymargin',0.1,...
    'botmargin',0,...
    'innerxmargin',0.1,...
    'leftmargin',0.05);
colors = get(gca,'colororder');
% blue=1/256.*[108 142 191];
blue=[0 0.6 1];
red=1/256.*[185 84 80];
% yellow=1/256.*[215 154 2];
yellow=[1 0.6 0];
% purple=1/256.*[151 115 166];
purple=[0.5 0.3 0.6];
% green=1/256.*[129 179 101];
green=[0.3 0.6 0.3];
grey=[0.5 0.5 0.5];
black=[0 0 0];

lineWidth = 2;
markerSize = 6;

alpha_1 = 0.6; % 0 = fully transparent, 1 = fully opaque
alpha_2 = 0.5;
alpha_3 = 0.4;
alpha_4 = 0.3;
alpha_5 = 0.2;


saturation_outline=patch('Faces',range_face_vec,'Vertices',range_vertices_vec, ...
              EdgeColor=grey,FaceColor="none",EdgeAlpha=alpha_1,LineWidth=2);hold on
CS1=plot(tau_u_kappa2_vec,tau_r_kappa2_vec,':','Color',[blue 1],'LineWidth',1.2*lineWidth,'MarkerSize',markerSize);hold on
% plot(tau_u_kappa2_vec(1),tau_r_kappa2_vec(1),'s','Color',[black alpha_1],'LineWidth',lineWidth,'MarkerSize',markerSize);hold on
CS2=plot(tau_u_kappa0_vec,tau_r_kappa0_vec,'-','Color',[yellow 1],'LineWidth',lineWidth,'MarkerSize',markerSize);hold on
% plot(tau_u_kappa0_vec(1),tau_r_kappa0_vec(1),'s','Color',[black alpha_1],'LineWidth',lineWidth,'MarkerSize',markerSize);hold on
CS3=plot(tau_u_kappa3_vec,tau_r_kappa3_vec,'--','Color',green,'LineWidth',lineWidth,'MarkerSize',markerSize);hold on
% plot(tau_u_kappa3_vec(1),tau_r_kappa3_vec(1),'s','Color',[black alpha_1],'LineWidth',lineWidth,'MarkerSize',markerSize);hold on
CS4=plot(tau_u_kappa4_vec,tau_r_kappa4_vec,'-.','Color',[purple 1],'LineWidth',lineWidth,'MarkerSize',markerSize);hold on
CS_ini=plot(tau_u_kappa4_vec(1),tau_r_kappa4_vec(1),'s','Color',[black alpha_1],'LineWidth',lineWidth,'MarkerSize',markerSize);


grid on

xlim([-250,250])
ylim([-25,25])

% set(gca, 'YScale', 'linear')
% yticks = ([10^(-6) 10^(-4) 10^(-2) 10^0 10^2]);
% yticklabels({'10^{-6}','10^{-4}','10^{-2}','10^{0}','10^{2}'})


xh=xlabel('$\tau_u\,[\mathrm{N}]$','fontsize',12);
yh=ylabel('$\tau_r\,[\mathrm{N\,m}]$','fontsize',12);

% Adjust position - negative values move left, positive move right
% Format: [x, y, z] in normalized units
set(xh, 'Units', 'normalized');
currentPos = get(xh, 'Position');
set(xh, 'Position', [currentPos(1), currentPos(2)-0.08, currentPos(3)]);  % Move down

set(yh, 'Units', 'normalized');
currentPos = get(yh, 'Position');
set(yh, 'Position', [currentPos(1)-0.09, currentPos(2), currentPos(3)]);  % Move left


leg=legend([CS_ini saturation_outline], ...
                  {'$\tau(0,0)$', ...
                  'bounds as per~\eqref{eqn:input constraint}', ...
                   },'fontsize',12);
legend('boxoff')
leg.Orientation='vertical';
set(leg,...
    'Location','best')
pos = leg.Position;
set(leg,...
    'Position',pos+[-0.3 -0.05 0 0.15])


ax = gca;
ap = ax.Position; xl = ax.XLim; yl = ax.YLim;
fig2data = @(xf,yf) deal( xl(1)+(xf-ap(1))/ap(3)*diff(xl), ...
                          yl(1)+(yf-ap(2))/ap(4)*diff(yl) );

x0 = 0.15;  y0 = 0.96;  dx = 0.2;  seg = 0.05;
c  = {blue,   yellow, green,  purple};
ls = {':',    '-',    '--',   '-.'};      % solid, solid, dashed, dash-dot
%    CS1     CS2     CS3     CS4
lb = {'\ref{CS1}','\ref{CS2}','\ref{CS3}','\ref{CS4}'};

for k = 1:4
    xk = x0 + (k-1)*dx;
    annotation('line', [xk xk+seg], [y0 y0], ...
               'Color', c{k}, 'LineWidth', lineWidth, ...
               'LineStyle', ls{k});
    [xd,yd] = fig2data(xk+seg+0.01, y0);
    text(xd, yd, lb{k}, 'FontSize',12, ...
         'VerticalAlignment','middle', 'Rotation',0);
end

% Reorder children
uistack([CS_ini CS1 CS2 CS3 CS4 saturation_outline], 'top')  % then bottom-up as needed
% ax = gca;
% ax.Children = [CS_ini;CS1;CS2;CS3;CS4;saturation_outline];%first on top

ax = gca; % current axes
ax.FontSize = 12;



%%%=========================================================
% create a new pair of axes inside current figure
axes('position',[.74 .3 .15 .55])
box on % put box around new pair of axes

CS1_mini=plot(tau_u_kappa2_vec,tau_r_kappa2_vec,':','Color',[blue 1],'LineWidth',1.2*lineWidth,'MarkerSize',markerSize);hold on
% plot(tau_u_kappa2_vec(1),tau_r_kappa2_vec(1),'s','Color',[black alpha_1],'LineWidth',lineWidth,'MarkerSize',markerSize);hold on
CS2_mini=plot(tau_u_kappa0_vec,tau_r_kappa0_vec,'-','Color',[yellow 1],'LineWidth',lineWidth,'MarkerSize',markerSize);hold on
% plot(tau_u_kappa0_vec(1),tau_r_kappa0_vec(1),'s','Color',[black alpha_1],'LineWidth',lineWidth,'MarkerSize',markerSize);hold on
CS3_mini=plot(tau_u_kappa3_vec,tau_r_kappa3_vec,'--','Color',green,'LineWidth',lineWidth,'MarkerSize',markerSize);hold on
% plot(tau_u_kappa3_vec(1),tau_r_kappa3_vec(1),'s','Color',[black alpha_1],'LineWidth',lineWidth,'MarkerSize',markerSize);hold on
CS4_mini=plot(tau_u_kappa4_vec,tau_r_kappa4_vec,'-.','Color',[purple 1],'LineWidth',lineWidth,'MarkerSize',markerSize);hold on

grid on
set(gca, 'YScale', 'linear')
% axis tight

xticks([-0.25 0.25]);
xticklabels({'-0.25','0.25'});

xlim([-0.25,0.25])
ylim([-1.5,1.5])


matlabfrag2('simu_subsection2_control')