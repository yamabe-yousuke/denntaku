//
//  ViewController.m
//  dentaku
//
//  Created by 山部　耀介 on 13/11/07.
//  Copyright (c) 2013年 kitakyu-u. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    startInput = YES; //入力可能(１桁目の入力)
    startOP = NO; //計算不能
    currentValue = 0;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.    
}

-(IBAction)number:(id)sender
{
    UIButton*b = (UIButton*)sender;

    if (startInput == YES) {//１桁目の入力
        if (b.tag==0){//0を押した場合
            label.text = @"0";//0を画面に表示
            return;
        }else{//0以外のボタンを押した場合
            //押したボタンの数を画面に表示
            label.text = [NSString stringWithFormat:@"%d",b.tag];
            startInput = NO;//今後は２桁目以降の入力を行う
        }
    } else {//２桁目以降の入力
        //既に表示されている数字に連結
        label.text = [NSString stringWithFormat:@"%@%d",label.text,b.tag];
    }
    if (label.text.length == 11) {
        //規定の長さを超えるとエラー表示
        label.text = [NSString stringWithFormat:@"Error"];
        startInput = YES;
    }
}

- (IBAction)equal:(id)sender {//それぞれ計算方法を行う
    if (startOP == YES) {
        if (operation == ADD) {
            //保存しているlabel.textの値とintValueの値の和をcurrentValueに保存
            currentValue += [label.text doubleValue];
        } else if (operation == SUB){
            //保存しているlabel.textの値とintValueの値の差をcurrentValueに保存
            currentValue -= [label.text doubleValue];
        } else if (operation == DIV){
            int x = [label.text intValue];
            if (x == 0) {//0で割る場合の処理動作
                label.text = [NSString stringWithFormat:@"Miss"];
                startInput = YES;
                startOP = NO;
                return;
            } else {
            //保存しているlabel.textの値とintValueの値の除をcurrentValueに保存
            currentValue /= [label.text doubleValue];
            }
        } else if (operation == MUL){
            //保存しているlabel.textの値とintValueの値の乗をcurrentValueに保存
            currentValue *= [label.text doubleValue];
        }
        NSString *check = [NSString stringWithFormat:@"%0.0f",currentValue];
        if (check.length >= 11) {
            //計算結果が規定の長さ以上の場合、エラー表示
            label.text = [NSString stringWithFormat:@"Error"];
            startInput = YES;
            startOP = NO;
            return;
        } else {
            //計算結果を画面に表示
            label.text = [NSString stringWithFormat:@"%0.0f",currentValue];
            startInput = YES;//新しい数字の入力開始
            startOP = NO;//計算終了
        }
    }
}

- (IBAction)op:(id)sender{
    UIButton *b = (UIButton *)sender;
    
    //値を保存する
    currentValue = [label.text doubleValue];
    
    operation = b.tag;//どの計算方法を行うのか、operationに記録する
    startInput = YES;//２つめの数字の入力開始
    startOP = YES;//計算開始
}

- (IBAction)AC:(id)sender {
    label.text = @"0";//画面に表示する値を０にする
    startInput = YES;//新しい数字の入力開始
}

@end
