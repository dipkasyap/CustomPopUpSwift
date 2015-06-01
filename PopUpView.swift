//
//  PopUpView.swift
//  customPopUpView
//
//  Created by Dip on 5/29/15.
//  Copyright (c) 2015 Dip Kasyap . All rights reserved.
// DIP: COPYLEFT : Feel Free to Customize & Improve :)


import UIKit
//delegate protocol
protocol popUpviewDelegate {
    func dismissController()
}

class PopUpView: UIView,UIPickerViewDelegate {
    
    //caller id 
    var caller: Int?
    
    var view: UIView!
    var delegate: popUpviewDelegate?
    @IBOutlet weak var viewD: UIView!
    @IBOutlet var orLoginWith: UILabel!
    @IBOutlet weak var btnCancel: UIButton!
    @IBOutlet weak var btnOk: UIButton!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var dateBtnTitle: UIButton!
    @IBOutlet weak var timeBtnTitle: UIButton!
    
    
    
    override init(frame: CGRect) {
         super.init(frame: frame)
       // xibSetup()
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

        //customisation of datePicker
//        let currentDate = NSDate()  //5 -  get the current date
//        datePicker.minimumDate = currentDate  //6- set the current date/time as a minimum
        //myDatePicker.date = currentDate //7 - defaults to current time
        
        //button customzation
        btnCancel.layer.masksToBounds = true
        btnCancel.layer.borderColor = UIColor.greenColor().CGColor
        btnCancel.layer.borderWidth = 1
        
        
        //button customzation
        btnOk.layer.masksToBounds = true
        btnOk.layer.borderColor = UIColor.greenColor().CGColor
        btnOk.layer.borderWidth = 1
        //initially hiding Picker
        viewD.hidden = true
        

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
   
    
    @IBAction func btnPickDate(sender: AnyObject) {
        if sender.tag == 101 {
        datePicker.datePickerMode = UIDatePickerMode.Date
            viewD.hidden = false }
        else {
            datePicker.datePickerMode = UIDatePickerMode.Time
            viewD.hidden = false
        }
     }
 
    
    
    @IBAction func picker(sender: AnyObject) {
        
        var date = datePicker.date
        println("\(date)")
        
        var timeFormater = NSDateFormatter()
        timeFormater.dateFormat = "HH:mm"
        timeBtnTitle.setTitle(timeFormater.stringFromDate(date), forState: UIControlState.Normal)
        
        var dateFormater = NSDateFormatter()
        dateFormater.dateFormat = "MM-dd-yyyy"

        dateBtnTitle.setTitle(dateFormater.stringFromDate(date), forState: UIControlState.Normal)
        
 

    }
    @IBAction func btnOkDate(sender: AnyObject) {
        viewD.hidden = true

        
    }
}
