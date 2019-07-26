#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <stdint.h>
#include <math.h>
#include <limits.h>

#define N 4
#define M_SIZE sizeof(int16_t)*N*N

void PermMat(int16_t M[N][N]);

void TransposeRotMat(int16_t mat[N][N]);

void CalcTheta(int16_t a,int16_t b,int16_t c,int16_t d,int16_t *thetaL, int16_t *thetaR);

void ConstructRotMat(int16_t topT, int16_t botT, int16_t mat[N][N], int transpose);

void MatrixRotateLeft4(int16_t r[4][4], int16_t M[4][4]);

void MatrixRotateRight4(int16_t M[4][4], int16_t r[4][4]);

void PerformSVD(int16_t M[N][N],int revs);

int16_t Arctan(int16_t ratio);

int16_t Sin(int16_t ratio);

int16_t Cos(int16_t ratio);

void printResult(int16_t U[N][N],int16_t M[N][N],int16_t V[N][N]);

int main(int argc, char *argv[]){

	int16_t M[N][N];
	int r,c,revs;
	double curr_float;
	int16_t curr_fixed;
    if(argc!=18){
        printf("\nUsage ./svd [iterations] [16 real numbers between -1 and 1]\n");
		return 1;
	}
	else{
		revs = atoi(argv[1]);
		for(r=0;r<N;r++){
			for(c=0;c<N;c++){
				curr_float = atof(argv[(N*r)+c+2]);
				curr_fixed = (int16_t)(curr_float*0x800);
				M[r][c] = curr_fixed;
			}
		}

    }
    
	PerformSVD(M,revs);

    return 0;
}

void PerformSVD(int16_t M[N][N], int revs){
	int16_t U[N][N] = {0x800,0x000,0x000,0x000,0x000,0x800,0x000,0x000,0x000,0x000,0x800,0x000,0x000,0x000,0x000,0x800};
	int16_t V[N][N] = {0x800,0x000,0x000,0x000,0x000,0x800,0x000,0x000,0x000,0x000,0x800,0x000,0x000,0x000,0x000,0x800};
	int16_t topTR = 0;
	int16_t topTL = 0;
	int16_t botTR = 0;
	int16_t botTL = 0;
	int16_t L[N][N] = {0};
	int16_t R[N][N] = {0};
	int n;
	for(n = 3*revs; n!=0; n--){
		CalcTheta(M[0][0],M[0][1],M[1][0],M[1][1],&topTL,&topTR);
		CalcTheta(M[N-2][N-2],M[N-2][N-1],M[N-1][N-2],M[N-1][N-1],&botTL,&botTR);

		ConstructRotMat(topTL,botTL,L,1);
		ConstructRotMat(topTR,botTR,R,0);

		MatrixRotateRight4(M,R);
		MatrixRotateLeft4(L,M);

		TransposeRotMat(L);
		TransposeRotMat(R);

		MatrixRotateLeft4(R,V);
		MatrixRotateRight4(U,L);

		PermMat(U);
		PermMat(M);
		PermMat(V);
	}
	printResult(U,M,V);
}

void printResult(int16_t U[N][N],int16_t M[N][N],int16_t V[N][N]){
    int r, c;
	printf("\n%11cU%24cSigma%24cV\n",' ',' ',' ');
    for(r = 0;r<N;r++){
        for(c = 0;c<N;c++){
            printf("% 02.2f ",(double)U[r][c]/(double)0x800);
        }
		printf(" | ");
        for(c = 0;c<N;c++){
            printf("% 02.2f ",(double)M[r][c]/(double)0x800);
        }
		printf(" | ");
        for(c = 0;c<N;c++){
            printf("% 02.2f ",(double)V[r][c]/(double)0x800);
        }
		printf("\n");
    }
    printf("\n");
}

