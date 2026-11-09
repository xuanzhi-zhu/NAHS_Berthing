clear all
close all
clc

rng('shuffle');
addpath('./myFcns/')

load data_3

b_v=[b_u;b_nu];
b_r=b_r;


time_length=numel(tout);


%%%CS1: safe hybrid
p_kappa2_vec=p_kappa2.signals.values;
q_kappa2_vec=q_kappa2.signals.values;
v_kappa2_vec=v_kappa2.signals.values;
o_kappa2_vec=o_kappa2.signals.values;
chi_kappa2_vec=chi_kappa2.signals.values;
theta_kappa2_vec=theta_kappa2.signals.values;
tau_u_kappa2_vec=tau_u_kappa2.signals.values;
tau_r_kappa2_vec=tau_r_kappa2.signals.values;
a_kappa2_vec=a_kappa2.signals.values;
vartheta1_kappa2_vec=vartheta1_kappa2.signals.values;
V0_kappa2_vec=V0_kappa2.signals.values;

p_kappa2_vec=reshape(p_kappa2_vec,[2 time_length]);
q_kappa2_vec=reshape(q_kappa2_vec,[2 time_length]);
v_kappa2_vec=reshape(v_kappa2_vec,[2 time_length]);
o_kappa2_vec=reshape(o_kappa2_vec,[1 time_length]);
chi_kappa2_vec=reshape(chi_kappa2_vec,[2 time_length]);
theta_kappa2_vec=reshape(theta_kappa2_vec,[1 time_length]);
tau_u_kappa2_vec=reshape(tau_u_kappa2_vec,[1 time_length]);
tau_r_kappa2_vec=reshape(tau_r_kappa2_vec,[1 time_length]);
a_kappa2_vec=reshape(a_kappa2_vec,[1 time_length]);
vartheta1_kappa2_vec=reshape(vartheta1_kappa2_vec,[1 time_length]);
V0_kappa2_vec=reshape(V0_kappa2_vec,[1 time_length]);

%%%CS2: nominal hybrid
p_kappa5_vec=p_kappa5.signals.values;
q_kappa5_vec=q_kappa5.signals.values;
v_kappa5_vec=v_kappa5.signals.values;
o_kappa5_vec=o_kappa5.signals.values;
chi_kappa5_vec=chi_kappa5.signals.values;
theta_kappa5_vec=theta_kappa5.signals.values;
tau_u_kappa5_vec=tau_u_kappa5.signals.values;
tau_r_kappa5_vec=tau_r_kappa5.signals.values;
a_kappa5_vec=a_kappa5.signals.values;
vartheta1_kappa5_vec=vartheta1_kappa5.signals.values;
V0_kappa5_vec=V0_kappa5.signals.values;

p_kappa5_vec=reshape(p_kappa5_vec,[2 time_length]);
q_kappa5_vec=reshape(q_kappa5_vec,[2 time_length]);
v_kappa5_vec=reshape(v_kappa5_vec,[2 time_length]);
o_kappa5_vec=reshape(o_kappa5_vec,[1 time_length]);
chi_kappa5_vec=reshape(chi_kappa5_vec,[2 time_length]);
theta_kappa5_vec=reshape(theta_kappa5_vec,[1 time_length]);
tau_u_kappa5_vec=reshape(tau_u_kappa5_vec,[1 time_length]);
tau_r_kappa5_vec=reshape(tau_r_kappa5_vec,[1 time_length]);
a_kappa5_vec=reshape(a_kappa5_vec,[1 time_length]);
vartheta1_kappa5_vec=reshape(vartheta1_kappa5_vec,[1 time_length]);
V0_kappa5_vec=reshape(V0_kappa5_vec,[1 time_length]);



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

%vessel polygon
vertices_vec=vertices';
face_vec=1:1:N;

alphas = linspace(0.01, 0.1, time_length)';%transparency vector


intersect=bar_x+Delta;

xlims=[-2.5 1];
ylims=[-5.66 0.873];


