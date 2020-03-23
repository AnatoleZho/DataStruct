//
//  main.m
//  Magician
//
//  Created by AnatoleZhou on 2019/3/13.
//  Copyright © 2019 AnatoleZhou. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef struct Node{
    int data;
    struct Node *next;
}Sqlist, *LinkList;

LinkList createLinkList() {
    LinkList head = NULL;
    LinkList s, r;
    int i;
    
    r = head;
    
    for (i = 1; i <= 26; i++) {
        
    }
    return head;
}

@interface Student : NSObject
@property (nonatomic, strong) NSString *name;
@end

@implementation Student

@end

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, World!");
        
        Student __weak *obj;

        Student *stu = [[Student alloc] init];
        stu.name = @"";
        obj = stu;
        NSLog(@"%p", stu);

        [stu release];
        
        [obj setName:@"huahua"];
        NSLog(@"stu===%p", stu);
        NSLog(@"obj---%p", obj);


        
        
    }
    return 0;
}


