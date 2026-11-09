time_length=numel(tout);

%%%CS1: safe hybrid
p_kappa2_vec=p_kappa2.signals.values;
q_kappa2_vec=q_kappa2.signals.values;
v_kappa2_vec=v_kappa2.signals.values;
o_kappa2_vec=o_kappa2.signals.values;

p_kappa2_vec=reshape(p_kappa2_vec,[2 time_length]);
q_kappa2_vec=reshape(q_kappa2_vec,[2 time_length]);
v_kappa2_vec=reshape(v_kappa2_vec,[2 time_length]);
o_kappa2_vec=reshape(o_kappa2_vec,[1 time_length]);

%%%CS2: nominal hybrid
p_kappa0_vec=p_kappa0.signals.values;
q_kappa0_vec=q_kappa0.signals.values;
v_kappa0_vec=v_kappa0.signals.values;
o_kappa0_vec=o_kappa0.signals.values;

p_kappa0_vec=reshape(p_kappa0_vec,[2 time_length]);
q_kappa0_vec=reshape(q_kappa0_vec,[2 time_length]);
v_kappa0_vec=reshape(v_kappa0_vec,[2 time_length]);
o_kappa0_vec=reshape(o_kappa0_vec,[1 time_length]);

%%%CS3: safe continuous
p_kappa3_vec=p_kappa3.signals.values;
q_kappa3_vec=q_kappa3.signals.values;
v_kappa3_vec=v_kappa3.signals.values;
o_kappa3_vec=o_kappa3.signals.values;

p_kappa3_vec=reshape(p_kappa3_vec,[2 time_length]);
q_kappa3_vec=reshape(q_kappa3_vec,[2 time_length]);
v_kappa3_vec=reshape(v_kappa3_vec,[2 time_length]);
o_kappa3_vec=reshape(o_kappa3_vec,[1 time_length]);

%%%CS4: nominal continuous
p_kappa4_vec=p_kappa4.signals.values;
q_kappa4_vec=q_kappa4.signals.values;
v_kappa4_vec=v_kappa4.signals.values;
o_kappa4_vec=o_kappa4.signals.values;

p_kappa4_vec=reshape(p_kappa4_vec,[2 time_length]);
q_kappa4_vec=reshape(q_kappa4_vec,[2 time_length]);
v_kappa4_vec=reshape(v_kappa4_vec,[2 time_length]);
o_kappa4_vec=reshape(o_kappa4_vec,[1 time_length]);

%vessel polygon
vertices_vec=vertices';
face_vec=1:1:N;

alphas = linspace(0.01, 0.1, time_length)';%transparency vector

%%%%animation
figure(100);
Speedy=1/MaxStep;

intersect=bar_x+Delta;


max_radius=max((sum(vertices_vec.^2,2)).^(0.5));
max_radius=1.1*max_radius;

minx_kappa2=min(p_kappa2_vec(1,:))-max_radius;
miny_kappa2=min(p_kappa2_vec(2,:))-max_radius;
maxy_kappa2=max(p_kappa2_vec(2,:))+max_radius;

minx_kappa0=min(p_kappa0_vec(1,:))-max_radius;
miny_kappa0=min(p_kappa0_vec(2,:))-max_radius;
maxy_kappa0=max(p_kappa0_vec(2,:))+max_radius;

minx_kappa3=min(p_kappa3_vec(1,:))-max_radius;
miny_kappa3=min(p_kappa3_vec(2,:))-max_radius;
maxy_kappa3=max(p_kappa3_vec(2,:))+max_radius;

minx=min([minx_kappa2,minx_kappa0,minx_kappa3]);
miny=min([miny_kappa2,miny_kappa0,miny_kappa3]);
maxy=max([maxy_kappa2,maxy_kappa0,maxy_kappa3]);

xlims=[minx 2.5*intersect];
ylims=[miny maxy];

