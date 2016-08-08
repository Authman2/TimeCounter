//
//  Counters.swift
//  TimeCounter
//
//  Created by Adeola Uthman on 7/20/15.
//  Copyright (c) 2014-2015 Adeola Uthman. All rights reserved.
//
// The MIT License (MIT)
//
// Copyright (c) 2015 Adeola Uthman
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in all
// copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.
//

import Foundation
import UIKit


public class TCCountUp : NSObject {
    
    private var countUp = NSTimer()
    public var minutes: Int = 0
    public var seconds : Int = 0
    private var totalSeconds: Int = 0
    private var startStopWatch: Bool = true
    
    public var timeLabel: UILabel! = UILabel()
    private var stopwatchString: String = ""
    
    
    public func startCountingUp() {
        
        if startStopWatch == true {
            countUp = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: #selector(TCCountUp.actuallyCountUp), userInfo: nil, repeats: true)
            
            startStopWatch = false
        }
    }
    
    func actuallyCountUp(){
        if countUp.valid == true {
            seconds += 1
            totalSeconds += 1
            
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
        totalSeconds = 0
        
        timeLabel.text = "Time: \(minutes):\(seconds)"
    }
    
    public func getTotalSeconds() -> Int {
        return totalSeconds
    }
}

public class TCCountDown : NSObject {
    
    private var countDown = NSTimer()
    public var minutes = Int()
    public var seconds = Int()
    private var totalSeconds = Int()
    private var startStopWatch: Bool = true
    
    public var timeLabel: UILabel! = UILabel()
    private var stopwatchString: String = ""
    
    
    public func startCountingDown() {
        
        if startStopWatch == true {
            countDown = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: #selector(TCCountDown.actuallyCountDown), userInfo: nil, repeats: true)
            
            startStopWatch = false
        }
    }
    
    func actuallyCountDown(){
        if countDown.valid == true {
            seconds -= 1
            totalSeconds -= 1
            
            if seconds < 0 {
                minutes -= 1
                seconds = 59
            }
            
            if minutes == 0 && seconds <= 0 {
                minutes = 0
                seconds = 0
                totalSeconds = 0
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
        self.totalSeconds = seconds
    }
    
    /**  */
    public func getTotalSeconds() -> Int {
        return totalSeconds
    }
    public func setTotalSeconds(ttlSeconds: Int) {
        self.totalSeconds = ttlSeconds
    }
}