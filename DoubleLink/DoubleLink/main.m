//
//  main.m
//  DoubleLink
//
//  Created by AnatoleZhou on 2019/3/13.
//  Copyright © 2019 AnatoleZhou. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef char ElemType;
typedef int Status;

typedef struct DoubleNode{
    ElemType data;
    struct DoubleNode *prior;
    struct DoubleNode *next;
}DoubleNode, *DoubleLink;

Status initList(DoubleLink *L){
    DoubleNode *p, *q;
    int i;
    *L = (DoubleLink)malloc(sizeof(DoubleNode));
    if (!(*L)) {
        return 0;
    }
    
    (*L)->next = (*L)->prior = NULL;
    p = (*L);
    
    for (i = 0; i < 26; i ++) {
        q = (DoubleNode *)malloc(sizeof(DoubleNode));
        if (!q) {
            return 0;
        }
        
        q->data = 'A' + i;
        q->prior = p;
        q->next = p->next;
        p->next = q;
        
        p = q;
    }
    
    p->next = (*L)->next;
    (*L)->next->prior = p;

    return 1;
}

void Caesar(DoubleLink *L, int i){
    if (i > 0){
        do {
            (*L) = (*L)->next;
        } while (--i);
    }
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        DoubleLink L;
        int i, n;
        initList(&L);
        
        printf("请输入一个整数：");
        scanf("%d",&n);
        printf("\n");
        Caesar(&L, n);
        for (i = 0; i < 26; i++) {
            L = L->next;
            printf("%c", L->data);
        }
    }
    return 0;
}
