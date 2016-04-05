# TimeCounter
An IOS framework that can be used for adding a simple timer into IOS projects. Download the framework folder and import it into your project.

- Year: 2015
- Language: Swift
- Programmer: Adeola Uthman


# How To
1. First, make sure that there is a UILabel in your project to display the time. For example, you can create them in the storyboard like I have below.
![Alt text](https://github.com/Authman2/TimeCounter/blob/master/TutorialImages/CreateLabelsInStoryboard.png)
2. Next, create a TimeCounter object for whichever kind of timer you want to use.
![Alt text](https://github.com/Authman2/TimeCounter/blob/master/TutorialImages/CreatingTimerObjects.png)
3. Then, make sure that there is a reference to the UILabels you created earlier to display the timer.
![Alt text](https://github.com/Authman2/TimeCounter/blob/master/TutorialImages/CreatingLabelsToDisplayTime.png)
4. Once you have that, you must tell the TimeCounter object which UILabel it should use to display the timer.
![Alt text](https://github.com/Authman2/TimeCounter/blob/master/TutorialImages/SpecifyTimeLabel.png)
5. Now you are ready to use your timer! All you have to do is right these few lines of code for each timer.
![Alt text](https://github.com/Authman2/TimeCounter/blob/master/TutorialImages/CountingUp.png)
![Alt text](https://github.com/Authman2/TimeCounter/blob/master/TutorialImages/CountingDown.png)

# Methods
- To actually display the timer on screen, create a UILabel either in the storyboard or in code. Then set the Counter object's timeLabel to the label that you just created.
- **minutes & seconds**: The starting time for the timer. These are public instance variables, so you can easily set these to whatever time you want the timer to start from.
- **startCountingUp**: Tells the timer to start counting up from 00:00, or "minutes" and "seconds" if they were specified.
- **startCountingDown**: Tells the timer to count backwards from the time specified by the "minutes" and "seconds" variables.
- **stopCountingUp**: A "pause" feature for the timer. It will stop the timer from counting up and keep it at its current time.
- **stopCountingDown**:  A "pause" feature for the timer. It will stop the timer from counting down and keep it at its current time.
- **reset**: Resets the timer to 00:00 if counting up and to whatever the minutes and seconds are that were specified if counting down.
- **getTotalSeconds**: Returns the seconds that have been counting in the background (hence the name BackSeconds). This is the total number of seconds that have passed since the timer started.
- **setTotalSeconds**: Sets the total number of seconds to count from. Only used when counting down.
