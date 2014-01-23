//
//  ViewController.h
//  dentaku
//
//  Created by 山部　耀介 on 13/11/07.
//  Copyright (c) 2013年 kitakyu-u. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController{
    IBOutlet UILabel *label;
    BOOL startInput;
    BOOL startOP;
    double currentValue;//計算結果の値の型を定義
    int operation;//計算方法を識別
    
    #define ADD 0
    #define SUB 1
    #define DIV 2
    #define MUL 3
    }

- (IBAction)number:(id)sender;//テンキーを押した時の動作

- (IBAction)equal:(id)sender;//計算結果を表示する動作
- (IBAction)op:(id)sender;//計算方法の選択
- (IBAction)AC:(id)sender;//画面の値をクリアする動作

@end
