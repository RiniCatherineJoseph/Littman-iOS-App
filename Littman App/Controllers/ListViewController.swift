//
//  ListViewController.swift
//  Littman App
//
//  Created by Littman Library on 8/8/22.
//

import UIKit

class ListViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    @IBOutlet weak var hamburgerIcon: UIBarButtonItem!
    
    
    @IBOutlet weak var listTableView: UITableView!
    var listPublicationArray:[String] = []
    var listEventArray:[String] = []
    var type = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        listTableView.separatorColor = UIColor.gray
       
        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch type{
        case textConstants.eventListTitle:
            return listEventArray.count
            
            
        case textConstants.publicationListTitle:
            return listPublicationArray.count
            
        default:
            return 0
            
            
        }
    
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch type{
        case textConstants.eventListTitle:
         
            let cell:ListTableViewCell = tableView.dequeueReusableCell(withIdentifier: textConstants.listCell, for: indexPath) as! ListTableViewCell
            cell.selectionStyle = .none
            cell.firstLabel.font = UIFont(name: fontConstant.mediumFont, size: 16)
            cell.secondLabel.font = UIFont(name: fontConstant.mediumFont, size: 11)
            cell.listImageView?.image =  UIImage(named: listEventArray[indexPath.row])
            return cell
            
            
        case textConstants.publicationListTitle:
            
            let cell:ListTableViewCell = tableView.dequeueReusableCell(withIdentifier: textConstants.listCell, for: indexPath) as! ListTableViewCell
            cell.selectionStyle = .none
            cell.firstLabel.font = UIFont(name: fontConstant.mediumFont, size: 16)
            cell.secondLabel.font = UIFont(name: fontConstant.mediumFont, size: 11)
            cell.listImageView?.image =  UIImage(named: listPublicationArray[indexPath.row])
            
            return cell
            
        default:
            let cell:ListTableViewCell = tableView.dequeueReusableCell(withIdentifier: textConstants.listCell, for: indexPath) as! ListTableViewCell
            cell.imageView?.image =  UIImage(named: listEventArray[indexPath.row])
            return cell
        }
    }

}
