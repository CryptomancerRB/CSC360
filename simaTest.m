clear all

M=[11, -2, 3, 4; 5, 66, 7, -8; 9, 100, 11, 12; -13, 14, 15, -16]

RL=eye(4);
RR=eye(4);

MM=RL*M*RR;

%Restored_M = RL'*MM*RR'

Th_SUM = atan( ( M(3,3)+M(2,4) ) / ( M(3,4)-M(2,3) ) );
Th_DIFF = atan((M(3,3)-M(2,4))/(M(3,4)+M(2,3)));
Th_R = (Th_SUM+Th_DIFF)/2;
Th_L = (Th_SUM-Th_DIFF)/2;

cL = cos(Th_L);
sL = sin(Th_L);
cR = cos(Th_R);
sR = sin(Th_R);

RL(2,2)=+cL;
RL(3,3)=+cL;
RL(2,3)=-sL;
RL(3,2)=+sL;

RR(3,3)=+cR;
RR(4,4)=+cR;
RR(3,4)=+sR;
RR(4,3)=-sR;

round(RL*M*RR);

PL = [1 0 0 0; 0 0 1 0; 0 0 0 1; 0 1 0 0];
PR = PL';

