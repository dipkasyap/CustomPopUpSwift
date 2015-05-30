//
//  ViewController.swift
//  customPopUpView
//
//  Created by Dip on 5/29/15.
//  Copyright (c) 2015 Dip Kasyap . All rights reserved.
// DIP: COPYLEFT : Feel Free to Customize & Improve :)


import UIKit



class ViewController: UIViewController {

    @IBOutlet weak var btnPopUp: UIButton!
    var vc: PopUpViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.setRoundedBorder(5, withBorderWidth: 1, withColor: UIColor.greenColor(), forButton: btnPopUp)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func showPopUpView(sender: AnyObject) {

      // call 1
      
        var storyboard: UIStoryboard = UIStoryboard (name: "Main", bundle: nil)
      
        if(sender.tag==301){
            let nextView = storyboard.instantiateViewControllerWithIdentifier("PopUpViewControllerView") as!PopUpViewController
            nextView.modalPresentationStyle = UIModalPresentationStyle.OverCurrentContext
            nextView.providesPresentationContextTransitionStyle = true
            nextView.definesPresentationContext = true
            self.presentViewController(nextView, animated: false, completion: nil)
            nextView.showInView(self.view, animated: true)
            nextView.caller = 1 //for first type popUp
        } else {
            
//            self.vc = PopUpViewController(nibName: "SecondPopUp", bundle: nil)
//
//            
//            
//            vc.modalPresentationStyle = UIModalPresentationStyle.OverCurrentContext
//            vc.providesPresentationContextTransitionStyle = true
//            vc.definesPresentationContext = true
//            self.presentViewController(vc, animated: false, completion: nil)
//            vc.showInView(self.view, animated: true)
//
         }
        
       

        
    }
    
    func setRoundedBorder(radius : CGFloat, withBorderWidth borderWidth: CGFloat, withColor color : UIColor, forButton button : UIButton)
    {
        let l : CALayer = button.layer
        l.masksToBounds = true
        l.cornerRadius = radius
        l.borderWidth = borderWidth
        l.borderColor = color.CGColor
    }

    
    
}

