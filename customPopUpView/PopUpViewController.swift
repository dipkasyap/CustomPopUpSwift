//
//  PopUpViewController.swift
//  customPopUpView
//
//  Created by Dip on 5/29/15.
//  Copyright (c) 2015 Dip Kasyap . All rights reserved.
// DIP: COPYLEFT : Feel Free to Customize & Improve :)


import UIKit



class PopUpViewController: UIViewController,popUpviewDelegate {
    @IBOutlet weak var aview: PopUpView!
    
    //propety to check caleer for popUP
    var caller:Int?

 
    
    override func viewDidLoad() {
        super.viewDidLoad()
       //initially view is hidden
        aview.hidden = true
        
        aview.delegate = self
        aview.layer.cornerRadius = 5
        aview.layer.shadowOpacity = 0.8
        aview.layer.shadowOffset = CGSizeMake(0.0, 0.0)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
 
    func showInView(aView: UIView!, animated: Bool)
    {
        aView.addSubview(self.view)
        if animated
        {
            self.showAnimation()
        }
    }
    
    func showAnimation()
    {
        aview.view.transform = CGAffineTransformMakeScale(0.9, 0.9)
        aview.view.alpha = 0.0;
        UIView.animateWithDuration(0.25, animations: {
            self.aview.view.alpha = 1.0
            self.aview.view.transform = CGAffineTransformMakeScale(1, 1.0)
        });
    }
    
    func removeAimation()
    {
        UIView.animateWithDuration(0.25, animations: {
            self.aview.view.transform = CGAffineTransformMakeScale(0.5, 0.5)
            self.aview.view.alpha = 0.0;
            }, completion:{(finished : Bool)  in
                if (finished)
                {
                    self.aview.hidden = true
                    //self.dismissViewControllerAnimated(false, completion: {})
                    
 
                }
        });
     }

    func dismissController() {
        
        removeAimation()
    }
    @IBAction func showPopUp(sender: AnyObject) {
        aview.xibSetup()
        aview.hidden = false
    }
}
