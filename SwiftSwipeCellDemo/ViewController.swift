//
//  ViewController.swift
//  SwiftSwipeCellDemo
//
//  Created by healthmanage on 16/12/30.
//  Copyright © 2016年 healthmanager. All rights reserved.
//左滑出现操作按钮

import UIKit

//结构体
struct namePhone{
    let name:String
    let phone:String
}

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    var myTableView = UITableView()
    var dataArray = [namePhone(name:"张三",phone:"1111111111"),namePhone(name:"李四",phone:"2222222222"),namePhone(name:"小名",phone:"3333333333"),namePhone(name:"小红",phone:"44444444444"),namePhone(name:"小刚",phone:"5555555555"),namePhone(name:"小李",phone:"6666666666"),namePhone(name:"消耗",phone:"7777777777")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        myTableView = UITableView.init(frame: CGRect.init(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height), style: .plain)
        myTableView.delegate = self
        myTableView.dataSource = self
        myTableView.rowHeight = 100
        self.view.addSubview(myTableView)
    }
    //MARK:----------UITableViewDelegate,UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var myCell = tableView.dequeueReusableCell(withIdentifier: "cell")
        if myCell == nil {
            myCell = UITableViewCell.init(style: .value1, reuseIdentifier: "cell")
        }
        myCell?.selectionStyle = .none
        
        let namePho = dataArray[indexPath.row]
        myCell?.textLabel?.text = namePho.name
        myCell?.detailTextLabel?.text = namePho.phone
        
        return myCell!
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //添加一个警告框
        let alertContro = UIAlertController.init(title: "温馨提示", message: "展示的是侧滑进行操作的Demo", preferredStyle: .alert)
        let okAction = UIAlertAction.init(title: "确定", style: .default) { (action) in
            print("此时点击的是。。。确定。。。按钮")
        }
        let cancleActi = UIAlertAction.init(title: "取消", style: .cancel) {
            (action) in
            print("此时点击的是。。。取消。。。按钮")
        }
        alertContro.addAction(okAction)
        alertContro.addAction(cancleActi)
        self.present(alertContro, animated: true, completion: nil)
    }
    //设计侧滑按钮
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        
        let deleteRowAc = UITableViewRowAction.init(style: .default, title: "🗑\n删除") { (rowAction, aIndexPath) in
            print("当前点击的是...删除...按钮")
        }
        deleteRowAc.backgroundColor = UIColor.lightGray
        
        let addRowAc = UITableViewRowAction.init(style: .default, title: "➕\n增加") { (rowAction, aIndexPath) in
            print("当前点击的是...增加...按钮")
        }
        addRowAc.backgroundColor = UIColor.red
        
        //destructive:破坏性的，消极的
        let shareRowAc = UITableViewRowAction.init(style: .default, title: "share\n分享") { (rowAction, aIndexPath) in
            //调起系统的分享样式
            let oneActivityItem = self.dataArray[indexPath.row]
            
            let activityVC = UIActivityViewController.init(activityItems: [oneActivityItem], applicationActivities: nil)
            
            self.present(activityVC, animated: true, completion: nil)
        }
        shareRowAc.backgroundColor = UIColor.blue
        
        let updateRowAc = UITableViewRowAction.init(style: .normal, title: "update\n更新") { (rowAction, aIndexPath) in
            print("当前点击的是...更新...按钮")
        }
        updateRowAc.backgroundColor = UIColor.green
        
        //显示正好与数组中的位置相反:数组中的位置是从左到右，显示的位置是从右到左
        return [deleteRowAc,addRowAc,shareRowAc,updateRowAc]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

