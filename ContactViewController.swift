//
//  ContactViewController.swift
//  微信
//
//  Created by 方瑾 on 2019/2/8.
//  Copyright © 2019 方瑾. All rights reserved.
//

import UIKit

class ContactViewController: UIViewController {
    
    @IBOutlet weak var friendListTableView: UITableView!
    var afriends : [friendInfo] = [friendInfo(name: "马云", imageName: "马云", sex:.Male, wechatID: "ma23", location: "中国杭州", group: "企业"),
                                   friendInfo(name: "董明珠", imageName: "董明珠", sex:.Female, wechatID: "dong123", location: "中国南京", group: "企业"),
                                   friendInfo(name: "王思聪", imageName: "wangsic", sex:.Male, wechatID: "wang456", location: "中国北京", group: "企业"),
                                   friendInfo(name: "王马化腾", imageName: "马化腾", sex:.Male, wechatID: "马123", location: "中国海南", group: "企业"),]
    var bfriends : [friendInfo] = [friendInfo(name: "王健林", imageName: "王健林", sex:.Male, wechatID: "wang123",         location: "中国北京", group: "企业"),
                                   friendInfo(name: "董明珠", imageName: "董明珠", sex:.Female, wechatID: "dong123", location: "中国南京", group: "企业"),
                                   friendInfo(name: "王思聪", imageName: "wangsic", sex:.Male, wechatID: "wang456", location: "中国北京", group: "企业"),
                                   friendInfo(name: "王马化腾", imageName: "马化腾", sex:.Male, wechatID: "马123", location: "中国海南", group: "企业"),]
    var cfriends : [friendInfo] = [friendInfo(name: "王健林", imageName: "王健林", sex:.Male, wechatID: "wang123",         location: "中国北京", group: "企业"),
                                   friendInfo(name: "马云", imageName: "马云", sex:.Male, wechatID: "ma23", location: "中国杭州", group: "企业"),
                                   friendInfo(name: "王思聪", imageName: "wangsic", sex:.Male, wechatID: "wang456", location: "中国北京", group: "企业"),
                                   friendInfo(name: "王马化腾", imageName: "马化腾", sex:.Male, wechatID: "马123", location: "中国海南", group: "企业"),]
    var dfriends : [friendInfo] = [friendInfo(name: "王健林", imageName: "王健林", sex:.Male, wechatID: "wang123",         location: "中国北京", group: "企业"),
                                   friendInfo(name: "马云", imageName: "马云", sex:.Male, wechatID: "ma23", location: "中国杭州", group: "企业"),
                                   friendInfo(name: "董明珠", imageName: "董明珠", sex:.Female, wechatID: "dong123", location: "中国南京", group: "企业"),
                                   friendInfo(name: "王马化腾", imageName: "马化腾", sex:.Male, wechatID: "马123", location: "中国海南", group: "企业"),]
    
    var functionArray = ["新的好友","群聊","标签","公众号"]
    var indexArray = ["A","B","C","D"]
    
    //索引数组
    override func viewDidLoad() {
        super.viewDidLoad()
        friendListTableView.delegate = self
        friendListTableView.dataSource = self
        friendListTableView.tableFooterView = UIView()
        
        
    }
    
    //    @IBAction func toEdit(_ sender: UIBarButtonItem) {
    //        friendListTableView.isEditing = true   //允许编辑
    //        friendListTableView.reloadData()      //刷新，让它再读取一遍代码
    //    }
    //
    //
    //
    }
    extension ContactViewController : UITableViewDelegate,UITableViewDataSource {
        func numberOfSections(in tableView: UITableView) -> Int {
            return indexArray.count + 2 //索引数+检索+功能部分
        }
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            switch section {
            //搜索框
            case 0:
                return 1
            //新的朋友+群聊+标签+公众号
            case 1:
                return 4
            //好友列表
            case 2:
                return afriends.count
            case 3:
                return bfriends.count
            case 4:
                return cfriends.count
            case 5:
                return dfriends.count
            default:
                return 0
            }
        }
        func tableView(_ tableView: UITableView, cellForRowAt indexPath:IndexPath) -> UITableViewCell {
            switch indexPath.section {
            //输入框
            case 0:
                let cell = tableView.dequeueReusableCell(withIdentifier: "SearchCell", for: indexPath) as!SearchTableViewCell
                    cell.searchTextField.delegate = self
                //delegate : 拓展交互的功能，交互就是对于操作之后，产生的反应（回馈）
                //datasource：设置显示的数据
                return cell
            //新的朋友+群聊+标签+公众号
            case 1:
                let cell = tableView.dequeueReusableCell(withIdentifier: "FriendCell", for: indexPath) as! FriendTableViewCell
                cell.nameLabel.text = functionArray[indexPath.row]
                cell.avatarImageView.image = nil//表示图片被重用
                return cell
            // 好友列表
            case 2...5:
                let cell = tableView.dequeueReusableCell(withIdentifier: "FriendCell", for: indexPath) as! FriendTableViewCell
                var targetInfo = [friendInfo]()
                switch indexPath.section {
                case 2:
                    targetInfo = afriends
                case 3:
                    targetInfo = bfriends
                case 4:
                    targetInfo = cfriends
                case 5:
                    targetInfo = dfriends
                default:
                    break
                    
                }
                cell.avatarImageView.image = UIImage(named: targetInfo[indexPath.row].imageName!)
                cell.nameLabel.text = targetInfo[indexPath.row].name
                return cell
                
            default:
                return UITableViewCell()
            }
        }
        func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
            if section < 2 {
                return nil
            } else {
                return indexArray[section-2]
            }
            
        }
        func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {//section的高度
            switch indexPath.section {
            case 0:   //搜索n部分
                return 30
            default:  //其他部分
                return 50
            }
        }
//        //设置哪些行可以进行编辑
//        func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
//            if indexPath.section < 2 {
//                return false
//            } else {
//                return true
//            }
//        }
//        //很多种编辑，比如删除，添加还是其他的。在这里进行编辑
//        func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
//            return .delete
//        }
//
//
//        func tableView(_ tableView: UITableView, titleForDeleteConfirmationButtonForRowAt indexPath: IndexPath) -> String? {
//            return "删除"  //表示删除时表示删除
//        }
//        func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
//            switch indexPath.section {
//            case 2:
//                afriends.remove(at: indexPath.row)
//            case 3:
//                bfriends.remove(at: indexPath.row)
//            case 4:
//                cfriends.remove(at: indexPath.row)
//            case 5:
//                dfriends.remove(at: indexPath.row)
//            default:
//                break
//
//            }
            //        tableView.isEditing = false 不允许编辑
            //        friendListTableView.endEditing(true)   表示收起键盘，不允许编辑
//            tableView.deleteRows(at: [indexPath], with: .left)  //删除行数
//            tableView.setEditing(false, animated: true)    // 设置编辑
            //        tableView.reloadData()重新加载
//        }
        //设置索引显示内容
        func sectionIndexTitles(for tableView: UITableView) -> [String]? {
            return indexArray
        }
        //关联索引和对应的section
        func tableView(_ tableView: UITableView, sectionForSectionIndexTitle title: String, at index: Int) -> Int {
            return index + 2
        }
        
        
        
        
    }

extension ContactViewController: UITextFieldDelegate {
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        performSegue(withIdentifier: "ToSearch", sender: nil)
        return false
    }
    

    
    
    
    
    
}



