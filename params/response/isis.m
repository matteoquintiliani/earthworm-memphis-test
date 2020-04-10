
% L28 (with 2 zeros)
p1 = -19.9930 + 19.9930*i;
p2 = -19.9930 - 19.9930*i;
np=2;
nz=2;
k1 = 1.0;

% preamp with 4 pole 25Hz butterworth low pass (no zeros)
p3 = -145.175 + 59.9846*i;
p4 = -145.175 - 59.9846*i;
p5 = -60.1377 + 145.112*i;
p6 = -60.1377 - 145.112*i;
k2 = 608.807e6;
np=np+4;

% preamp contour filter, 4.5Hz 1 pole low pass (no zeros)
%p7 = -28.2743 + 0.0*i;
%k3 = 28.2743;
k3 = 1;
%np=np+1;

% preamp, 0.1Hz 1 pole high pass (1 zero)
%p8 = -0.628319 + 0.0*i;
k4 = 1.0;
%np=np+1;
%nz=nz+1;

% VCO 0.013Hz 1 pole high pass (1 zero)
%p9 = -0.082498 + 0.0*i;
k5 = 1.0;
%np=np+1;
%nz=nz+1;

% 20Hz 4 Pole Bessel Low Pass (no zeros)
%p10 = -170.948 + 51.1716*i;
%p11 = -170.948 - 51.1716*i;
%p12 = -123.879 + 156.768*i;
%p13 = -123.879 - 156.768*i;
%k6 = 1.27119e9;
k6 = 1.0;
%np=np+4;

% 100 Hz 2 pole bessel low pass (no zeros)
%p14 = -691.835 + 387.632*i;
%p15 = -691.835 - 387.632*i;
%k7 = 637.747e3;
k7=1.0;
%np=np+2;

% 0.0029Hz 1 pole high pass (1 zero)
%p16 = -0.018182 + 0.0*i;
k8 = 1.0;
%np=np+1;
%nz=nz+1;

% gain constant and units conversion V/micron/s
k9 = 0.1276;

% convert V/micron/s to V/m/s
k10 = 1e6;

sensor = k1*k2*k3*k4*k5*k6*k7*k9*k10; 

das=409.6;  % count/V

% count/m
constant = sensor*das;

% count/nm
constant = constant*1e-9;

% convert from velocity to displacement
nz=nz+1;

fid=fopen('Generic.ISIS.SHORT.PZ','w');
fprintf(fid,'ZEROS %d\n',nz);
fprintf(fid,'POLES %d\n',np);

% L28: 2 poles
fprintf(fid,'%f %f\n',real(p1),imag(p1));
fprintf(fid,'%f %f\n',real(p2),imag(p2));

% preamp with 4 pole 25Hz butterworth low pass (no zeros)
fprintf(fid,'%f %f\n',real(p3),imag(p3));
fprintf(fid,'%f %f\n',real(p4),imag(p4));
fprintf(fid,'%f %f\n',real(p5),imag(p5));
fprintf(fid,'%f %f\n',real(p6),imag(p6));

% preamp contour filter, 4.5Hz 1 pole low pass (no zeros)
%fprintf(fid,'%f %f\n',real(p7),imag(p7));

% preamp, 0.1Hz 1 pole high pass (1 zero)
%fprintf(fid,'%f %f\n',real(p8),imag(p8));

% VCO 0.013Hz 1 pole high pass (1 zero)
%fprintf(fid,'%f %f\n',real(p9),imag(p9));

% 20Hz 4 Pole Bessel Low Pass (no zeros)
%fprintf(fid,'%f %f\n',real(p10),imag(p10));
%fprintf(fid,'%f %f\n',real(p11),imag(p11));
%fprintf(fid,'%f %f\n',real(p12),imag(p12));
%fprintf(fid,'%f %f\n',real(p13),imag(p13));

% 100 Hz 2 pole bessel low pass (no zeros)
%fprintf(fid,'%f %f\n',real(p14),imag(p14));
%fprintf(fid,'%f %f\n',real(p15),imag(p15));

% 0.0029Hz 1 pole high pass (1 zero)
%fprintf(fid,'%f %f\n',real(p16),imag(p16));

fprintf(fid,'CONSTANT %5.4e\n',constant);
fclose(fid);
