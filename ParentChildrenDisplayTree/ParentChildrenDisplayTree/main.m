//
//  main.m
//  ParentChildrenDisplayTree
//
//  Created by AnatoleZhou on 2019/3/30.
//  Copyright © 2019 AnatoleZhou. All rights reserved.
//

#import <Foundation/Foundation.h>

#define MAX_TREE_SIZE 100

typedef char ElemType;

// 孩子结点
typedef struct CTNode {
    int child;            // 孩子结点的小标
    struct CTNode *next;  // 指向下一个孩子结点的指针
} *ChildPtr;

// 表结构
typedef struct {
    ElemType data;       // 存放在树种的结点的数据
    int parent;          // 存放双亲的下标
    ChildPtr firstChild; // 存放第一个孩子结点
} CTBox;



int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, World!");
    }
    return 0;
}
