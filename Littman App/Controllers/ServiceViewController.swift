//
//  ServiceViewController.swift
//  Littman App
//
//  Created by Littman Library on 8/2/22.
//

import UIKit

class ServiceViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var serviceTableView: UITableView!
    @IBOutlet weak var hamburgerIcon: UIBarButtonItem!
    var serviceArray : [String] = ["Ask Us!"]

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUI()
        serviceTableView.separatorStyle = .singleLine
        serviceTableView.separatorColor = .gray
        NotificationCenter.default.addObserver(self, selector: #selector(self.setUI), name: Notification.Name("ModeSwiched"), object: nil)
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        if self.traitCollection.userInterfaceStyle == .light{
            hamburgerIcon.tintColor = .black
        }
        else{
            hamburgerIcon.tintColor = .white
        }
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        serviceArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:ServiceTableViewCell = tableView.dequeueReusableCell(withIdentifier: textConstants.serviCecell, for: indexPath) as! ServiceTableViewCell
        cell.serviceLabel.text = serviceArray[indexPath.row]
        cell.selectionStyle = .none
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row{
        case 1:
            break;
        case 0:
            let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
            let nextViewController = storyBoard.instantiateViewController(withIdentifier:"AskUS" ) 
            self.navigationController?.pushViewController(nextViewController, animated: true)
        default:
            break;
        }
    }
    @objc func setUI() {
        
        let longTitleLabel = UILabel()
        longTitleLabel.text = textConstants.serviceTitle
        longTitleLabel.font = UIFont(name: fontConstant.boldFont, size: 28)
        longTitleLabel.sizeToFit()
        let leftItem = UIBarButtonItem(customView: longTitleLabel)
        self.navigationItem.leftBarButtonItem = leftItem
        if self.traitCollection.userInterfaceStyle == .light{
            hamburgerIcon.tintColor = .black
        }
        else{
            hamburgerIcon.tintColor = .white
        }
    }
    
    @IBAction func showSettings(_ sender: Any) {
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "littmansettings") as! SettingsViewController
        self.navigationController?.pushViewController(nextViewController, animated: true)
    }
}
