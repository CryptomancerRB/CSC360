#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <stdint.h>
#include <math.h>
#include <limits.h>

#define N 4
#define M_SIZE sizeof(int16_t)*N*N

void PermMat(int16_t M[N][N],int16_t Mprime[N*N]);

void TransposeRotMat(int16_t mat[N][N]);

void CalcTheta(int16_t a,int16_t b,int16_t c,int16_t d,int16_t *thetaL, int16_t *thetaR);

void ConstructRotMat(int16_t topT, int16_t botT, int16_t mat[N][N], int transpose);

void MatrixRotateLeft(int16_t r[N][N], int16_t M[N][N]);

void MatrixRotateRight(int16_t M[N][N], int16_t r[N][N]);

void PerformSVD(int16_t M[N][N]);

int16_t Arctan(int16_t ratio);

int16_t Sin(int16_t ratio);

int16_t Cos(int16_t ratio);

/*
void printMatrix(int16_t M[N][N]){
    int r, c;
    for(r = 0;r<N;r++){
        for(c = 0;c<N;c++){
            printf("%3x ",M[r][c]&0xFFF);
        }
        printf("    ");
        for(c = 0;c<N;c++){
            printf("%1.2f ",(double)M[r][c]/(double)0x800);
        }
        printf("\n");
    }
    printf("\n");
}

void MatrixMultiply(int16_t M1[N][N], int16_t M2[N][N], int16_t MR[N][N]){
    int r,c,n;
    int32_t sum;
    for(r = 0; r<N; r++){
        for(c = 0; c<N; c++){
            sum = 0;
            for(n = 0; n<N; n++){
                sum+=(M1[r][n]*M2[n][c]);
            }
            MR[r][c] = sum>>11;
        }
    }

}
*/

void PerformSVD(int16_t M[N][N]){
    int16_t U[N][N] = {0x800,0x000,0x000,0x000,0x000,0x800,0x000,0x000,0x000,0x000,0x800,0x000,0x000,0x000,0x000,0x800};
    int16_t V[N][N] = {0x800,0x000,0x000,0x000,0x000,0x800,0x000,0x000,0x000,0x000,0x800,0x000,0x000,0x000,0x000,0x800};
    int16_t topTR = 0;
    int16_t topTL = 0;
    int16_t botTR = 0;
    int16_t botTL = 0;
    int16_t L[N][N] = {0};
    int16_t R[N][N] = {0};
    int16_t TEMP_M[N*N] = {0};

    volatile int n;
    //printMatrix(M);
    for(n = 0; n<18; n++){
        CalcTheta(M[0][0],M[0][1],M[1][0],M[1][1],&topTL,&topTR);
        CalcTheta(M[N-2][N-2],M[N-2][N-1],M[N-1][N-2],M[N-1][N-1],&botTL,&botTR);

        ConstructRotMat(topTL,botTL,L,1);
        ConstructRotMat(topTR,botTR,R,0);

        MatrixRotateLeft(L,M);
        MatrixRotateRight(M,R);

        TransposeRotMat(L);
        TransposeRotMat(R);

        MatrixRotateRight(U,L);
        MatrixRotateLeft(R,V);

        PermMat(U,TEMP_M);
        PermMat(M,TEMP_M);
        PermMat(V,TEMP_M);
    }

    //int i;
    //for(i=0; i<N; i++){
        //printf("E%d: %x    ",i,M[i][i]);
    //}
    //printf("\n");

}

