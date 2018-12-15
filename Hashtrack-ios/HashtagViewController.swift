//
//  HashtagViewController.swift
//  Hashtrack-ios
//
//  Created by Joe Birch on 11/11/2018.
//  Copyright © 2018 hitherejoe. All rights reserved.
//

import Foundation
import Firebase
import FirebaseUI

class HashtagViewController: UIViewController, UITableViewDelegate {
    
    var firestore: Firestore?
    var network: String?
    var dataSource: FUIFirestoreTableViewDataSource?
    var data: [DocumentSnapshot]?
    private var myTableView: UITableView!
    
    init(firestore: Firestore, network: String) {
        self.firestore = firestore
        self.network = network
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        
        let textView = UITextView(frame: CGRect(x: 50.0, y: 150.0, width: 250.0, height: 100.0))
        textView.center = self.view.center
        textView.accessibilityIdentifier = "networkLabel"
        textView.textAlignment = NSTextAlignment.center
        self.view.addSubview(textView)
        textView.text = "Content screen for " + network!
        /*
        let barHeight: CGFloat = UIApplication.shared.statusBarFrame.size.height
        let displayWidth: CGFloat = self.view.frame.width
        let displayHeight: CGFloat = self.view.frame.height
        
        let alertController = UIAlertController(title: network, message:
            "You have selected " + network! , preferredStyle: UIAlertController.Style.alert)
        alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertAction.Style.default,handler: nil))
        
        self.present(alertController, animated: true, completion: nil)
        
        myTableView = UITableView(frame: CGRect(x: 0, y: barHeight, width: displayWidth, height: displayHeight - barHeight))
        myTableView.register(UITableViewCell.self, forCellReuseIdentifier: "MyCell")
        myTableView.tableFooterView = UIView(frame: CGRect())
        myTableView.delegate = self
        self.view.addSubview(myTableView)
        let query = self.firestore?.collection("Sab groups")
        
        self.dataSource = FUIFirestoreTableViewDataSource(query: query!, populateCell: { (tableView, indexPath, snapshot) -> UITableViewCell in
            let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell")!
            let data = snapshot.data()!
            cell.accessoryType = .disclosureIndicator
            cell.textLabel?.text = data["name"] as? String
            return cell
        })
        
        dataSource?.bind(to: myTableView)
 */
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selected = self.dataSource?.items[indexPath.row]
        let name = selected?.get("facebook") as! String
        
        if UIApplication.shared.canOpenURL(URL(string: "fb://profile/" + name)!) {
            UIApplication.shared.open(URL(string: "fb://profile/" + name)!, options: [:])
        } else {
            UIApplication.shared.open(URL(string: "https://facebook.com/" + name)!, options: [:])
        }
    }
    
}

