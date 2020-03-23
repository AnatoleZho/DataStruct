//
//  main.m
//  Queue
//
//  Created by AnatoleZhou on 2019/3/17.
//  Copyright © 2019 AnatoleZhou. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef char ElemType;

typedef struct QNode{
    ElemType data;
    struct QNode *next;
}QNode, *QueuePrt;

typedef struct{
    QueuePrt front, rear; //对头、尾指针;
}LinkQueue;

void initLinkQueue(LinkQueue * q) {
    q->front = q->rear = (QueuePrt)malloc(sizeof(QNode));
    if (!q->front) {
        exit(0);
        q->front->next =  NULL;
    }
}

void insertQueue(LinkQueue *q, ElemType e) {
    QueuePrt p;
    p = (QueuePrt)malloc(sizeof(QNode));
    if (p == NULL) {
        exit(0);
    }
    p->data = e;
    p->next = NULL;
    q->rear->next = p;
    q->rear = p;
}

void deleteQueue(LinkQueue *q, ElemType *e) {
    QueuePrt p;
    if (q->front == q->rear) {
        return;
    }
    
    p = q->front->next;
    *e = p->data;
    
    q->front->next = p->next;
    // 当只有一个元素删除之后要做处理；
    if (q->rear == p) {
        q->rear = q->front;
    }
    free(p);
}

void destroyQueue(LinkQueue *q) {
    while (q->front) {
        q->rear = q->front->next;
        free(q->front);
        q->front = q->rear;
    }
}


int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, World!");
    }
    return 0;
}
