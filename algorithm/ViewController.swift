//
//  ViewController.swift
//  algorithm
//
//  Created by Hello on 2019/3/26.
//  Copyright © 2019 Hello. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //八大金典排序算法
    var data : Array = [10,2,3];
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.createData();
        self.bubbling();
        self.choice();
        self.insert();
        self.hill();
        self.hill2();
        
        self.sort(a: &self.data, left: 0, right: self.data.count - 1)
        
    }
    
    func createData()  {
        
        data.removeAll();
        for _ in 0..<11 {
            data.append(Int(arc4random()%100))
        }
        print("原始数据\(data)")
    }

    //冒泡排序
    func bubbling(){
        
        var array = data
        var num = 0
        
        for i in 0..<array.count {
            
            let count = array.count - i - 1
            
            for j in 0..<count {
                let value = array[j]
                if(value > array[j+1]){
                    array[j] = array[j+1]
                    array[j+1] = value
                    num = num + 1
                }
            }
        }
        
        print("冒泡排序\(array) 次数\(num)")
    }
    
    //选择排序
    func choice() {
        
        var array = data
        var num = 0
        
        for i in 0..<array.count {
            let count = array.count - i
            var value = 0;
            for j in 1..<count {
                if(array[value] < array[j]){
                    value = j;
                    num = num + 1
                }
            }
            let n = array[count - 1];
            array[count - 1] = array[value];
            array[value] = n;
        }
        
        print("选择排序\(array) 次数\(num)")
        
    }
    
    //插入排序
    func insert() {
        
        var array = data
        var num = 0
        
        for i in 1..<array.count {
            let value = array[i];
            var tem = i;
            
            for j in 0..<i {
                tem = i - j - 1;
                if(value < array[tem]){
                    array[tem + 1] = array[tem]
                    num = num + 1
                }else{
                    tem = tem + 1;
                    break
                }
            }
            
            array[tem] = value
        }
        print("插入排序\(array) 次数\(num)")
    }
    
    //希尔排序
    func hill() {
    
        var data = self.data
        
        var gap = data.count / 2
        var num = 0
        
        while (1 <= gap) {
            
            for i in gap ..< data.count {
                var j = i - gap
                let tmp = data[i]
                while (j >= 0 && tmp < data[j]) {
                    data[j + gap] = data[j]
                    j -= gap
                    num = num + 1
                }
                data[j + gap] = tmp
            }
            gap /= 2
        }
        
        print("希尔排序\(data) 次数\(num)")
    }
    
    //希尔排序2
    func hill2() {
        
        var data = self.data
        
        var gap = data.count / 2
        var num = 0
        
        while (0 < gap) {
            
            for i in 0 ..< data.count {
                var j = i
                while j < data.count - gap {
                    if data[j] > data[j + gap] {
                        let temp = data[j]
                        data[j] = data[j + gap]
                        data[j + gap] = temp
                        num += 1
                    }
                    j = j + gap
                }
            }
            
            gap -= 1
        }
        
        print("希尔排序\(data) 次数\(num)")
    }
    
    func sort(a : inout [Int], left: Int ,right: Int )
    {
        if(left >= right)/*如果左边索引大于或者等于右边的索引就代表已经整理完成一个组了*/
        {
            return ;
        }
        
        var i = left;
        var j = right;
        let key = a[left];
    
        while(i < j)                               /*控制在当组内寻找一遍*/
        {
            while(i < j && key <= a[j])
                /*而寻找结束的条件就是，1，找到一个小于或者大于key的数（大于或小于取决于你想升
                 序还是降序）2，没有符合条件1的，并且i与j的大小没有反转*/
            {
                j -= 1;/*向前寻找*/
            }
            a[i] = a[j];
                /*找到一个这样的数后就把它赋给前面的被拿走的i的值（如果第一次循环且key是
                    a[left]，那么就是给key）*/
    
            while(i < j && key >= a[i])
                /*这是i在当组内向前寻找，同上，不过注意与key的大小关系停止循环和上面相反，
                 因为排序思想是把数往两边扔，所以左右两边的数大小与key的关系相反*/
            {
                i += 1;
            }
    
            a[j] = a[i];
        }
    
        a[i] = key;/*当在当组内找完一遍以后就把中间数key回归*/
        sort(a: &a, left: left, right: i - 1);/*最后用同样的方式对分出来的左边的小组进行同上的做法*/
        sort(a: &a, left: i + 1, right: right);/*用同样的方式对分出来的右边的小组进行同上的做法*/
        /*当然最后可能会出现很多分左右，直到每一组的i = j 为止*/
        
        print(a)
    }
    
}

