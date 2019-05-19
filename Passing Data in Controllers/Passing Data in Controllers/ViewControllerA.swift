//
//  ViewController.swift
//  Passing Data in Controllers
//
//  Created by RAMDHAN CHOUDHARY on 18/05/19.
//  Copyright © 2019 RDC. All rights reserved.
//

import UIKit

class ViewControllerA: UIViewController, ViewControllerBDelegate  {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //MARK: - - - - - Code for Passing Data through Notification Observer - - - - -
        // add observer in controller(s) where you want to receive data
        NotificationCenter.default.addObserver(self, selector: #selector(self.methodOfReceivedNotification(notification:)), name: Notification.Name("NotificationIdentifier"), object: nil)
    }
    
    
    // +++++++++++++++ Reciving Data +++++++++++ //
    
    //MARK: - - - - - Method for receiving Data through Post Notificaiton - - - - -
    @objc func methodOfReceivedNotification(notification: Notification) {
        print("Value of notification : ", notification.object ?? "")
    }
    
    //MARK:  - - - -  Method for receiving Data through Delegate  - - - - - -
    
    func addItemViewController(_ controller: ViewControllerB?, didFinishEnteringItem item: String?) {
        print("Value from ViewControllerB's Delegate", item!)
    }
    
    @IBAction func goToViewControllerForDelegate(_ sender: Any) {
        
        if let viewControllerB = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ViewControllerB") as? ViewControllerB {
            viewControllerB.delegate = self
            if let navigator = navigationController {
                navigator.pushViewController(viewControllerB, animated: true)
            }
        }
    }
    
    //MARK:  - - - -  Method for receiving Data through Block  - - - - - -
    //uncomment this method when you want to test block and comment below duplicate method for segue test
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if (segue.identifier == "showDetailSegue") {
//            let controller = segue.destination as? ViewControllerB
//            controller?.isSomethingEnabled = true
//
//            //Receiver Block
//            controller!.authorizationCompletionBlock = { isGranted in
//                print("Data received from Block is :", isGranted)
//            }
//        }
//    }
    
    
    
    // +++++++++++++++ Passing Data +++++++++++ //
    
    
    //MARK: - - - - - Method for Passing Data through Navigation PushViewController - - - - -
    
    @IBAction func goToViewControllerB(_ sender: Any) {
        
        if let viewControllerB = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ViewControllerB") as? ViewControllerB {
            viewControllerB.isSomethingEnabled = true
            if let navigator = navigationController {
                navigator.pushViewController(viewControllerB, animated: true)
            }
        }
    }
    
    //MARK:  - - - -  Method for Passing Data through Segue  - - - - - -
    
    @IBAction func goToViewControllerBUsingSegue(_ sender: Any) {
        performSegue(withIdentifier: "showDetailSegue", sender: nil)
    }
    
    //Segue Delegate Method
    //Comment this method when you will test block in above method
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "showDetailSegue") {
            let controller = segue.destination as? ViewControllerB
            controller?.isSomethingEnabled = true
        }
    }
    
}
