//
//  main.m
//  CycleQueue
//
//  Created by AnatoleZhou on 2019/3/17.
//  Copyright © 2019 AnatoleZhou. All rights reserved.
//

#import <Foundation/Foundation.h>

#define MAX_SIZE 100

typedef char ElemType;
typedef struct{
    ElemType *base; //用于存放内存分配基地址，这里可以用数组存放；
    
    int front;
    int rear;
}CyleQueue;

void initCycleQueue(CyleQueue *q) {
    q->base = (ElemType *)malloc(sizeof(ElemType) * MAX_SIZE);
    if (!q->base) {
        exit(0);
    }
    
    q->front = q->rear = 0;
}

void insertCycleQueue(CyleQueue *q, ElemType e) {
    if ((q->rear + 1) % MAX_SIZE == q->front) { // 队列已满
        return;
    }
    q->base[q->rear] = e;
    q->rear = (q->rear + 1) % MAX_SIZE;
}

void deleteCycleQueue(CyleQueue *q, ElemType *e){
    if (q->front == q->rear) { // 对列为空
        return;
    }
    *e = q->base[q->front];
    q->front = (q->front + 1) % MAX_SIZE;
}


// 反向输出
void print() {
    char a;
    scanf("%c", &a);
    if (a != '#') {
        print();
    }
    
    if (a !='#') {
        printf("%c", a);
    }
}


// 折半递归查找
int recursionBiSearch(int data[], const int x, int beg, int last) {
    int mid = -1;
    mid = (beg +last) / 2;
    if (x == data[mid]) {
        return mid;
    } else if (x < data[mid]) {
        return recursionBiSearch(data, x, beg, mid - 1);
    } else if (x > data[mid]) {
        return recursionBiSearch(data, x, mid + 1, last);
    }
    return -1;
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...

        print();
    }
    return 0;
}