for i=1:Speedy:length(tout)/2
    %initial location
    ini_p=plot(p_kappa0_vec(1,1),p_kappa0_vec(2,1),'s','Color',[0 0 0],'MarkerSize',8,'LineWidth',2);hold on;
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
    %current and past location
    scatter(p_kappa2_vec(1,i), p_kappa2_vec(2,i), ...
        'o', ...                    % marker shape
        'SizeData', 30, ...        % corresponds to plot's LineWidth effect (adjust as needed)
        'MarkerEdgeColor', [0.5 0.5 0.5], ... % edge color (RGB, no alpha here)
        'MarkerEdgeAlpha', 10*alphas(i), ... % key: edge transparency
        'LineWidth', 2);hold on            % edge line width
    %current and past vessel polygon
    R_=R(q_kappa2_vec(:,i));
    vertices_position_vec=zeros(size(vertices_vec));
    for ind=1:1:N
        vertices_position_vec(ind,:)=transpose( R_*transpose(vertices_vec(ind,:)) + p_kappa2_vec(:,i) );
    end

    patch('Faces',face_vec,'Vertices',vertices_position_vec, ...
              EdgeColor=[0 0.6 1],FaceColor="none",EdgeAlpha=10*alphas(i),LineWidth=2);hold on

    
    %%%CS2: nominal hybrid controller: kappa0
    %current and past location
    scatter(p_kappa0_vec(1,i), p_kappa0_vec(2,i), ...
        'o', ...                    % marker shape
        'SizeData', 30, ...        % corresponds to plot's LineWidth effect (adjust as needed)
        'MarkerEdgeColor', [0.5 0.5 0.5], ... % edge color (RGB, no alpha here)
        'MarkerEdgeAlpha', 10*alphas(i), ... % key: edge transparency
        'LineWidth', 2);hold on            % edge line width
    %current and past vessel polygon
    R_=R(q_kappa0_vec(:,i));
    vertices_position_vec=zeros(size(vertices_vec));
    for ind=1:1:N
        vertices_position_vec(ind,:)=transpose( R_*transpose(vertices_vec(ind,:)) + p_kappa0_vec(:,i) );
    end
    
    patch('Faces',face_vec,'Vertices',vertices_position_vec, ...
              EdgeColor=[1 0.6 0],FaceColor="none",EdgeAlpha=10*alphas(i),LineWidth=2);hold on
    

    %%%CS3: safe continuous controller: kappa3
    %current and past location
    scatter(p_kappa3_vec(1,i), p_kappa3_vec(2,i), ...
        'o', ...                    % marker shape
        'SizeData', 30, ...        % corresponds to plot's LineWidth effect (adjust as needed)
        'MarkerEdgeColor', [0.5 0.5 0.5], ... % edge color (RGB, no alpha here)
        'MarkerEdgeAlpha', 10*alphas(i), ... % key: edge transparency
        'LineWidth', 2);hold on            % edge line width
    %current and past vessel polygon
    R_=R(q_kappa3_vec(:,i));
    vertices_position_vec=zeros(size(vertices_vec));
    for ind=1:1:N
        vertices_position_vec(ind,:)=transpose( R_*transpose(vertices_vec(ind,:)) + p_kappa3_vec(:,i) );
    end
    
    patch('Faces',face_vec,'Vertices',vertices_position_vec, ...
              EdgeColor=[0.3 0.6 0.3],FaceColor="none",EdgeAlpha=10*alphas(i),LineWidth=2);hold on
    

    %%%CS4: nominal continuous controller: kappa4
    %current and past location
    scatter(p_kappa4_vec(1,i), p_kappa4_vec(2,i), ...
        'o', ...                    % marker shape
        'SizeData', 30, ...        % corresponds to plot's LineWidth effect (adjust as needed)
        'MarkerEdgeColor', [0.5 0.5 0.5], ... % edge color (RGB, no alpha here)
        'MarkerEdgeAlpha', 10*alphas(i), ... % key: edge transparency
        'LineWidth', 2);hold on            % edge line width
    %current and past vessel polygon
    R_=R(q_kappa4_vec(:,i));
    vertices_position_vec=zeros(size(vertices_vec));
    for ind=1:1:N
        vertices_position_vec(ind,:)=transpose( R_*transpose(vertices_vec(ind,:)) + p_kappa4_vec(:,i) );
    end
    
    patch('Faces',face_vec,'Vertices',vertices_position_vec, ...
              EdgeColor=[0.5 0.3 0.6],FaceColor="none",EdgeAlpha=10*alphas(i),LineWidth=2);hold on


    % %current xB axis (e1) to be expressed in I
    % xB_I=10.*R_*[1;0];
    % arrow_ini=p_kappa0_vec(:,i);
    % arrow_end=arrow_ini + xB_I;
    % plot(linspace(arrow_ini(1),arrow_end(1),10), ...
    %        linspace(arrow_ini(2),arrow_end(2),10),'LineWidth',2, 'Color', [1 0 1 5*alphas(i)]);hold on;

    % %force disturbance bv
    % arrow_ini=[0;0];
    % arrow_end=arrow_ini + 10.*bv./norm(bv);
    % plot(linspace(arrow_ini(1),arrow_end(1),10),linspace(arrow_ini(2),arrow_end(2),10),'LineWidth',2);hold on;
    % %torque disturbance bo
    % plot(p_kappa0_vec(i,1),p_kappa0_vec(i,2),'bx','MarkerSize',3); hold off;
    % insidePaper=-abs(bo);
    % text(p_kappa0_vec(i,1)+5,p_kappa0_vec(i,2)+5,num2str(insidePaper));
    grid on;axis equal;
    xlabel('x');ylabel('y');
    
    axis([xlims ylims]);
   

    % timer=tout(i);
    % text(49,49,num2str(timer));

    uistack(xshore, 'bottom');
    uistack(shore, 'bottom');

    uistack(ini_p, 'top');
    uistack(desired_p, 'top');

    %set(gca,'Ydir','reverse')
    pause(0.001)
    % pause(0.1)
end