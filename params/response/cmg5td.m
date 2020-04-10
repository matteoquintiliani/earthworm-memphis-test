
p1 = (-63.7927 + i*90.3864)*2*pi;
p2 = (-63.7927 - i*90.3864)*2*pi;
p3 = -209.656*2*pi;
p4 = -755.898*2*pi;
np=4;
nz = 0;

%normalizing constant
a0 = 1.9396e9*(2*pi)^(np-nz);

% in V/m/s/s
sensor =  0.256;

% in volts/count
das = 1.9e-6;

% count/m
constant = a0*sensor/das;

% count/nm
constant = constant*1e-9;

% add two zeros to convert from m/s to m

fid=fopen('Generic.CMG5TD.PZ','w');
fprintf(fid,'ZEROS 2\n');
fprintf(fid,'POLES 4\n');
fprintf(fid,'%f %f\n',real(p1),imag(p1));
fprintf(fid,'%f %f\n',real(p2),imag(p2));
fprintf(fid,'%f 0\n',p3);
fprintf(fid,'%f 0\n',p4);

fprintf(fid,'CONSTANT %5.4e\n',constant);
fclose(fid);

