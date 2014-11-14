//
//  DataViewController.swift
//  Tucck
//
//  Created by Mariem Ayadi on 11/3/14.
//  Copyright (c) 2014 Mariem Ayadi. All rights reserved.
//

import UIKit

class DataViewController: UIViewController, FBLoginViewDelegate {

    @IBOutlet weak var dataLabel: UILabel!
    var dataObject: AnyObject?
    
    @IBOutlet var fbLoginView : FBLoginView!


    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.fbLoginView.delegate = self
        self.fbLoginView.readPermissions = ["public_profile", "email", "user_friends"]
    }
    
    //FACEBOOK DELEGTE METHODS
    //The First two are called when the user has already logged in.

    func loginViewShowingLoggedInUser(loginView: FBLoginView!) {
        println("User Logged In")
        println("This is where you perform a segue")
    }
    
    func loginViewFetchedUserInfo(loginView: FBLoginView!, user: FBGraphUser!) {
        println("User Name: \(user.name))")
    }
    
    func loginViewShowingLoggedOutUser(loginView: FBLoginView!) {
        println("User Logged Out")
    }
    
    func loginView(loginView: FBLoginView!, handleError error: NSError!) {
        println("Error: \(handleError.localizedDescription)")
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        if let obj: AnyObject = dataObject {
            self.dataLabel!.text = obj.description
        } else {
            self.dataLabel!.text = ""
        }
    }


}

