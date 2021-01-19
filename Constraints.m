function [c, ceq] = Constraints(x,P,r_constr)
    P0 = x(1:3)'; % 3*1 x,y,z
    x_Max = max(P(1,:));
    x_Min = min(P(1,:));
    y_Max = max(P(2,:));
    y_Min = min(P(2,:));
    z_Max = max(P(3,:));
    z_Min = min(P(3,:));
    Vd = x(4:6)';
    c_x = [P0(1) - x_Max; -P0(1) + x_Min];
    c_y = [P0(2) - y_Max; -P0(2) + y_Min];
    c_z = [P0(3) - z_Max; -P0(3) + z_Min];
    c_r = [x(7)-r_constr; -x(7)];
    c = [c_x; c_y; c_z; c_r];
    ceq = [norm(Vd) - 1; P0'*Vd]; 
end