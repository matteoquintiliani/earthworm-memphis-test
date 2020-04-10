
% for more info, see
% /opt/antelope/4.9/data/responses/README_Guralp_Poles_and_Zeros.pdf

p1 = 2*pi*(-23.65e-3 + i*23.65e-3);
p2 = 2*pi*(-23.65e-3 - i*23.65e-3);
p3 = 2*pi*(-180);
p4 = 2*pi*(-160);
p5 = 2*pi*(80);

z1 = 0;
z2 = 0;

a0=2304000;

z_sensor=755.2; % V/m/s
n_sensor=753.3; % V/m/s
e_sensor=754.4; % V/m/s

z_das=1/(1.278e-6);  % 1/V/count
n_das=1/(1.266e-6);  % 1/V/count
e_das=1/(1.264e-6);  % 1/V/count

z_constant = a0*((2*pi)^3)*z_sensor*z_das;
n_constant = a0*((2*pi)^3)*n_sensor*n_das;
e_constant = a0*((2*pi)^3)*e_sensor*e_das;

fid=fopen('CMG3ESP.pz','w');
fprintf(fid,'ZEROS 3\n');
fprintf(fid,'POLES 5\n');
fprintf(fid,'%f %f\n',real(p1),imag(p1));
fprintf(fid,'%f %f\n',real(p2),imag(p2));
fprintf(fid,'%f %f\n',real(p3),imag(p3));
fprintf(fid,'%f %f\n',real(p4),imag(p4));
fprintf(fid,'%f %f\n',real(p5),imag(p5));
fprintf(fid,'CONSTANT %5.4e\n',z_constant);
fclose(fid);
