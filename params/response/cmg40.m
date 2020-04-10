
% for more info, see
% /opt/antelope/4.9/data/responses/README_Guralp_Poles_and_Zeros.pdf

p1 = 2*pi*(-23.65e-3 + i*23.65e-3);
p2 = 2*pi*(-23.65e-3 - i*23.65e-3);
p3 = 2*pi*(-180);
p4 = 2*pi*(-160);
p5 = 2*pi*(-80);

z1 = 0;
z2 = 0;

a0=2304000;

% generic 40T sensitivity
sensor=800; % V/m/s

% generic dm24 sensitivity
das=1/(1.127e-6);  % 1/V/count

% convert to radians
constant = a0*((2*pi)^3)*sensor*das; % count/m/s

% convert to count/nm
constant = constant*1e-9;

fid=fopen('Generic.CMG40TDM24.PZ','w');
fprintf(fid,'ZEROS 3\n');
fprintf(fid,'POLES 5\n');
fprintf(fid,'%f %f\n',real(p1),imag(p1));
fprintf(fid,'%f %f\n',real(p2),imag(p2));
fprintf(fid,'%f %f\n',real(p3),imag(p3));
fprintf(fid,'%f %f\n',real(p4),imag(p4));
fprintf(fid,'%f %f\n',real(p5),imag(p5));
fprintf(fid,'CONSTANT %5.4e\n',constant);
fclose(fid);
