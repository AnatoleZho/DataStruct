//
//  main.m
//  HanioTower
//
//  Created by AnatoleZhou on 2019/3/19.
//  Copyright © 2019 AnatoleZhou. All rights reserved.
//

#import <Foundation/Foundation.h>

// 将 n 个盘子从 X 借助 Y 移动到 Z
void hanioTowerMove(int n, char x,  char y, char z) {
    if (1 == n) {
        printf("move: %c-->%c\n", x, z);
    } else {
        hanioTowerMove(n - 1, x, z, y); // 将 n-1 个盘子从 X 借助于 Z 移动到 Y 上；
        printf("move: %c-->%c\n", x, z); // 将第 n 个盘子从 X 移动到 Z 上；
        hanioTowerMove(n - 1, y, x, z); // 将 n-1 个盘子从 Y 借助于 Y 移动到 Z 上;
    }
}


int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        
        NSLog(@"Hello, World!");
        
        char x = 'a';
        char y = 'b';
        char z = 'c';
        
        
        hanioTowerMove(4, x, y, z);
        
    }
    
    return 0;
}
