# TimeCounter
A simple timer that can be used in IOS and OSX applications. Once you drag the "Counters" file into your project, you can create new objects of TCCountUp and TCCountDown, for doing their respective actions.

- To actually display the timer on screen, create a UILabel either in the storyboard or in code. Then set the Counter object's timeLabel to the label that you just created.
- minutes & seconds: The starting time for the timer. These are public instance variables, so you can easily set these to whatever time you want the timer to start from.
- startCountingUp: Tells the timer to start counting up from 00:00, or "minutes" and "seconds" if they were specified.
- startCountingDown: Tells the timer to count backwards from the time specified by the "minutes" and "seconds" variables.
- stopCountingUp: A "pause" feature for the timer. It will stop the timer from counting up and keep it at its current time.
- stopCountingDown:  A "pause" feature for the timer. It will stop the timer from counting down and keep it at its current time.
- reset: Resets the timer to 00:00 if counting up and to whatever the minutes and seconds are that were specified if counting down.
- getTotalSeconds: Returns the seconds that have been counting in the background (hence the name BackSeconds). This is the total number of seconds that have passed since the timer started.
- setTotalSeconds: Sets the total number of seconds to count from. Only used when counting down.

- Year: 2015
- Language: Swift
- Programmer: Adeola Uthman
