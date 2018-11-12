import Tkinter as tk

# Note: Python 2.6 or higher is required for .format() to work
def update_timeText():
    if (state):
        global timer
        # Every time this function is called, 
        # we will increment 1 centisecond (1/100 of a second)
        timer[2] += 1
        
        # Every 100 centisecond is equal to 1 second
        if (timer[2] >= 100):
            timer[2] = 0
            timer[1] += 1
        # Every 60 seconds is equal to 1 min
        if (timer[1] >= 60):
            timer[0] += 1
            timer[1] = 0
        # We create our time string here
        timeString = pattern.format(timer[0], timer[1], timer[2])
        # Update the timeText Label box with the current time
        timeText.configure(text=timeString)
        # Call the update_timeText() function after 1 centisecond
    root.after(10, update_timeText)

# To start the kitchen timer
def start():
    global state
    state = True

# To pause the kitchen timer
def pause():
    global state
    state = False

# To reset the timer to 00:00:00
def reset():
    global timer
    timer = [0, 0, 0]
    timeText.configure(text='00:00:00')

# To exist our program
def exist():
    root.destroy()

# Simple status flag
# False mean the timer is not running
# True means the timer is running (counting)
state = False

root = tk.Tk()
root.wm_title('Simple Kitchen Timer Example')

# Our time structure [min, sec, centsec]
timer = [0, 0, 0]
# The format is padding all the 
pattern = '{0:02d}:{1:02d}:{2:02d}'

# Create a timeText Label (a text box)
timeText = tk.Label(root, text="00:00:00", font=("Helvetica", 150))
timeText.pack()

startButton = tk.Button(root, text='Start', command=start)
startButton.pack()

pauseButton = tk.Button(root, text='Pause', command=pause)
pauseButton.pack()

resetButton = tk.Button(root, text='Reset', command=reset)
resetButton.pack()

quitButton = tk.Button(root, text='Quit', command=exist)
quitButton.pack()

update_timeText()
root.mainloop()