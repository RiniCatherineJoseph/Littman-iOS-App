//
//  SearchViewController.swift
//  Littman App
//
//  Created by Littman Library on 8/2/22.
//

import UIKit

class SearchViewController: UIViewController {
    @IBOutlet weak var course: UIButton!
    @IBOutlet weak var journals: UIButton!
    @IBOutlet weak var books: UIButton!
    @IBOutlet weak var hamburgerIcon: UIBarButtonItem!
    @IBOutlet weak var searchBar: UISearchBar!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.setUI), name: Notification.Name("ModeSwiched"), object: nil)
        self.setUI()
        // Do any additional setup after loading the view.
    }
//    override func viewWillAppear(_ animated: Bool) {
//        if self.traitCollection.userInterfaceStyle == .light{
//            course.titleLabel?.textColor = UIColor.black
//            journals.titleLabel?.textColor = UIColor.black
//            books.titleLabel?.textColor = UIColor.black
//        }else if self.traitCollection.userInterfaceStyle == .dark{
//            course.titleLabel?.textColor = UIColor.white
//            journals.titleLabel?.textColor = UIColor.white
//            books.titleLabel?.textColor = UIColor.white
//
//        }else{
//            course.titleLabel?.textColor = UIColor.white
//            journals.titleLabel?.textColor = UIColor.white
//            books.titleLabel?.textColor = UIColor.white
//        }
//    }
    override func viewWillAppear(_ animated: Bool) {
        if self.traitCollection.userInterfaceStyle == .light{
            hamburgerIcon.tintColor = .black
        }
        else{
            hamburgerIcon.tintColor = .white
        }
    }
    @objc func setUI() {
        if self.traitCollection.userInterfaceStyle == .light{
            course.setTitleColor(UIColor.black, for: .normal)
            journals.setTitleColor(UIColor.black, for: .normal)
            books.setTitleColor(UIColor.black, for: .normal)
            self.hamburgerIcon.tintColor = .black
            if let textfield = searchBar.value(forKey: "searchField") as? UITextField {

                textfield.backgroundColor = UIColor.lightGray
                textfield.attributedPlaceholder = NSAttributedString(string: textfield.placeholder ?? "", attributes: [NSAttributedString.Key.foregroundColor : UIColor.gray])

                if let leftView = textfield.leftView as? UIImageView {
                    leftView.image = leftView.image?.withRenderingMode(.alwaysTemplate)
                    leftView.tintColor = UIColor.gray
                }

            }
            

        }else{
            self.hamburgerIcon.tintColor = .white
            course.setTitleColor(UIColor.white, for: .normal)
            journals.setTitleColor(UIColor.white, for: .normal)
            books.setTitleColor(UIColor.white, for: .normal)
            if let textfield = searchBar.value(forKey: "searchField") as? UITextField {

                textfield.backgroundColor = UIColor.white
                textfield.attributedPlaceholder = NSAttributedString(string: textfield.placeholder ?? "", attributes: [NSAttributedString.Key.foregroundColor : UIColor.gray])

                if let leftView = textfield.leftView as? UIImageView {
                    leftView.image = leftView.image?.withRenderingMode(.alwaysTemplate)
                    leftView.tintColor = UIColor.gray
                }

            }
            

        }
        
        
        
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