int main(){
    //int16_t M[N][N] = {-0x800,0,0,0,0x800,0,0,0,0,0,0,0,0,0,0,0};
    //int16_t M[N][N] = {0x800,0x750,0x700,0x650,0x600,0x550,0x500,0x450,0x400,0x350,0x300,0x250,0x200,0x150,0x100,0x50};
    //int16_t M[N][N] = {0x400,0x400,0x400,0x400,0x400,0x400,0x400,0x400,0x400,0x400,0x400,0x400,0x400,0x400,0x400,0x400};
    
    int i;
    volatile int q;
    for(i=0;i<0xffffff;i++){
        q = i;
        int16_t M[N][N] = {0x0E7,-0x042,0x03f,0x054,0x069,0x07f,0x093,-0x0A8,0x0bd,0x7f5,0x0e7,0x0fc,-0x111,0x126,0x13b,-0x150};
        PerformSVD(M);
    }

    //int16_t Result1[N][N] = {0};
    //int16_t Result2[N][N] = {0};

    //printMatrix(U);
    //printMatrix(M);
    //printMatrix(V);

    //MatrixMultiply(U,M,Result1);
    //MatrixMultiply(Result1,V,Result2);
    //printMatrix(Result2);
    
    

    return 0;
}

void TransposeRotMat(int16_t mat[N][N]){
    mat[0][1] = -1*(mat[0][1]);
    mat[1][0] = -1*(mat[1][0]);
    mat[N-2][N-1] = -1*(mat[N-2][N-1]);
    mat[N-1][N-2] = -1*(mat[N-1][N-2]);
}

void PermMat(int16_t M[N][N],int16_t Mprime[N*N]){
    //int16_t *Mprime = malloc(M_SIZE);
    int r,c;

    //potential for memory access improvement

    //perm columns
    for(r = 0; r<N; r++){
        for(c = 1; c<N-1; c++){
            Mprime[(r*N)+c] = M[r][c+1];
        }
        Mprime[(r*N)+N-1] = M[r][1];
        Mprime[(r*N)] = M[r][0];
    }

    //perm rows
    for(c = 0; c<N; c++){
        for(r = 1; r<N-1; r++){
            M[r][c] = Mprime[((r+1)*N)+c];
        }
        M[N-1][c] = Mprime[N+c];
        M[0][c] = Mprime[c];
    }
}

void ConstructRotMat(int16_t topT,int16_t botT, int16_t mat[N][N], int transpose){
    int16_t s1 = Sin(topT);
    int16_t c1 = Cos(topT);
    int16_t s2 = Sin(botT);
    int16_t c2 = Cos(botT);
    int16_t i;
    if(transpose == 1){
        s1 = -1*s1;
        s2 = -1*s2;
    }
    for(i = 2; i < N-2; i++) {
        mat[i][i] = 0x800;
    }
    mat[0][0] = c1;
    mat[0][1] = s1;
    mat[1][1] = c1;
    mat[1][0] = -1*s1;
    mat[N-2][N-2] = c2;
    mat[N-2][N-1] = s2;
    mat[N-1][N-1] = c2;
    mat[N-1][N-2] = -1*s2;
}

void MatrixRotateLeft(int16_t r[N][N], int16_t M[N][N]){
    int32_t RT0[N];
    int32_t RT1[N];
    int32_t RB0[N];
    int32_t RB1[N];
    int col;

    for(col = 0; col < N; col++) {
        RT0[col] = (r[0][0] * M[0][col]) + (r[0][1] * M[1][col]);
        RT1[col] = (r[1][0] * M[0][col]) + (r[1][1] * M[1][col]);

        RB0[col] = (r[N-2][N-2] * M[N-2][col]) + (r[N-2][N-1] * M[N-1][col]);
        RB1[col] = (r[N-1][N-2] * M[N-2][col]) + (r[N-1][N-1] * M[N-1][col]);
    }
    
    for(col = 0; col < N; col++) {
        M[0][col] = RT0[col]>>11;
        M[1][col] = RT1[col]>>11;

        M[N-2][col] = RB0[col]>>11;
        M[N-1][col] = RB1[col]>>11;
    }

}

