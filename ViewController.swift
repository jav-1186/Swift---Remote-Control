//
//  ViewController.swift
//  jveit-remoteTV
//
//  Created by Jeffrey Veit on 1/26/21.
//  CSC 471 HW #4
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tvImage: UIImageView!
    
    @IBOutlet weak var mainRemoteLabel: UILabel!
    @IBOutlet weak var mainPowerLabel: UILabel!
    @IBOutlet weak var mainSpeakerLabel: UILabel!
    @IBOutlet weak var mainChannelLabel: UILabel!
    @IBOutlet weak var controlsLabel: UILabel!
    @IBOutlet weak var controlPower: UILabel!
    @IBOutlet weak var controlVolume: UILabel!
    @IBOutlet weak var controlFavorites: UILabel!
    @IBOutlet weak var controlChannels: UILabel!
    
    @IBOutlet weak var powerSwitch: UISwitch!
    @IBOutlet weak var volumeSlider: UISlider!
    @IBOutlet weak var favoritesSegmented: UISegmentedControl!
    
    
    @IBOutlet weak var buttonZero: UIButton!
    @IBOutlet weak var buttonOne: UIButton!
    @IBOutlet weak var buttonTwo: UIButton!
    @IBOutlet weak var buttonThree: UIButton!
    @IBOutlet weak var channelDownButton: UIButton!
    @IBOutlet weak var buttonFour: UIButton!
    @IBOutlet weak var buttonFive: UIButton!
    @IBOutlet weak var buttonSix: UIButton!
    @IBOutlet weak var channelUpButton: UIButton!
    @IBOutlet weak var buttonSeven: UIButton!
    @IBOutlet weak var buttonEight: UIButton!
    @IBOutlet weak var buttonNine: UIButton!
    
    var channelSelected: [String] = []
    
    // Added default values to the labels at launch time
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        mainPowerLabel.text = "Power: ON"
        mainSpeakerLabel.text = "Volume: \(Int(10))"
        mainChannelLabel.text = "Channel: \(Int(58))"
    }

    // Controls power switch and enables or disables controls based on setting
    @IBAction func powerSwitch(_ sender: UISwitch)
    {
        mainPowerLabel.text = "Power: " + (sender.isOn ? "ON" : "OFF")
        
        if sender.isOn == true
        {
            volumeSlider.isUserInteractionEnabled = true
            favoritesSegmented.isUserInteractionEnabled = true
            buttonOne.isUserInteractionEnabled = true
            buttonTwo.isUserInteractionEnabled = true
            buttonThree.isUserInteractionEnabled = true
            buttonFour.isUserInteractionEnabled = true
            buttonFive.isUserInteractionEnabled = true
            buttonSix.isUserInteractionEnabled = true
            buttonSeven.isUserInteractionEnabled = true
            buttonEight.isUserInteractionEnabled = true
            buttonNine.isUserInteractionEnabled = true
            channelUpButton.isUserInteractionEnabled = true
            channelDownButton.isUserInteractionEnabled = true
        }
        
        if sender.isOn == false
        {
            volumeSlider.isUserInteractionEnabled = false
            favoritesSegmented.isUserInteractionEnabled = false
            buttonOne.isUserInteractionEnabled = false
            buttonTwo.isUserInteractionEnabled = false
            buttonThree.isUserInteractionEnabled = false
            buttonFour.isUserInteractionEnabled = false
            buttonFive.isUserInteractionEnabled = false
            buttonSix.isUserInteractionEnabled = false
            buttonSeven.isUserInteractionEnabled = false
            buttonEight.isUserInteractionEnabled = false
            buttonNine.isUserInteractionEnabled = false
            channelUpButton.isUserInteractionEnabled = false
            channelDownButton.isUserInteractionEnabled = false
        }
    }
    
    // Volume slider
    @IBAction func volumeChanged(_ sender: UISlider)
    {
        mainSpeakerLabel.text = "Volume: \(Int(sender.value))"
    }
    
    // TV favorites in segmented control
    @IBAction func favoritesSegmented(_ sender: UISegmentedControl)
    {
        let index = favoritesSegmented.selectedSegmentIndex
        if index == 0
        {
            mainChannelLabel.text = "Channel: 58"
        }
        
        else if index == 1
        {
            mainChannelLabel.text = "Channel: 40"
        }
        
        else if index == 2
        {
            mainChannelLabel.text = "Channel: 5"
        }
        
        else if index == 3
        {
            mainChannelLabel.text = "Channel: 4"
        }
    }
    
    // Handles the individual buttons. I had to add special hooks for those under 9 because of the prefix '0'. After a channel is selected it clears the array
    @IBAction func buttonPush(_ sender: UIButton)
    {
        let selection: String = sender.currentTitle!
        
        if channelSelected.count == 0 || channelSelected.count == 1
        {
            channelSelected.append(selection)
        }
        
        if channelSelected.count == 2
        {
            let current: String = channelSelected[0] + channelSelected[1]
            
            // Per instructions, 00 is not inclusive in the range
            if current == "00"
            {
                channelSelected.removeAll()
            }
            
            else
            {
                mainChannelLabel.text = "Channel: " + current
                channelSelected.removeAll()
            }
        }
    }
    
    // Controls the channel decrement. A substring is used to grab the last two characters which is the actual volume setting.
    @IBAction func channelDown(_ sender: UIButton)
    {
            let current = mainChannelLabel.text!
            let substring = current.suffix(2)
            let current2 = Int(substring)
        
            if current2 == 1
            {}
        
            else
            {
                let currentChg: Int =  current2! - 1
               
                if currentChg < 10
                {
                    let currentChgS = "0" + String(currentChg)
                    mainChannelLabel.text = "Channel: " + currentChgS
                }
                
                else
                {
                    let currentChgS = String(currentChg)
                    mainChannelLabel.text = "Channel: " + currentChgS
                }
                
            }
    }
    
    // Controls the channel increment. A substring is used to grab the last two characters which is the actual volume setting.
    @IBAction func channelUp(_ sender: UIButton)
    {
        let current = mainChannelLabel.text!
        let substring = current.suffix(2)
        let current2 = Int(substring)
    
        if current2 == 99
        {}
    
        else
        {
            let currentChg: Int =  current2! + 1
            
            if currentChg < 10
            {
                let currentChgS = "0" + String(currentChg)
                mainChannelLabel.text = "Channel: " + currentChgS
            }
            
            else
            {
                let currentChgS = String(currentChg)
                mainChannelLabel.text = "Channel: " + currentChgS
            }
        }
    }
}

