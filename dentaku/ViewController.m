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
    if (label.text.length ==11) {
        label.text = [NSString stringWithFormat:@"Error"];
        startInput = YES;
    }
}

- (IBAction)equal:(id)sender {//それぞれ計算方法を行う
    if (operation == 0) {
        //保存しているlabel.textの値とintValueの値の和をcurrentValueに保存
        currentValue += [label.text intValue];
    } else if (operation == 1){
        //保存しているlabel.textの値とintValueの値の差をcurrentValueに保存
        currentValue -= [label.text intValue];
    } else if (operation == 2){
        //保存しているlabel.textの値とintValueの値の除をcurrentValueに保存
        currentValue /= [label.text intValue];
    } else if (operation == 3){
        //保存しているlabel.textの値とintValueの値の乗をcurrentValueに保存
        currentValue *= [label.text intValue];
    }
    
    //画面にcurrentValueに保存している値を表示する
    label.text = [NSString stringWithFormat:@"%d",currentValue];
    startInput = YES;//新しい数字の入力開始
}

- (IBAction)op:(id)sender{
    UIButton *b = (UIButton *)sender;
    
    //各値をそれぞれ保存する
    currentValue = [label.text intValue];
    
    operation = b.tag;//どの計算方法を行うのか、operationに記録する
    startInput = YES;//２つめの数字の入力開始
}

- (IBAction)AC:(id)sender {
    label.text = @"0";//画面に表示する値を０にする
    startInput = YES;//新しい数字の入力開始
}

@end