void MatrixRotateRight(int16_t M[N][N], int16_t r[N][N]) {
    int32_t CT0[N];
    int32_t CT1[N];
    int32_t CB0[N];
    int32_t CB1[N];
    int row;

    for(row = 0; row < N; row++) {
        CT0[row] = (M[row][0] * r[0][0]) + (M[row][1] * r[1][0]);
        CT1[row] = (M[row][0] * r[0][1]) + (M[row][1] * r[1][1]);

        CB0[row] = (M[row][N-2] * r[N-2][N-2]) + (M[row][N-1] * r[N-1][N-2]);
        CB1[row] = (M[row][N-2] * r[N-2][N-1]) + (M[row][N-1] * r[N-1][N-1]);
    }
    
    for(row = 0; row < N; row++) {
        M[row][0] = CT0[row]>>11;
        M[row][1] = CT1[row]>>11;

        M[row][N-2] = CB0[row]>>11;
        M[row][N-1] = CB1[row]>>11;
    }
}

void CalcTheta(int16_t a, int16_t b, int16_t c, int16_t d, int16_t *thetaL, int16_t *thetaR) {
    int16_t thetaSum, thetaDiff, sumRatio, sumRatioI, diffRatio, diffRatioI;

    if((c+b) == 0x000){
        sumRatio = 0x000;
    }
    else if((d-a) == 0x000){
        sumRatio = INT16_MAX;
        if(c+b < 0x000){
            sumRatio *= -1;
        }
        sumRatioI = 0x000;
    }
    else{
        sumRatio   = ((c+b)<<11)/(d-a);
        sumRatioI  = ((d-a)<<11)/(c+b);
    }
    if((c-b) == 0x000){
        diffRatio = 0x000;
    }
    else if((d+a) == 0x000){
        diffRatio = INT16_MAX;
        if(c-b < 0x000){
            diffRatio *= -1;
        }
        diffRatioI = 0x000;
    }
    else{
        diffRatio  = ((c-b)<<11)/(d+a);
        diffRatioI = ((d+a)<<11)/(c-b);
    }


    if(sumRatio <= 0x800 && sumRatio >= -0x800){
        thetaSum = Arctan(sumRatio);
    }
    else if(sumRatio > 0x800){
        thetaSum = 0xC91-Arctan(sumRatioI);
    }
    else{
        thetaSum = -0xC91-Arctan(sumRatioI);
    }

    if(diffRatio <= 0x800 && diffRatio >= -0x800){
        thetaDiff = Arctan(diffRatio);
    }
    else if(diffRatio > 0x800){
        thetaDiff = 0xC91-Arctan(diffRatioI);
    }
    else{
        thetaDiff = -0xC91-Arctan(diffRatioI);
    }
    *thetaR = (thetaSum + thetaDiff)>>1;
    *thetaL = (thetaSum - thetaDiff)>>1;
}

int16_t Arctan(int16_t ratio){
    int32_t result = 0;
    int32_t slowBro = 0x800;
    int16_t re;
    if((ratio > 0x400) && (ratio <= 0x800)) {
        result = (0x527 * ratio);
        result += 0x123<<11;
    } else if((ratio >= -0x400) && (ratio <= 0x400)) {
        result = 0x76C * ratio;
    } else if((ratio >= -0x800) && (ratio < -0x400)) {
        result = (0x527 * ratio);
        result -= 0x123<<11;
    }
    re = result >> 11;
    return re;
}

int16_t Sin(int16_t theta){
    int32_t xsquared = (theta * theta) >> 11;
    int16_t re = theta;
    int32_t num = (xsquared * theta ) >>11;
    re -= (num * 0xAAB) >> 14;
    num = (num * xsquared) >> 11;
    re += (num * 0x444) >> 17;
    num = (num * xsquared) >> 11;
    re -= (num * 0x680) >> 23;
    num = (num * xsquared) >> 11;
    re += (num * 0x5c7) >> 29;
    return re;
}

int16_t Cos(int16_t theta){
    int32_t xsquared = (theta * theta) >> 11;
    int16_t re = 0x800;
    int32_t num = xsquared;
    re -= num >> 1;
    num = (num * xsquared) >> 11;
    re += (num * 0x555) >> 15;
    num = (num * xsquared) >> 11;
    re -= (num * 0x5B0) >> 20;
    num = (num * xsquared) >> 11;
    re += (num * 0x680) >> 26;
    return re;
}

