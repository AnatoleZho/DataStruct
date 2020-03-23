//
//  main.m
//  Stack
//
//  Created by AnatoleZhou on 2019/3/16.
//  Copyright © 2019 AnatoleZhou. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef char ElemType;

#define STACK_INIT_SIZE  3
#define STACK_INCREMENT 10
#define MAX_BUFFER  10

typedef struct {
    ElemType *base;
    ElemType *top;
    int stackSize;
}sqStack;

void initStack(sqStack *s){
    s->base = (ElemType *)malloc(STACK_INIT_SIZE * sizeof(ElemType));
    if (!s->base) {
        exit(0);
    }
    
    s->top = s->base;
    s->stackSize = STACK_INIT_SIZE;
}

void push(sqStack *s, ElemType e) {
    if (s->top - s->base >= s->stackSize) {
        s->base = (ElemType *)realloc(s->base, (s->stackSize + STACK_INCREMENT) * sizeof(ElemType));
        if (!s->base) {
            exit(0);
        }
    }
    *(s->top) = e;
    s->top ++;
}

void pop(sqStack *s, ElemType *e){
    if (s->top == s->base) {
        return;
    }
    *e = *--(s->top);
}

int stackLen(sqStack s){
    return (int)(s.top - s.base);
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
//        char c;
//        sqStack s;
//        int len, i, sum = 0;
//
//        initStack(&s);
//        printf("请输入二进制数，输入#符号表示结束！\n");
//        scanf("%c", &c);
//        while (c != '#') {
//                push(&s, c);
//                scanf("%c", &c);
//        }
//
//        getchar();// 把‘\n’从缓冲区去掉
//
//        len = stackLen(s);
//        printf("栈的当前容量为%d", len);
//
//        for (i = 0; i < len; i ++) {
//            pop(&s, &c);
//            sum = sum + (c - 48) * pow(2, i);
//        }
//
//        printf("转换为十进制数为：%d", sum);
        
        
/*     逆波兰表达式    */
        
        /** 中缀表达式转后缀表达式 **/
        sqStack s;
        ElemType c, e;
        initStack(&s);
        
        printf("请输入中缀表达式，以# 作为结束标志：\n");
        scanf("%c", &c);
        
        while (c != '#') {
            while (c >='0' && c<= '9') {
                printf("%c", c);
                scanf("%c", &c);
                if (c < '0' || c > '9') {
                    printf(" ");
                }
            }
            
            if (')' == c) {
                pop(&s, &e);

                while ('(' != e) {
                    printf("%c", e);
                    pop(&s, &e);
                }
            } else if ('-' == c || '+' == c){
                if (!stackLen(s)) {
                    push(&s, c);
                } else {
                    do {
                        pop(&s, &e);
                        if ('(' == e) {
                            push(&s, e);
                        } else {
                            printf("%c", e);
                        }
                    } while (stackLen(s) && '(' != e);
                    push(&s, c);
                }
            } else if ('*' ==c || '/' == c || '(' == c){
                push(&s, c);
            } else if ('#' == c) {
                break;
            } else {
                printf("\n错误： 输入格式错误%c", c);
                return -1;
            }
        
            scanf("%c", &c);
        }
        
        while (stackLen(s)) {
            pop(&s, &e);
            printf(" %c", e);
        }
        
        
//        sqStack s;
//        char c;
//        ElemType d, e;
//        char str[MAX_BUFFER];
//        int i = 0;
//        initStack(&s);
//
//        printf("请按逆波兰表达式输入待计算数据, 数据与运算之间用空格隔开，以#作为结束标志\n");
//        scanf("%c", &c);
//        while (c != '#') {
//            while (isdigit(c) || c == '.') { // 用于过滤数字
//                str[i ++ ] = c;
//                if (i >= 10) {
//                    printf("出错：输入的单个数据过大");
//                    return -1;
//                }
//                scanf("%c", &c);
//                if (c == ' ') { // 数据输入完成
//                    // 字符串转 double
//                    d = atof(str);
//                    push(&s, d);
//                    i = 0;
//                    break;
//                }
//            }
//            switch (c) {
//                case '+':
//                    pop(&s, &e);
//                    pop(&s, &d);
//                    push(&s, d+e);
//                    break;
//                case '-':
//                    pop(&s, &e);
//                    pop(&s, &d);
//                    push(&s, d-e);
//                    break;
//                case '*':
//                    pop(&s, &e);
//                    pop(&s, &d);
//                    push(&s, d*e);
//                    break;
//                case '/':
//                    pop(&s, &e);
//                    pop(&s, &d);
//                    if (e != 0) {
//                        push(&s, d+e);
//                    } else {
//                        printf("您的被除数为0");
//                    }
//
//                default:
//                    break;
//            }
//            scanf("%c", &c);
//        }
//        pop(&s, &d);
//        printf("\n最终的计算结果为：%d", d);
    }
    
    
    return 0;
}
