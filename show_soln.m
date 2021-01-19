function show_soln(P, soln)
    scatter3(P(1,:),P(2,:),P(3,:),'filled')
    axis equal
    hold on
    P0 = soln(1:3)';
    Nor_Vec = soln(4:6)';
    r = soln(7);
    [~, dot_Num] = size(P);
    scaling_plus = 5;
    scaling_minus = 5;
    for i = 1:1:dot_Num
        temp = norm(P(:,i) - P0);
        dir = sign(dot(P(:,i), P0));
        if dir > 0
            if temp > scaling_plus
                scaling_plus = temp;
            end
        else
            if temp > scaling_minus
                scaling_minus = temp;
            end
        end    
    end
    Vec(:,1) = P0;
    Vec(:,2) = P0 + scaling_plus*Nor_Vec;
    plot3(Vec(1,:),Vec(2,:),Vec(3,:),'LineWidth',1.5);
    hold on
    plot3(Vec(1,2),Vec(2,2),Vec(3,2),'--r^','LineWidth',1.5);
    hold on
    POrg = P0 - scaling_minus*Nor_Vec;
    PEnd = P0 + scaling_plus*Nor_Vec;
    cylinder3(POrg,PEnd,r,60,'g',0,1);
end