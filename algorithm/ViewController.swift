//
//  ViewController.swift
//  algorithm
//
//  Created by Hello on 2019/3/26.
//  Copyright © 2019 Hello. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let width = UIScreen.main.bounds.size.width

    var scrollView : UIScrollView = UIScrollView.init(frame: UIScreen.main.bounds)
    lazy var bubblingView: ChartsView = {
        let view = ChartsView.init(CGRect.init(x: 0, y: 60, width: width, height: width  * 0.4), self.data , title: "冒泡排序")
        return view
    }()
    
    lazy var choiceView: ChartsView = {
        let view = ChartsView.init(CGRect.init(x: 0, y: 60 + width * 0.4 + 20, width: width, height: width * 0.4), self.data , title: "选择排序")
        return view
    }()
    
    lazy var insertView: ChartsView = {
        let view = ChartsView.init(CGRect.init(x: 0, y: 60 + width * 0.4 * 2 + 20 * 2, width: width, height: width * 0.4), self.data , title: "插入排序")
        return view
    }()
    
    lazy var hillView: ChartsView = {
        let view = ChartsView.init(CGRect.init(x: 0, y: 60 + width * 0.4 * 3 + 20 * 3, width: width, height: width * 0.4), self.data , title: "希尔排序")
        return view
    }()
    
    lazy var hillView2: ChartsView = {
        let view = ChartsView.init(CGRect.init(x: 0, y: 60 + width * 0.4 * 4 + 20 * 4, width: width, height: width * 0.4), self.data , title: "希尔排序2")
        return view
    }()
    
    lazy var fastView: ChartsView = {
        let view = ChartsView.init(CGRect.init(x: 0, y: 60 + width * 0.4 * 5 + 20 * 5, width: width, height: width * 0.4), self.data , title: "快速排序")
        return view
    }()
    
    //八大金典排序算法
    var data : Array = [70,27,39,15,79,45,87,55,23,34,55,10,16];
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        self.view.addSubview(self.scrollView)
        self.scrollView.addSubview(self.bubblingView)
        self.scrollView.addSubview(self.choiceView)
        self.scrollView.addSubview(self.insertView)
        self.scrollView.addSubview(self.hillView)
        self.scrollView.addSubview(self.hillView2)
        self.scrollView.addSubview(self.fastView)

        
        self.scrollView.contentSize = CGSize.init(width: UIScreen.main.bounds.size.width, height: width * 8 + 130);
        
        let start = UIButton.init(frame: CGRect.init(x: 10, y: 20, width: 60, height: 44));
        start.setTitle("start", for: .normal)
        start.setTitleColor(UIColor.black, for: .normal)
        start.addTarget(self, action: #selector(self.startSort), for: .touchUpInside);
        self.view.addSubview(start)
        
//        self.sort(a: &self.data, left: 0, right: self.data.count - 1)
//        self.countingSort();
//        self.heapSort(sortArray: self.data);
    }
    
    @objc
    func startSort() {
//        self.bubblingSort();
//        self.choiceSort();
//        self.insertSort();
//        self.hillSort();
//        self.hillSort2();
        DispatchQueue.global(qos: .default).async {
            self.fastSort(a: &self.data, left: 0, right: self.data.count - 1);
        }
    }
    
    //冒泡排序
    func bubblingSort(){
        
        /*
         1. 比较相邻两个元素 ，如果第一个比第二个大，就交换它们两个；
         2. 对每一对相邻两个元素做相同的工作，从第一对到最后一对，这样在最后的元素就是最大的那个数。
         3. 针对所有的元素重复以上的步骤，除了最后一个；
         4. 重复步骤1~3，直到排序完成。
         */
        
        DispatchQueue.global(qos: .default).async {
            var array = self.data
            var num = 0
            for i in 0..<array.count {
                let count = array.count - i - 1
                for j in 0..<count {
                    let value = array[j]
                    if(value > array[j+1]){
                        array[j] = array[j+1]
                        array[j+1] = value
                        num = num + 1
                        self.bubblingView.animation(left: j, right: j + 1)
                        Thread.sleep(forTimeInterval: 1)
                    }
                }
            }
            print("冒泡排序\(array) 次数\(num)")
        }
    }
    
    //选择排序
    func choiceSort() {
        
        /*
         1. 初始状态：无序区为R[1..n]，有序区为空；
         2. 第i趟排序(i=1,2,3…n-1)开始时，当前有序区和无序区分别为R[1..i-1]和R(i..n）。该趟排序从当前无序区中-选出关键字最小的记录 R[k]，将它与无序区的第1个记录R交换，使R[1..i]和R[i+1..n)分别变为记录个数增加1个的新有序区和记录个数减少1个的新无序区；
         3. n-1趟结束，数组有序化了。
         */
        
        DispatchQueue.global(qos: .default).async {
            var array = self.data
            var num = 0
            //找小的
            for i in 0..<array.count {
                var vlaue = i;
                for j in i..<array.count {
                    if (array[j] < array[vlaue]) {
                        vlaue = j
                        num += 1
                    }
                }
                let number = array[i];
                array[i] = array[vlaue];
                array[vlaue] = number;
                self.choiceView.animation(left: i, right: vlaue)
                Thread.sleep(forTimeInterval: 1)
            }
            //找大的
//            for i in 0..<array.count {
//                let count = array.count - i
//                var value = 0;
//                for j in 1..<count {
//                    if(array[value] < array[j]){
//                        value = j;
//                        num = num + 1
//                    }
//                }
//                let n = array[count - 1];
//                array[count - 1] = array[value];
//                array[value] = n;
//                self.choiceView.animation(left: count - 1, right: value)
//                Thread.sleep(forTimeInterval: 1)
//            }
//            print("选择排序\(array) 次数\(num)")
        }
    }
    
    //插入排序
    func insertSort() {
        
        /*
         1. 从第一个元素开始，该元素可以认为已经被排序；
         2. 取出下一个元素，在已经排序的元素序列中从后向前扫描；
         3. 如果该元素（已排序）大于新元素，将该元素移到下一位置；
         4. 重复步骤3，直到找到已排序的元素小于或者等于新元素的位置；
         5. 将新元素插入到该位置后；
         6. 重复步骤2~5。
         */
        DispatchQueue.global(qos: .default).async {
            var array = self.data
            var num = 0
            
            for i in 1..<array.count {
                let value = array[i];
                var tem = i;
                
                for j in 0..<i {
                    tem = i - j - 1;
                    if(value < array[tem]){
                        array[tem + 1] = array[tem]
                        self.insertView.animation(left: tem, right: tem + 1)
                        Thread.sleep(forTimeInterval: 1)
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
        
    }
    
    //希尔排序
    func hillSort() {
    
        /*
         <1>选择一个增量序列t1，t2，…，tk，其中ti>tj，tk=1；
         <2>按增量序列个数k，对序列进行k 趟排序；
         <3>每趟排序，根据对应的增量ti，将待排序列分割成若干长度为m 的子序列，分别对各子表进行直接插入排序。仅增量因子为1 时，整个序列作为一个表来处理，表长度即为整个序列的长度。
         */
        DispatchQueue.global(qos: .default).async {
            var data = self.data
            // gap 为增量
            var gap = data.count / 2
            var num = 0
            
            //增量列表循环
            while (1 <= gap) {
                //直接从 gap开始 往后循环
                for i in gap ..< data.count {
                    var j = i - gap    //找到 与 i对应的j
                    let tmp = data[i]  //tmp 将要排序的数
                    while (j >= 0 && tmp < data[j]) {
                        data[j + gap] = data[j]  // 如果 i和j 对应的数据需要排序 就调换位置排序

                        self.hillView.animation(left: j + gap, right: j)
                        Thread.sleep(forTimeInterval: 1)
                        
                        j -= gap                 // 找下一个 j（例如 长度为10 的数组 gap 为 2时i为8时 j就以此为 6 4 2 0)
                        num = num + 1
                    }
                    data[j + gap] = tmp
                }
                gap /= 2 // gap 增量对半
            }
            print("希尔排序\(data) 次数\(num)")
        }
    }
    
    //希尔排序2
    func hillSort2() {
        DispatchQueue.global(qos: .default).async {
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
                            self.hillView2.animation(left: j + gap, right: j)
                            Thread.sleep(forTimeInterval: 1)
                        }
                        j = j + gap
                    }
                }
                gap -= 1
            }
            print("希尔排序\(data) 次数\(num)")
        }
        
    }
    
    //快速排序
    /*
     <1>从数列中挑出一个元素，称为 “基准”（pivot）；
     <2>重新排序数列，所有元素比基准值小的摆放在基准前面，所有元素比基准值大的摆在基准的后面（相同的数可以到任一边）。在这个分区退出之后，该基准就处于数列的中间位置。这个称为分区（partition）操作；
     <3>递归地（recursive）把小于基准值元素的子数列和大于基准值元素的子数列排序。
     */
    func fastSort(a : inout [Int], left: Int ,right: Int )
    {
        if(left >= right)/*如果左边索引大于或者等于右边的索引就代表已经整理完成一个组了*/
        {
            return ;
        }
        
        var i = left;
        var j = right;
        let key = a[left];
    //[70,27,39,15,79,45,87,55,23,34,55,10,16];
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
            print(a)
            
//            self.fastView.animation(left: i, right: j);
//            Thread.sleep(forTimeInterval: 2)
            while(i < j && key >= a[i])
                /*这是i在当组内向前寻找，同上，不过注意与key的大小关系停止循环和上面相反，
                 因为排序思想是把数往两边扔，所以左右两边的数大小与key的关系相反*/
            {
                i += 1;
            }
    
            a[j] = a[i];
            print(a)
//            self.fastView.animation(left: j, right: i);
//            Thread.sleep(forTimeInterval: 2)
        }
    
        a[i] = key;/*当在当组内找完一遍以后就把中间数key回归*/
        fastSort(a: &a, left: left, right: i - 1);/*最后用同样的方式对分出来的左边的小组进行同上的做法*/
        fastSort(a: &a, left: i + 1, right: right);/*用同样的方式对分出来的右边的小组进行同上的做法*/
        /*当然最后可能会出现很多分左右，直到每一组的i = j 为止*/
        print(a)
    }
    
    //计数排序
    /*
     1. 找出待排序的数组中最大和最小的元素；
     2. 统计数组中每个值为i的元素出现的次数，存入数组C的第i项；
     3. 对所有的计数累加（从C中的第一个元素开始，每一项和前一项相加）；
     4. 反向填充目标数组：将每个元素i放在新数组的第C(i)项，每放一个元素就将C(i)减去1。
     */
    func countingSort()  {
        
        var max = self.data[0]
        
        for j in 1..<self.data.count {
            if(max < self.data[j]){
                max = self.data[j];
            }
        }//找到最大值
        
        var data = self.data
    
        var backetArray:[NSInteger] = Array.init(repeating: 0, count: max + 1),
            sortedIndex = 0,
            arrayLen = data.count,
            bucketLen = max + 1
        
        var i = 0
        while i < arrayLen {
            let key: Int = data[i]
            backetArray[key] += 1
            print("key : \(key) count:\(backetArray[key])")
            i += 1
        }
        
        var n = 0
        
        while n < bucketLen {
            while backetArray[n] > 0 {
                data[sortedIndex] = n;
                sortedIndex  += 1
                backetArray[n] -= 1
            }
            n += 1
        }
        
        print("计数排序\(data)")
    }
    
    
    // 堆排序
    var len :Int = 0
    
    func heapSort(sortArray:[NSInteger]) -> Void {
        
        if sortArray.count <= 1 {
            return;
        }
        var tempSortArray = sortArray
        print(tempSortArray);
        buildMaxHeap(array: &tempSortArray)
        print(tempSortArray);
        var index = tempSortArray.count - 1
        while index > 0 {
            swap(array: &tempSortArray, leftIndex: 0, rightIndex: index)
            len -= 1
            heapify(array: &tempSortArray, index: 0)
            index -= 1
        }
        print("堆排序\(tempSortArray)")
    }
    
    func buildMaxHeap(array: inout [NSInteger]) -> Void {
        len = array.count
        var i = len / 2
        while i >= 0 {
            heapify(array: &array, index: i)
            i -= 1
        }
    }
    
    func heapify(array: inout [NSInteger], index: Int) -> Void {
     
        var left = 2 * index + 1, right = 2 * index + 2, largest = index
        
        if left < len && array[left] > array[largest] {
            largest = left
        }
        
        if right < len && array[right] > array[largest] {
            largest = right
        }
        
        if largest != index {
            swap(array: &array, leftIndex: index, rightIndex: largest)
            heapify(array: &array, index: largest)
        }
    }
    
    func swap(array: inout [NSInteger], leftIndex:Int, rightIndex:Int) -> Void {
        let temp  = array[leftIndex]
        array[leftIndex] =  array[rightIndex]
        array[rightIndex] = temp
    }
}