void TransposeRotMat(int16_t mat[N][N]){
	int16_t *TEMP_mat = *mat;
    *(TEMP_mat+1) = (~*(TEMP_mat+1))+1;
    *(TEMP_mat+N) = (~*(TEMP_mat+N))+1;
    *(TEMP_mat+(N*(N-1)-1)) = (~*(TEMP_mat+(N*(N-1)-1)))+1;
    *(TEMP_mat+(N*N)-2) = (~*(TEMP_mat+(N*N)-2))+1;
}

void PermMat(int16_t M[N][N]){
    int r,c;
	int16_t TEMP_M [N*N];

    //perm columns
    for(r = 0; r<N; r+=2){
        for(c = 1; c<N-1; c+=2){
            TEMP_M[(r*N)+c] = M[r][c+1];
            TEMP_M[(r*N)+c+1] = M[r][c+2];
            TEMP_M[((r+1)*N)+c] = M[(r+1)][c+1];
            TEMP_M[((r+1)*N)+c+1] = M[(r+1)][c+2];
        }
        TEMP_M[(r*N)+N-1] = M[r][1];
        TEMP_M[(r*N)] = M[r][0];
        TEMP_M[((r+1)*N)+N-1] = M[(r+1)][1];
        TEMP_M[((r+1)*N)] = M[(r+1)][0];
    }

    //perm rows
    for(c = 0; c<N; c+=2){
        for(r = 1; r<N-1; r+=2){
            M[r][c] = TEMP_M[((r+1)*N)+c];
            M[r+1][c] = TEMP_M[((r+2)*N)+c];
            M[r][(c+1)] = TEMP_M[((r+1)*N)+(c+1)];
            M[r+1][(c+1)] = TEMP_M[((r+2)*N)+(c+1)];
        }
        M[N-1][c] = TEMP_M[N+c];
        M[0][c] = TEMP_M[c];
        M[N-1][(c+1)] = TEMP_M[N+(c+1)];
        M[0][(c+1)] = TEMP_M[(c+1)];
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

void MatrixRotateLeft4(int16_t r[4][4], int16_t M[4][4]){
    int32_t RT0[N];
    int32_t RT1[N];
    int32_t RB0[N];
    int32_t RB1[N];
    int col;

	RT0[0] = (r[0][0] * M[0][0]) + (r[0][1] * M[1][0]);
	RT1[0] = (r[1][0] * M[0][0]) + (r[1][1] * M[1][0]);

	RB0[0] = (r[N-2][N-2] * M[N-2][0]) + (r[N-2][N-1] * M[N-1][0]);
	RB1[0] = (r[N-1][N-2] * M[N-2][0]) + (r[N-1][N-1] * M[N-1][0]);

	RT0[1] = (r[0][0] * M[0][1]) + (r[0][1] * M[1][1]);
	RT1[1] = (r[1][0] * M[0][1]) + (r[1][1] * M[1][1]);

	RB0[1] = (r[N-2][N-2] * M[N-2][1]) + (r[N-2][N-1] * M[N-1][1]);
	RB1[1] = (r[N-1][N-2] * M[N-2][1]) + (r[N-1][N-1] * M[N-1][1]);

	RT0[2] = (r[0][0] * M[0][2]) + (r[0][1] * M[1][2]);
	RT1[2] = (r[1][0] * M[0][2]) + (r[1][1] * M[1][2]);

	RB0[2] = (r[N-2][N-2] * M[N-2][2]) + (r[N-2][N-1] * M[N-1][2]);
	RB1[2] = (r[N-1][N-2] * M[N-2][2]) + (r[N-1][N-1] * M[N-1][2]);

	RT0[3] = (r[0][0] * M[0][3]) + (r[0][1] * M[1][3]);
	RT1[3] = (r[1][0] * M[0][3]) + (r[1][1] * M[1][3]);

	RB0[3] = (r[N-2][N-2] * M[N-2][3]) + (r[N-2][N-1] * M[N-1][3]);
	RB1[3] = (r[N-1][N-2] * M[N-2][3]) + (r[N-1][N-1] * M[N-1][3]);

    for(col = 0; col < N; col+=2) {
		M[0][col] = RT0[col]>>11;
		M[1][col] = RT1[col]>>11;

		M[N-2][col] = RB0[col]>>11;
		M[N-1][col] = RB1[col]>>11;

		M[0][col+1] = RT0[col+1]>>11;
		M[1][col+1] = RT1[col+1]>>11;
		
		M[N-2][col+1] = RB0[col+1]>>11;
		M[N-1][col+1] = RB1[col+1]>>11;
    }
}

void MatrixRotateRight4(int16_t M[4][4], int16_t r[4][4]) {
    int32_t CT0[N];
    int32_t CT1[N];
    int32_t CB0[N];
    int32_t CB1[N];
    int row;
	CT0[0] = (M[0][0] * r[0][0]) + (M[0][1] * r[1][0]);
	CT1[0] = (M[0][0] * r[0][1]) + (M[0][1] * r[1][1]);

	CB0[0] = (M[0][N-2] * r[N-2][N-2]) + (M[0][N-1] * r[N-1][N-2]);
	CB1[0] = (M[0][N-2] * r[N-2][N-1]) + (M[0][N-1] * r[N-1][N-1]);

	CT0[1] = (M[1][0] * r[0][0]) + (M[1][1] * r[1][0]);
	CT1[1] = (M[1][0] * r[0][1]) + (M[1][1] * r[1][1]);

	CB0[1] = (M[1][N-2] * r[N-2][N-2]) + (M[1][N-1] * r[N-1][N-2]);
	CB1[1] = (M[1][N-2] * r[N-2][N-1]) + (M[1][N-1] * r[N-1][N-1]);

	CT0[2] = (M[2][0] * r[0][0]) + (M[2][1] * r[1][0]);
	CT1[2] = (M[2][0] * r[0][1]) + (M[2][1] * r[1][1]);

	CB0[2] = (M[2][N-2] * r[N-2][N-2]) + (M[2][N-1] * r[N-1][N-2]);
	CB1[2] = (M[2][N-2] * r[N-2][N-1]) + (M[2][N-1] * r[N-1][N-1]);

	CT0[3] = (M[3][0] * r[0][0]) + (M[3][1] * r[1][0]);
	CT1[3] = (M[3][0] * r[0][1]) + (M[3][1] * r[1][1]);

	CB0[3] = (M[3][N-2] * r[N-2][N-2]) + (M[3][N-1] * r[N-1][N-2]);
	CB1[3] = (M[3][N-2] * r[N-2][N-1]) + (M[3][N-1] * r[N-1][N-1]);

	M[0][0] = CT0[0]>>11;
	M[0][1] = CT1[0]>>11;

	M[0][N-2] = CB0[0]>>11;
	M[0][N-1] = CB1[0]>>11;

	M[1][0] = CT0[1]>>11;
	M[1][1] = CT1[1]>>11;

	M[1][N-2] = CB0[1]>>11;
	M[1][N-1] = CB1[1]>>11;

	M[2][0] = CT0[2]>>11;
	M[2][1] = CT1[2]>>11;

	M[2][N-2] = CB0[2]>>11;
	M[2][N-1] = CB1[2]>>11;

	M[3][0] = CT0[3]>>11;
	M[3][1] = CT1[3]>>11;

	M[3][N-2] = CB0[3]>>11;
	M[3][N-1] = CB1[3]>>11;
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
    if((ratio > 0x400) && (ratio <= 0x800)) {
        result = (0x527 * ratio);
        result += 0x123<<11;
    } else if((ratio >= -0x400) && (ratio <= 0x400)) {
        result = 0x76C * ratio;
    } else if((ratio >= -0x800) && (ratio < -0x400)) {
        result = (0x527 * ratio);
        result -= 0x123<<11;
    }
    return result>>11;
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
