//
//  SecondPopUp.swift
//  customPopUpView
//
//  Created by apple on 5/29/15.
//  Copyright (c) 2015 apple. All rights reserved.
//

import UIKit



    //delegate protocol
    protocol popUpviewDelegate1 {
        func dismissController()
    }
    
    class SecondPopUp: UIView {
        //caller id
        var caller: Int?
        
        var view: UIView!
        var delegate: popUpviewDelegate1?
        @IBOutlet var orLoginWith: UILabel!
        
        override init(frame: CGRect) {
            super.init(frame: frame)
            xibSetup()
        }
        
        
        
        required init(coder aDecoder: NSCoder) {
            super.init(coder: aDecoder)
            xibSetup()
        }
        
        
        //Method to load xib xib
        func xibSetup() {
            view = loadViewFromNib()
            
            // use bounds not frame or it'll be offset
            view.frame = bounds
            
            // Make the view stretch with containing view
            view.autoresizingMask = UIViewAutoresizing.FlexibleWidth | UIViewAutoresizing.FlexibleHeight
            
            // Adding custom subview on top of our view (over any custom drawing > see note below)
            view.layer.cornerRadius = 5
            view.layer.shadowOpacity = 0.8
            view.layer.shadowOffset = CGSizeMake(0.0, 0.0)
            
            addSubview(view)
        }
        
        
        func loadViewFromNib() -> UIView {
            
            let bundle = NSBundle(forClass: self.dynamicType)
            
            if self.caller == 1 {
                // here caller is
            }
            let nib = UINib(nibName: "popUp", bundle: bundle)
            let view = nib.instantiateWithOwner(self, options: nil)[0] as! UIView
            return view
        }
        
        
        @IBAction func btnOK(sender: AnyObject) {
            //calling deletage method
            if let temp = self.delegate {
                delegate?.dismissController()
            }else{
                println("optional value contains nill value")
            }
        }
        
}
