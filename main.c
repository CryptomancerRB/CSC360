#include <stdio.h>
#include <limits.h>

#define N 4

void CalcTheta(int a,int b,int c,int d,int *thetaL, int *thetaR);

void ConstructRotMat(int theta, int mat[N][N]);

void MatrixMultiply(int M1[N][N], int M2[N][N], int product[N][N]);

int Arctan(int ratio);

int Sin(int ratio);

int Cos(int ratio);

int main(){
    int M[N][N] = {1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16};
    int thetaR = 0;
    int thetaL = 0;
    int L[N][N];
    int R[N][N];

    int r;
    int c;
    for(int r = 0; r<N-1; r++){
        for(int c=r+1; c<N; c++){
            CalcTheta(M[r][c-1],M[r][c],M[r+1][c-1],M[r+1][c],&thetaL,&thetaR);
            //ConstructRotMat(*thetaL,L);
            //ConstructRotMat(*thetaR,R);
            //MatrixMultiply(L,M,M);
            //MatrixMultiply(M,R,M);
        }
    }

    return 0;
}

//store a rotation matrix in mat, there is enough space
//the matrix is of the form:
//{cosX  sinX 0 0... }
//{-sinX cosX 0 0... }
//{  0    1   0 0... }
//{ ...   0 ... 1... }
//{  0    0   0 0...1}
// dir = 0 is left; dir = 1 is right;
void ConstructRotMat(int theta, int mat[N][N], int direction){
    int i, j;
    // set diagonal to 1
    for(i = 0; i < N; i++) {
        for(j = 0; j < N; j++) {
            if(i == j) {
                mat[i][j] = 1;
            }
        }
    }
    // set rotation matrix
    mat[0][0] = Cos(theta);
    mat[1][1] = Cos(theta);
    if(direction === 0) {
        mat[0][1] = Sin(theta);
        mat[1][0] = -1 * Sin(theta);
    } else {
        mat[0][1] = -1 * Sin(theta);
        mat[1][0] = Sin(theta);
    }
}

//multiply M1 by M2 and store the result in product. Product will most likely point to M1 or M2 to be careful
//I think this is meant to be the dot product for a rotation matrix but please don't quote me
void MatrixRotateLeft(int r[N][N], int M[N][N]) {
    int R0[N];
    int R1[N];

    for(col = 0; col < N; col++) {
        R0[col] = (r[0][0] * M[0][col]) + (r[0][1] * M[1][col]);
        R1[col] = (r[1][0] * M[0][col]) + (r[1][1] * M[1][col]);
    }

    
    for(col = 0; col < N; col++) {
        M[0][col] = R0[col];
        M[1][col] = R1[col];
    }
}

//calculate thetaSum arctan((a+b)/(c+d)) and thetaDiff((a-b)/(c+d))
//calculate thetaL (thetaSum+thetaDiff)>>1 and thetaR (thetaSum-thetaDiff)>>1
//assign them to the pointers thetaL and thetaR
void CalcTheta(int a, int b, int c, int d, int *thetaL, int *thetaR) {
    int thetaSum;
    int thetaDiff;

    thetaSum = Arctan((a + b) / (c + d));
    thetaDiff = Arctan((a - b) / (c + d));
    *thetaL = (thetaSum + thetaDiff) >> 1;
    *thetaR = (thetaSum - thetaDiff) >> 1;
}

//return the arctan of the ratio using fixed point arithmetic and the "piecewise linear approximation"
int Arctan(int ratio){
    unsigned int result = 0;
    if((ratio > 0x400) && (ratio <= 0x800)) {
        result = 0x527 * ratio + 0x123;
    } else if((ratio > -0x400) && (ratio <= 0x400)) {
        result = 0x76C * ratio;
    } else if((ratio > -0x800) && (ratio <= -0x400)) {
        result = 0x527 * ratio - 0x123;
    } else {
        printf("Hey, you goofed in Arctan(): the ratio isn't within any of our bounds.\n");
    }
    return result;
}

//return the sin of the ratio using fixed point arithmetic and the "piecewise linear approximation"
int Sin(int theta){
    return 0;
}

//return the cos of the ratio using fixed point arithmetic and the "piecewise linear approximation"
int Cos(int theta){
    return 0;
}