%initial location
ini_p=plot(p_kappa5_vec(1,1),p_kappa5_vec(2,1),'s','Color',[0 0 0],'MarkerSize',8,'LineWidth',2);hold on;
%desired location
desired_p=plot(p_d(1),p_d(2),'d','Color',[0 0 0],'MarkerSize',8,'LineWidth',2);hold on;
%shore
shore_face_vec=1:1:4;
shore_vertices_vec=[intersect ylims(1); ...
                                intersect ylims(2); ...
                                xlims(2) ylims(2); ...
                                xlims(2) ylims(1)];

shore=patch('Faces',shore_face_vec,'Vertices',shore_vertices_vec, ...
          EdgeColor='none',FaceColor=[0.9 0.9 0.9],EdgeAlpha=0.8,LineWidth=2);hold on

% Boundary line x = intersect
xshore=xline(intersect, 'k-', 'LineWidth', 1.5);hold on

 %%%CS1: safe hybrid controller: kappa2
 INDEX=[1;201;401;601;1001;1601;9001;19001;29001];%index of chosen frames
 for ind=1:1:numel(INDEX)
     i=INDEX(ind);
    %current and past location
    scatter(p_kappa2_vec(1,i), p_kappa2_vec(2,i), ...
        'o', ...                    % marker shape
        'SizeData', 30, ...        % corresponds to plot's LineWidth effect (adjust as needed)
        'MarkerEdgeColor', [0.5 0.5 0.5], ... % edge color (RGB, no alpha here)
        'MarkerEdgeAlpha', (ind/numel(INDEX)), ... % key: edge transparency
        'LineWidth', 2);hold on            % edge line width
    %current and past vessel polygon
    R_=R(q_kappa2_vec(:,i));
    vertices_position_vec=zeros(size(vertices_vec));
    for ind_=1:1:N
        vertices_position_vec(ind_,:)=transpose( R_*transpose(vertices_vec(ind_,:)) + p_kappa2_vec(:,i) );
    end

    patch('Faces',face_vec,'Vertices',vertices_position_vec, ...
              EdgeColor=[0 0.6 1],FaceColor="none",EdgeAlpha=(ind/numel(INDEX)),LineWidth=2);hold on

    % text(p_kappa2_vec(1,i)-0.3, p_kappa2_vec(2,i), sprintf('$t=%0.f$', tout(i)))
 end

 INDEX5=[1;301;501;701;1101;1701;10001;20001;30001];
 for ind=1:1:numel(INDEX5)
     i=INDEX5(ind);
    %current and past location
    scatter(p_kappa5_vec(1,i), p_kappa5_vec(2,i), ...
        'o', ...                    % marker shape
        'SizeData', 30, ...        % corresponds to plot's LineWidth effect (adjust as needed)
        'MarkerEdgeColor', [0.5 0.5 0.5], ... % edge color (RGB, no alpha here)
        'MarkerEdgeAlpha', (ind/numel(INDEX5)), ... % key: edge transparency
        'LineWidth', 2);hold on            % edge line width
    %current and past vessel polygon
    R_=R(q_kappa5_vec(:,i));
    vertices_position_vec=zeros(size(vertices_vec));
    for ind_=1:1:N
        vertices_position_vec(ind_,:)=transpose( R_*transpose(vertices_vec(ind_,:)) + p_kappa5_vec(:,i) );
    end

    patch('Faces',face_vec,'Vertices',vertices_position_vec, ...
              EdgeColor=[0.9 0.9 0.3],FaceColor="none",EdgeAlpha=(ind/numel(INDEX5)),LineWidth=2);hold on

 end

grid on
axis equal
% set(gca, 'YScale', 'linear')


xh=xlabel('$y_I\,[\mathrm{m}]$','fontsize',12);
yh=ylabel('$x_I\,[\mathrm{m}]$','fontsize',12);

% Adjust position - negative values move left, positive move right
% Format: [x, y, z] in normalized units
set(xh, 'Units', 'normalized');
currentPos = get(xh, 'Position');
set(xh, 'Position', [currentPos(1), currentPos(2)-0.05, currentPos(3)]);  % Move down

set(yh, 'Units', 'normalized');
currentPos = get(yh, 'Position');
set(yh, 'Position', [currentPos(1)-0.05, currentPos(2), currentPos(3)]);  % Move left


