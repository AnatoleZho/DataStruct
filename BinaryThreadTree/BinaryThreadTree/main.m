//
//  main.m
//  BinaryThreadTree
//
//  Created by AnatoleZhou on 2019/4/2.
//  Copyright © 2019 AnatoleZhou. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef char ElemType;

// 线索存储标志位
// Link : 0, 表示指向左右孩子的指针
// Thread : 1, 表示指向前前驱后继的线索
typedef enum {Link, Thread} PointerTag;



typedef struct BiThrNode{
    char data;
    struct BiThrNode *lChild, *rChild;
    PointerTag ltag;
    PointerTag rtag;
} BiThrNode, *BiThrTree;

// 全局变量， 始终指向刚刚访问的结点
BiThrNode *pre;

// 创建一棵二叉树， 约定用户遵照前序遍历的方式输入数据
void createBiThrTree(BiThrTree *T) {
    char c;
    scanf("%c", &c);
    
    if ('#' == c) {
        *T = NULL;
    } else {
        *T = (BiThrNode *)malloc(sizeof(BiThrNode));
        (*T)->data = c;
        (*T)->ltag = Link;
        (*T)->rtag = Link;
        
        createBiThrTree(&((*T)->lChild));
        createBiThrTree(&(*T)->rChild);
    }
}

// 中序遍历线索化过程
void inThreading(BiThrTree T) {
    if (T) {
        inThreading(T->lChild); // 递归左子树线索化
        // 结点处理
        if (!T->lChild) { // 如果该结点没有左孩子
            T->ltag = Thread; // 设置 ltag 置为 Thread， 将 lChild 置为刚刚访问的前一个结点
            T->lChild = pre;
        }
        printf("lTag:  %d", T->ltag);
        printf("  值为：  %c", T->data);
        printf("  rTag:  %d\n", T->rtag);

        if (!pre->rChild) {
            pre->ltag = Thread;
            pre->rChild = T;
        }
        
        pre = T;
        
        inThreading(T->rChild); // 递归右子树线索化
    }
}

void inOrderThreading(BiThrTree *p, BiThrTree T){
    *p = (BiThrNode *)malloc(sizeof(BiThrNode));
    (*p)->ltag = Link;
    (*p)->rtag = Thread;
    (*p)->rChild = *p;
    if (!T) {
        (*p)->lChild = *p;
    } else {
        (*p)->lChild = T;
        pre = *p;
        
        inThreading(T);
        
        pre->rChild = *p;
        pre->rtag = Thread;
        (*p)->rChild = pre;
        
    }
}

void visit(char c) {
    printf("%c", c);
}

// 中序遍历二叉树， 非递归
void inOrderTraverse(BiThrTree T) {
    BiThrTree p;
    p = T->lChild;
    while (p != T) {
        while (p->ltag == Link) {
            p = p->lChild;
        }
        
        visit(p->data);
        
        while (p->rtag == Thread && p->rChild != T) {
            p = p->rChild;
            
            visit(p->data);
        }
        
        p = p->rChild;
    }
    
}


int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        BiThrTree p,T = NULL;
        
        createBiThrTree(&T);
        
//        inThreading(T);
        
        inOrderThreading(&p, T);
    }
    return 0;
}
