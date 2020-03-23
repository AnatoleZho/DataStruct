//
//  main.m
//  EightQueen
//
//  Created by AnatoleZhou on 2019/3/20.
//  Copyright © 2019 AnatoleZhou. All rights reserved.
//

#import <Foundation/Foundation.h>

int count = 0;

// 行、列和斜线位置 不存在危险
int isSafty(int row, int column, int (*chess)[8]) {
    int i, k, flag = 0;
    // 判断列方向
    for (i = 0; i < 8; i ++) {
        if (*(*(chess + i) + column) != 0) {
            flag = 1;
            break;
        }
    }
    
    // 判断左上方
    int leftTopFlag = 0;
    for (i = row, k = column; i >= 0 && k >= 0; i --, k --) {
        if (*(*(chess + i) + k) != 0) {
            leftTopFlag = 1;
            break;
        }
    }
    
    // 判断右下方
    int rightBottomFlag = 0;
    for (i = row, k = column; i < 8 && k < 8; i ++, k ++) {
        if (*(*(chess + i) + k) != 0) {
            rightBottomFlag = 1;
            break;
        }
    }
    
    // 判断左下方
    int leftBottomFlag = 0;
    for (i = row, k = column; i < 8 && k >= 0; i ++, k --) {
        if (*(*(chess + i) + k) != 0) {
            leftBottomFlag = 1;
            break;
        }
    }
    
    // 判断右上方
    int rightTopFlag = 0;
    for (i = row, k = column; i  >= 0 && k < 8 ; i --, k ++) {
        if (*(*(chess + i) + k) != 0) {
            rightTopFlag = 1;
            break;
        }
    }
    if (flag || leftTopFlag || leftBottomFlag || rightBottomFlag || rightTopFlag) {
        return 0;
    } else {
        return 1;
    }
}


// 参数 row 表示起始行
// 参数 column 表示列数
// 参数 （*chess)[8] 表示指向棋盘每一行的指针

void eightQueen(int row, int column, int (*chess)[8]) {
    int tempChess[8][8];
    for (int i = 0; i < 8; i ++) {
        for (int j = 0; j < 8; j ++) {
            tempChess[i][j] = chess[i][j];
        }
    }
    
    if (row == 8) {
        printf("第 %d 中解决方法\n", count + 1);
        for (int m = 0; m < 8; m ++) {
            for (int n = 0; n < 8; n ++) {
                printf("%d  ", *(*(tempChess + m) + n));
            }
            printf("\n");
        }
        printf("\n");
        count ++;
    } else {
        // 判断这个位置是否有危险，如果有危险继续往下
        for (int z = 0; z < column; z ++) {
            if (isSafty(row, z, chess)) { // 判断是否存在危险
                for (int t = 0; t < 8; t ++) {
                    *(*(tempChess+row)+t) = 0;
                }
                *(*(tempChess + row) + z) = 1;
                eightQueen(row + 1, column, tempChess);
            }
        }
    }
}



int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        int  num = 8;
        int  chess[num][num], i, j;
        for (i = 0; i < num; i ++) {
            for (j = 0; j < num; j ++) {
                chess[i][j] = 0;
                printf("%d  ",  chess[i][j]);
            }
            printf("\n");
        }
        printf("\n");

        
        eightQueen(0, 8, chess);
        
        printf("总共有 %d 中解决方法！\n\n", count);
        
    }
    return 0;
}
