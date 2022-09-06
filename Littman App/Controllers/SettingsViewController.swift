//
//  SettingsViewController.swift
//  Littman App
//
//  Created by Littman Library on 8/4/22.
//

import UIKit

class SettingsViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    @IBOutlet weak var hamburgerIcon: UIBarButtonItem!
    @IBOutlet weak var tableView: UITableView!
    var titleArray = ["Dark Mode","Large Font"]
    override func viewDidLoad() {
        self.tableView.separatorColor = .gray
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self, selector: #selector(reloadTableView), name: Notification.Name("ModeSwiched"), object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(reloadTableView), name: Notification.Name("FontSwiched"), object: nil)
        self.setUI()

        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        let backBarBtnItem = UIBarButtonItem()
        backBarBtnItem.title = "Back"
        navigationController?.navigationBar.backItem?.backBarButtonItem = backBarBtnItem
        if self.traitCollection.userInterfaceStyle == .light{
            hamburgerIcon.tintColor = .black
        }
        else{
            hamburgerIcon.tintColor = .white
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        let backBarBtnItem = UIBarButtonItem()
        backBarBtnItem.title = "Back"
        navigationController?.navigationBar.backItem?.backBarButtonItem = backBarBtnItem
    }
     
    func setUI(){
        let longTitleLabel = UILabel()
        longTitleLabel.text = textConstants.settingsTitle
        longTitleLabel.font = UIFont(name: fontConstant.boldFont, size: 28)
        longTitleLabel.sizeToFit()
        let leftItem = UIBarButtonItem(customView: longTitleLabel)
        self.navigationItem.leftBarButtonItem = leftItem
        

    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:SettingsTableViewCell = tableView.dequeueReusableCell(withIdentifier: textConstants.menuCell, for: indexPath) as! SettingsTableViewCell
        switch indexPath.row{
        case 0:
            cell.settingsSwitch.tag = 0
            cell.titleLabel.text = titleArray[indexPath.row]
            if self.traitCollection.userInterfaceStyle == .dark {
                cell.settingsSwitch.isOn = true
            }else{
                cell.settingsSwitch.isOn = false
            }
               
        case 1:
            cell.settingsSwitch.tag = 1
            cell.titleLabel.text = titleArray[indexPath.row]
            if self.traitCollection.userInterfaceStyle == .dark {
                cell.settingsSwitch.isOn = true
            }else{
                cell.settingsSwitch.isOn = false
            }
        default:
            cell.titleLabel.text = "About"
            
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 45
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       
    }
    @objc func reloadTableView(){
        if (self.traitCollection.userInterfaceStyle == .dark) {
            self.tabBarController?.tabBar.backgroundColor = UIColor(red: 26/255, green: 26/255, blue: 28/255, alpha: 1.0)
            self.hamburgerIcon.tintColor = .white
            }
        else{
            self.tabBarController?.tabBar.backgroundColor = UIColor.white
            self.hamburgerIcon.tintColor = .black
    }
        self.tableView.reloadData()
    }
    
    @IBAction func popSettings(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
}
