//
//  SearchViewController.swift
//  Littman App
//
//  Created by Littman Library on 8/2/22.
//

import UIKit

class SearchViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUI()
        // Do any additional setup after loading the view.
    }
    
    func setUI() {
        
        let longTitleLabel = UILabel()
        longTitleLabel.text = textConstants.searchTitle
        longTitleLabel.font = UIFont(name: fontConstant.boldFont, size: 28)
        longTitleLabel.sizeToFit()
        let leftItem = UIBarButtonItem(customView: longTitleLabel)
        self.navigationItem.leftBarButtonItem = leftItem
    }
    
    @IBAction func showSettings(_ sender: Any) {
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "littmansettings") as! SettingsViewController
        self.navigationController?.pushViewController(nextViewController, animated: true)
    }
}
