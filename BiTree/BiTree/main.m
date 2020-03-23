//
//  main.m
//  BiTree
//
//  Created by AnatoleZhou on 2019/3/30.
//  Copyright © 2019 AnatoleZhou. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef struct BiTNode
{
    char data;
    struct BiTNode *lchild,*rchild;
}BiTNode,*BiTree;
void PreOrderTraverse(BiTree T)//二叉树的先序遍历
{
    if(T==NULL)
        return ;
    printf("值为==== %c ",T->data);
    PreOrderTraverse(T->lchild);
    PreOrderTraverse(T->rchild);
}
void InOrderTraverse(BiTree T)//二叉树的中序遍历
{
    if(T==NULL)
        return ;
    InOrderTraverse(T->lchild);
    printf("值为==== %c ",T->data);
    InOrderTraverse(T->rchild);
}
void PostOrderTraverse(BiTree T)//后序遍历
{
    if(T==NULL)
        return;
    PostOrderTraverse(T->lchild);
    PostOrderTraverse(T->rchild);
    printf("值为==== %c ",T->data);
}
void CreateBiTree(BiTree *T)
{
    char ch;
    scanf("%c",&ch);
    if(ch=='#')
        *T=NULL;
    else
    {
        *T=(BiTree  )malloc(sizeof(BiTNode));
        if(!*T)
            exit(-1);
        (*T)->data=ch;
        CreateBiTree(&(*T)->lchild);
        CreateBiTree(&(*T)->rchild);
    }
    
}




int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        
        
        BiTree T = NULL;
        CreateBiTree(&T);
        PreOrderTraverse (T);
        InOrderTraverse(T);
        PostOrderTraverse(T);

        
    }
    return 0;
}
