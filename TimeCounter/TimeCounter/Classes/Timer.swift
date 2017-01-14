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


public enum countDirection {
    case up;
    case down;
}


public class TimeCounter: NSObject {
    
    /**********************
    *
    *
    *       VARIABLES
    *
    *
    ***********************/
    
    private var countTimer = Timer();
    private var totalSeconds = 0;
    private var startStop = true;
    private var cDirection: countDirection!;
    private var labelString = String();
    private var lastTime: (Int, Int)?;
    
    public var minutes = 0;
    public var seconds = 0;
    public var timeLabel = UILabel();
    
    
    
    /**********************
     *
     *
     *       METHODS
     *
     *
     ***********************/
    
    /**
     Creates a new TimeCounter object which can be used to count up or down.
     direction: Whether or not the time counter should count up or down.
    */
    public init(direction: countDirection) {
        self.cDirection = direction;
    }
    
    
    
    /**
     Starts the timer in the direction it was initialized with.
     */
    public func startTimeCounter() {
        // If it is ok to start the timer...
        if startStop == true {
            
            // If the timer is supposed to count up. Otherwise count down.
            if cDirection == .up {
                countTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(actuallyCountUp), userInfo: nil, repeats: true);
            } else {
                countTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(actuallyCountDown), userInfo: nil, repeats: true)
                lastTime = (minutes, seconds);
            }
            
            startStop = false;
        }
    }
    
    
    /**
     Pauses the time counter.
     */
    public func stopTimeCounter() {
        if startStop == false {
            countTimer.invalidate();
            startStop = true;
        }
    }
    
    
    /**
     Resets the time counter. If it was counting up, it will be reset to 0. If it was counting down, it will be reset to the last value of minutes and seconds that were set.
     */
    public func reset() {
        if cDirection == .up {
            startStop = true;
            countTimer.invalidate();
            minutes = 0;
            seconds = 0;
            totalSeconds = 0;
            
            timeLabel.text = "Time: \(minutes):\(seconds)";
        } else {
            startStop = true;
            countTimer.invalidate();
            
            if let min = lastTime?.0 {
                if let sec = lastTime?.1 {
                    timeLabel.text = "Time: \(min):\(sec)";
                }
            }
        }
    }
    
    
    /**
        - Return the total number of seconds that have passed since the timer started.
     */
    public func getTotalSeconds() -> Int {
        return totalSeconds;
    }
    
    
    @objc private func actuallyCountUp() {
        if countTimer.isValid == true {
            seconds += 1;
            totalSeconds += 1;
            
            if seconds == 60 {
                minutes += 1;
                seconds = 0;
            }
            
            if minutes == 0 && seconds == 0 {
                labelString = "00:00";
            }
            if seconds > 9 && minutes >= 9  {
                labelString = "Time: \(minutes):\(seconds)";
            }
            if seconds <= 9 && minutes <= 9 {
                labelString = "Time: 0\(minutes):0\(seconds)";
            }
            if seconds <= 9 && minutes >= 9 {
                labelString = "Time: \(minutes):0\(seconds)";
            }
            if seconds > 9 && minutes <= 9 {
                labelString = "Time: 0\(minutes):\(seconds)";
            }
            
            timeLabel.text = labelString;
        }
    }
    
    
    @objc private func actuallyCountDown() {
        if countTimer.isValid == true {
            seconds -= 1;
            totalSeconds += 1;
            
            if seconds < 0 {
                minutes -= 1;
                seconds = 59;
            }
            
            if minutes == 0 && seconds <= 0 {
                minutes = 0;
                seconds = 0;
                totalSeconds = 0;
                self.stopTimeCounter();
            }
            
            if minutes > 9 && seconds > 9  {
                labelString = "Time: \(minutes):\(seconds)";
            }
            if minutes <= 9 && seconds <= 9 {
                labelString = "Time: 0\(minutes):0\(seconds)";
            }
            if minutes <= 9 && seconds > 9 {
                labelString = "Time: 0\(minutes):\(seconds)";
            }
            if minutes > 9 && seconds <= 9 {
                labelString = "Time: \(minutes):0\(seconds)";
            }
            
            timeLabel.text = labelString;
        }
    }
    
    
}
