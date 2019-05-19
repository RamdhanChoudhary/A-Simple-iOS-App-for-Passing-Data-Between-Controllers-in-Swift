//
//  ViewControllerB.swift
//  Passing Data in Controllers
//
//  Created by RAMDHAN CHOUDHARY on 18/05/19.
//  Copyright © 2019 RDC. All rights reserved.
//

import UIKit

//MARK:  - - - -  Method for Passing Data through Delegate  - - - - - -
//Protocol decleare
protocol ViewControllerBDelegate: NSObjectProtocol {
    
    // Classes that adopt this protocol MUST define
    // this method -- and hopefully do something in
    // that definition.
    func addItemViewController(_ controller: ViewControllerB?, didFinishEnteringItem item: String?)
}



class ViewControllerB: UIViewController {
    
    //MARK:  - - - -  Delegate variable for Passing Data through Delegate  - - - - - -
    var delegate: ViewControllerBDelegate?
    
    //MARK:  - - - -  Variable for Passing Data through Delegate,Segue, Navigation push   - - - - - -
    var isSomethingEnabled = false
    
    //MARK:  - - - -  Variable for Passing Data through Block   - - - - - -
    var authorizationCompletionBlock:((Bool)->())? = {_ in}

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Print value received through segue, navigation push
        print("Value of 'isSomethingEnabled' from ViewControllerA : ", isSomethingEnabled)
        
        //MARK:  - - - -  Set Data for Passing Data through Delegate  - - - - - -
        delegate?.addItemViewController(self, didFinishEnteringItem: "Data for ViewControllerA")
        
        
        //MARK: - - - - - Set data for Passing Data through Post Notification - - - - -
        let objToBeSent = "Test Message from Notification"
        NotificationCenter.default.post(name: Notification.Name("NotificationIdentifier"), object: objToBeSent)
        
        //MARK: - - - - - Set data for Passing Data through Block - - - - -
        if authorizationCompletionBlock != nil
        {
            authorizationCompletionBlock!(true)
        }
    }
}
