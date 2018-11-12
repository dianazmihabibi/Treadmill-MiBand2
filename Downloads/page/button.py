from tkinter import Tk, Button

def goodbye_world():
    print ("Goodbye World!\nWait, I changed my mind!")
    button.configure(text = "Hello World!", command=hello_world)

def hello_world():
    print ("Hello World!\nWait, I changed my mind!")
    button.configure(text = "Goodbye World!", command=goodbye_world)

root = Tk()
button = Button(root, text="Hello World!", command=hello_world)
button.pack()

root.mainloop()