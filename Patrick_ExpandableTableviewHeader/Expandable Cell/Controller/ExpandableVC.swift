//
//  ExpandableVC.swift
//  Patrick_ExpandableTableviewHeader
//
//  Created by pratik panchal on 28/12/17.
//  Copyright © 2017 pratik panchal. All rights reserved.
//

import UIKit

class ExpandableVC: UIViewController {

    @IBOutlet weak var lblTitleNav: UIButton!
    @IBOutlet weak var tblNotifications: UITableView!
    
    var selectedImage = UIImage()
    var SelectedSectionArray = NSMutableArray()
    var SectionclickIndex = Int()
    
    var arryNotificationData = ["I LIKE YOU","FOLLOWERS","COMMENTS"]

    
    //MARK:- View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.loadExpandableCellXIB()
        
        tblNotifications.estimatedRowHeight = 90
        tblNotifications.rowHeight = UITableViewAutomaticDimension
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    



}

extension ExpandableVC : UITableViewDelegate,UITableViewDataSource{
    
    func loadExpandableCellXIB()
    {
        tblNotifications.register(UINib(nibName: "cellExerciseListDetailsExpandable", bundle: nil), forHeaderFooterViewReuseIdentifier: "cellExerciseListDetailsExpandable")

    }
    
    //MARK:- UITableview DataSource and Delegate
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 90
        
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
                return UITableViewAutomaticDimension
//        return 90
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let headerView = tblNotifications.dequeueReusableHeaderFooterView(withIdentifier: "cellExerciseListDetailsExpandable") as! cellExerciseListDetailsExpandable
        
        headerView.lblTitle.text = arryNotificationData[section]
        
        switch section {
        case 0:
            headerView.imgIconbackground.image = #imageLiteral(resourceName: "Address")
            break
        case 1:
            headerView.imgIconbackground.image = #imageLiteral(resourceName: "Address")
            break
        case 2:
            headerView.imgIconbackground.image = #imageLiteral(resourceName: "Address")
            break
        default:
            headerView.imgIconbackground.image = #imageLiteral(resourceName: "Address")
            
        }    
        
        headerView.btnExpand.tag = section
        headerView.btnExpand.addTarget(self, action: #selector(selectedSectionStoredButtonClicked(sender:)), for: .touchUpInside)
        
        return headerView
    }
    
    @objc func selectedSectionStoredButtonClicked (sender : UIButton) {
        
        SectionclickIndex = sender.tag
        
        if (SelectedSectionArray.contains(sender.tag)){
            SelectedSectionArray.remove(sender.tag)
            
        }else{
            SelectedSectionArray.add(sender.tag)
            
        }
        tblNotifications.reloadSections([SectionclickIndex], with: .automatic)
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int
    {
        let numOfSections: Int = 3
        tableView.separatorStyle = .none
        
        return numOfSections
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if (SelectedSectionArray.contains(section)){
            return  3
        }else{
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell:cellNotifications = tableView.dequeueReusableCell(withIdentifier: "cellNotifications", for: indexPath) as! cellNotifications
        cell.lblName.text = ""
        
        if indexPath.section == 1{
            cell.lblName.text = "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book."
        }else{
         
             cell.lblName.text  = "Hello"
        }
        
        cell.selectionStyle = UITableViewCellSelectionStyle.none
        
        return cell
    }
}
