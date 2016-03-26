//
//  Counters.swift
//  TimeCounter
//
//  Created by Adeola Uthman on 7/20/15.
//  Copyright (c) 2015 Adeola Uthman. All rights reserved.
//

import Foundation
import UIKit


public class TCCountUp : NSObject {
    
    private var countUp = NSTimer()
    public var minutes: Int = 0
    public var seconds : Int = 0
    private var backSeconds: Int = 0
    private var startStopWatch: Bool = true
    
    public var timeLabel: UILabel! = UILabel()
    private var stopwatchString: String = ""
    
    
    public func startCountingUp() {

        if startStopWatch == true {
            countUp = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: Selector("actuallyCountUp"), userInfo: nil, repeats: true)
            
            startStopWatch = false
        }
    }
    
    func actuallyCountUp(){
        if countUp.valid == true {
            seconds++
            backSeconds++
            
            if seconds == 60 {
                minutes += 1
                seconds = 0
            }
            
            if minutes == 0 && seconds == 0 {
                stopwatchString = "00:00"
            }
            if seconds > 9 && minutes >= 9  {
                stopwatchString = "Time: \(minutes):\(seconds)"
            }
            if seconds <= 9 && minutes <= 9 {
                stopwatchString = "Time: 0\(minutes):0\(seconds)"
            }
            if seconds <= 9 && minutes >= 9 {
                stopwatchString = "Time: \(minutes):0\(seconds)"
            }
            if seconds > 9 && minutes <= 9 {
                stopwatchString = "Time: 0\(minutes):\(seconds)"
            }
                
            timeLabel.text = stopwatchString
        }
    }
    
    public func stopCountingUp(){
        if startStopWatch == false {
            countUp.invalidate()
            startStopWatch = true
        }
    }
    
    public func reset () {
        startStopWatch = true
        countUp.invalidate()
        minutes = 0
        seconds = 0
        backSeconds = 0
        
        timeLabel.text = "Time: \(minutes):\(seconds)"
    }
    
    public func getBackSeconds() -> Int {
        return backSeconds
    }
}

public class TCCountDown : NSObject {
    
    private var countDown = NSTimer()
    public var minutes = Int()
    public var seconds = Int()
    private var backSeconds = Int()
    private var startStopWatch: Bool = true
    
    public var timeLabel: UILabel! = UILabel()
    private var stopwatchString: String = ""
    
    
    public func startCountingDown() {
        
        if startStopWatch == true {
            countDown = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: Selector("actuallyCountDown"), userInfo: nil, repeats: true)
            
            startStopWatch = false
        }
    }
    
    func actuallyCountDown(){
        if countDown.valid == true {
            seconds -= 1
            backSeconds -= 1
            
            if seconds < 0 {
                minutes -= 1
                seconds = 59
            }
            
            if minutes == 0 && seconds <= 0 {
                minutes = 0
                seconds = 0
                backSeconds = 0
                self.stopCountingDown()
            }
            
            if minutes > 9 && seconds > 9  {
                stopwatchString = "Time: \(minutes):\(seconds)"
            }
            if minutes <= 9 && seconds <= 9 {
                stopwatchString = "Time: 0\(minutes):0\(seconds)"
            }
            if minutes <= 9 && seconds > 9 {
                stopwatchString = "Time: 0\(minutes):\(seconds)"
            }
            if minutes > 9 && seconds <= 9 {
                stopwatchString = "Time: \(minutes):0\(seconds)"
            }
            
            timeLabel.text = stopwatchString
        }
    }
    
    public func stopCountingDown(){
        if startStopWatch == false {
            countDown.invalidate()
            startStopWatch = true
        }
    }
    
    public func reset() {
        startStopWatch = true
        countDown.invalidate()
        
        timeLabel.text = "Time: \(minutes):\(seconds)"
    }
    public func resetTotalSeconds(seconds: Int) {
        self.backSeconds = seconds
    }
    
    
    //Getters and Setters
    public func getBackSeconds() -> Int {
        return backSeconds
    }
    public func setBackSeconds(backSeconds: Int) {
        self.backSeconds = backSeconds
    }
}