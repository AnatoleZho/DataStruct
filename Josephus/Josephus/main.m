//
//  main.m
//  Josephus
//
//  Created by AnatoleZhou on 2019/3/13.
//  Copyright © 2019 AnatoleZhou. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef struct Node{
    int data;
    struct Node *next;
}Node;

Node *create(int n){
    Node *p = NULL, *head;
    head = (Node *)malloc(sizeof(Node));
    p = head;
    Node *s = NULL;
    int i = 1;
    
    if (0 != n) {
        while (i <= n) {
            s = (Node *)malloc(sizeof(Node));
            s->data = i ++; // 先赋值，后自增
            p->next = s;
            p = s;
        }
        s->next = head->next;
    }
    free(head);
    return s->next;
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        
        int n = 41;
        int m = 3;
        int i;
        Node *p = create(n);
        Node *temp;
        
        m %= n;
        
        while (p != p->next) {
            for (i = 1; i < m-1; i ++) {
                p = p-> next;
            }
            
            printf("%d->", p->next->data);
            
            temp = p->next;
            p->next = temp->next;
            free(temp);
            
            p = p->next;
        }
        printf("%d\n", p->data);
        
    }
    return 0;
}
