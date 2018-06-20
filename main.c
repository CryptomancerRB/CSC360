#include <stdio.h>

#define N 4

void CalcTheta(int a,int b,int c,int d,int *thetaL, int *thetaR);

void ConstructRotMat(int theta, int mat[N][N]);

void MatrixMultiply(int M1[N][N], int M2[N][N], int product[N][N]);

int Arctan(int ratio); 

int Sin(int ratio);

int Cos(int ratio);

int main(){
    int M[N][N] = {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0};
    int *thetaR;
    int *thetaL;
    int L[N][N];
    int R[N][N];
    
    for(int r = 0; r<N-1; r++){
        for(int c=r+1; c<N; c++){
            //CalcTheta(M[r][c-1],M[r][c],M[r+1][c-1],M[r+1][c],thetaL,thetaR);
            //ConstructRotMat(*thetaL,L);
            //ConstructRotMat(*thetaR,R);
            //MatrixMultiply(L,M,M);
            //MatrixMultiply(M,R,M);
            printf("%d %d \n",r,c);
        }
    }

    return 0;
}
