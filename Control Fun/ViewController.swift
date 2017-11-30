//
//  ViewController.swift
//  Control Fun
//
//  Created by Victor Smirnov on 29/11/2017.
//  Copyright © 2017 Victor Smirnov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  @IBOutlet weak var nameField: UITextField!
  @IBOutlet weak var numberField: UITextField!
  @IBOutlet weak var sliderLabel: UILabel!
  @IBOutlet weak var leftSwitch: UISwitch!
  @IBOutlet weak var rightSwitch: UISwitch!
  @IBOutlet weak var doSomethingButton: UIButton!
  
  @IBAction func textFieldDoneEditing(sender: UITextField) {
    sender.resignFirstResponder()
  }
  @IBAction func onTapGestutraRecognized(_ sender: UITapGestureRecognizer) {
    nameField.resignFirstResponder()
    numberField.resignFirstResponder()
  }
  @IBAction func onSliderChanged(_ sender: UISlider) {
    sliderLabel.text = "\(Int(sender.value))"
  }
  @IBAction func onSwitchChanged(_ sender: UISwitch) {
    let setting = sender.isOn
    leftSwitch.setOn(setting, animated: true)
    rightSwitch.setOn(setting, animated: true)
  }
  @IBAction func toggleControls(_ sender: UISegmentedControl) {
    if sender.selectedSegmentIndex == 0 {
      leftSwitch.isHidden = false
      rightSwitch.isHidden = false
      doSomethingButton.isHidden = true
    } else {
      leftSwitch.isHidden = true
      rightSwitch.isHidden = true
      doSomethingButton.isHidden = false
    }
  }
  @IBAction func onButtonPressed(_ sender: UIButton) {
    let controller = UIAlertController(title: "A you sure?", message: nil, preferredStyle: .actionSheet)
    let yesAction = UIAlertAction(title: "Yes i'm sure!", style: .destructive, handler: { action in
                    let msg = self.nameField.text!.isEmpty
                    ? "You can breathe easy, everything went Ok."
                    : "You can breathe easy, \(self.nameField.text!), everything went Ok."
                    let controller2 = UIAlertController(title: "Something Was Done", message: msg, preferredStyle: .alert)
                    let cancelAction = UIAlertAction(title: "Phew!", style: .cancel, handler: nil)
                    controller2.addAction(cancelAction)
                    self.present(controller2, animated: true, completion: nil)
    })
      let noAction = UIAlertAction(title: "No way!", style: .cancel, handler: nil)
      controller.addAction(yesAction)
      controller.addAction(noAction)
      
      if let ppc = controller.popoverPresentationController {
        ppc.sourceView = sender
        ppc.sourceRect = sender.bounds
    }
    present(controller, animated: true, completion: nil)
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }

}