xh.Rotation = 0;
yh.Rotation = 90;

% leg=legend([saturation_outline CS1 CS2 CS3 CS4 CS_ini], ...
%                   {'bounds as per~\eqref{eqn:input constraint}', ...
%                    '\ref{CS1}', ...
%                    '\ref{CS2}', ...
%                    '\ref{CS3}', ...
%                    '\ref{CS4}', ...
%                    '$\tau(0,0)$'},'fontsize',12);
% legend('boxoff')
% leg.Orientation='vertical';
% set(leg,...
%     'Location','best')
% pos = leg.Position;
% set(leg,...
%     'Position',pos+[-0.3 0.05 0 0.15])

% Reorder children
% uistack([CS_ini CS1 CS2 CS3 CS4 saturation_outline], 'top')  % then bottom-up as needed
% ax = gca;
% ax.Children = [CS_ini;CS1;CS2;CS3;CS4;saturation_outline];%first on top

ax = gca; % current axes
ax.FontSize = 12;


xlim(xlims)
ylim(ylims)

ax.XAxisLocation = 'top';
ax.TickDir  = 'out';            % ticks point outward
ax.TickLength = [0.05 0.02];    % longer = labels sit further out

camroll(ax, -90)


uistack(xshore, 'bottom');
uistack(shore, 'bottom');

uistack(ini_p, 'top');
uistack(desired_p, 'top');
text(p_kappa5_vec(1,1)+0.7,p_kappa5_vec(2,1)-0.3, '$p(0,0)$','fontsize',12)
% text(p_d(1)+0.25,p_d(2)-1,'$p_d$','fontsize',12)


text(p_kappa5_vec(1,1)+1.7,p_kappa5_vec(2,1)-0.3, '$\text{shore}$','fontsize',12)

% ax.XAxisLocation = 'bottom';






% Flatten b_v for display
bv_flat = b_v(:).';  % row vector

dir_v   = b_v(1:2);            % <-- change to b_v(3:4) or (b_u+b_nu) if needed
arrow_len = percentage*0.5;               % desired display length
u = arrow_len * dir_v(1) / norm(dir_v);
v = arrow_len * dir_v(2) / norm(dir_v);

% ---------- 1) Arrow for b_v ----------
NUM=INDEX(3);
start_v = [p_kappa2_vec(1,NUM), p_kappa2_vec(2,NUM)];
quiver(start_v(1), start_v(2), u, v, 0, 'LineWidth', 2, 'Color', 'r', ...
       'MaxHeadSize', 0.6);
text(start_v(1)+b_v(1)+0.3, start_v(2)+b_v(2), ...
     '$b_v$','fontsize',12);

% ---------- 2) Counterclockwise rotating arrow for b_r ----------
center = start_v;
radius = percentage*0.2;
theta  = linspace(-4, 1, 100);           % CCW from 0 to b_r
arcx   = center(1) + radius*cos(theta);
arcy   = center(2) + radius*sin(theta);

plot(arcx, arcy, 'r:', 'LineWidth', 2);

% Arrowhead at end of arc (tangent direction for CCW)
tip   = [arcx(end), arcy(end)];
% tangent = d/dtheta (cos,sin) = (-sin, cos)
tang  = [-sin(theta(end)), cos(theta(end))];
head_len = 0.08;
p1 = tip - head_len*(tang + [ tang(2), -tang(1)]*0.5);
p2 = tip - head_len*(tang - [ tang(2), -tang(1)]*0.5);
patch([tip(1) p1(1) p2(1)], [tip(2) p1(2) p2(2)], 'r', 'EdgeColor', 'r');

% Label for b_r
text(center(1)+radius*1.35*cos(b_r/2)+0.1, ...
     center(2)+radius*1.35*sin(b_r/2)-0.3, ...
     '$b_r$','fontsize',12);










%%%=========================================================
% % create a new pair of axes inside current figure
% axes('position',[.72 .3 .15 .55])
% box on % put box around new pair of axes
% 
% 
% grid on
% set(gca, 'YScale', 'linear')
% axis tight


% xlim([-0.25,0.25])
% ylim([-1.5,1.5])

matlabfrag2('simu_subsection3_percentage3')