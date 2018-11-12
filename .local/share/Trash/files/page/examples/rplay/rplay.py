#! /usr/bin/env python
#
# GUI module generated by PAGE version 4.8.8.1
# In conjunction with Tcl version 8.6
#    Feb 05, 2017 09:53:45 AM
import sys

try:
    from Tkinter import *
except ImportError:
    from tkinter import *

try:
    import ttk
    py3 = 0
except ImportError:
    import tkinter.ttk as ttk
    py3 = 1

import rplay_support

def vp_start_gui():
    '''Starting point when module is the main routine.'''
    global val, w, root
    root = Tk()
    rplay_support.set_Tk_var()
    top = Now_Playing (root)
    rplay_support.init(root, top)
    root.mainloop()

w = None
def create_Now_Playing(root, *args, **kwargs):
    '''Starting point when module is imported by another program.'''
    global w, w_win, rt
    rt = root
    w = Toplevel (root)
    rplay_support.set_Tk_var()
    top = Now_Playing (w)
    rplay_support.init(w, top, *args, **kwargs)
    return (w, top)

def destroy_Now_Playing():
    global w
    w.destroy()
    w = None


class Now_Playing:
    def __init__(self, top=None):
        '''This class configures and populates the toplevel window.
           top is the toplevel containing window.'''
        _bgcolor = 'wheat'  # X11 color: #f5deb3
        _fgcolor = '#000000'  # X11 color: 'black'
        _compcolor = '#b2c9f4' # Closest X11 color: 'SlateGray2'
        _ana1color = '#eaf4b2' # Closest X11 color: '{pale goldenrod}'
        _ana2color = '#f4bcb2' # Closest X11 color: 'RosyBrown2'
        font10 = "-family {DejaVu Sans} -size 14 -weight normal -slant"  \
            " roman -underline 0 -overstrike 0"
        self.style = ttk.Style()
        if sys.platform == "win32":
            self.style.theme_use('winnative')
        self.style.configure('.',background=_bgcolor)
        self.style.configure('.',foreground=_fgcolor)
        self.style.map('.',background=
            [('selected', _compcolor), ('active',_ana2color)])

        top.geometry("811x685+195+72")
        top.title("Now Playing")
        top.configure(background="wheat")
        top.configure(highlightbackground="wheat")
        top.configure(highlightcolor="black")
        top.bind('<Control-Key-q>',lambda e:rplay_support.c_quit(e))



        self.Scrolledtext1 = ScrolledText(top)
        self.Scrolledtext1.place(relx=0.01, rely=0.19, relheight=0.48
                , relwidth=0.97)
        self.Scrolledtext1.configure(background="white")
        self.Scrolledtext1.configure(font=font10)
        self.Scrolledtext1.configure(highlightbackground="wheat")
        self.Scrolledtext1.configure(insertborderwidth="3")
        self.Scrolledtext1.configure(selectbackground="#ddc8a1")
        self.Scrolledtext1.configure(width=10)
        self.Scrolledtext1.configure(wrap=NONE)
        self.Scrolledtext1.bind('<ButtonRelease-1>',lambda e:rplay_support.selection(e))

        self.TSizegrip1 = ttk.Sizegrip(top)
        self.TSizegrip1.place(anchor=SE, relx=1.0, rely=1.0)

        self.Button1 = Button(top)
        self.Button1.place(relx=0.42, rely=0.72, height=51, width=165)
        self.Button1.configure(activebackground="#f4bcb2")
        self.Button1.configure(background="wheat")
        self.Button1.configure(command=rplay_support.previous)
        self.Button1.configure(disabledforeground="#b8a786")
        self.Button1.configure(font=font10)
        self.Button1.configure(highlightbackground="wheat")
        self.Button1.configure(text='''Previous CD's''')

        self.Label4 = Label(top)
        self.Label4.place(relx=0.05, rely=0.04, height=27, width=49)
        self.Label4.configure(activebackground="#ffffcd")
        self.Label4.configure(background="wheat")
        self.Label4.configure(disabledforeground="#b8a786")
        self.Label4.configure(font=font10)
        self.Label4.configure(highlightbackground="wheat")
        self.Label4.configure(text='''Title:''')

        self.Label5 = Label(top)
        self.Label5.place(relx=0.05, rely=0.13, height=27, width=106)
        self.Label5.configure(activebackground="#ffffcd")
        self.Label5.configure(background="wheat")
        self.Label5.configure(disabledforeground="#b8a786")
        self.Label5.configure(font=font10)
        self.Label5.configure(highlightbackground="wheat")
        self.Label5.configure(text='''Start Time:''')

        self.Label10 = Label(top)
        self.Label10.place(relx=0.32, rely=0.13, height=27, width=483)
        self.Label10.configure(activebackground="#ffffcd")
        self.Label10.configure(anchor=W)
        self.Label10.configure(background="wheat")
        self.Label10.configure(disabledforeground="#b8a786")
        self.Label10.configure(font=font10)
        self.Label10.configure(highlightbackground="wheat")
        self.Label10.configure(justify=LEFT)
        self.Label10.configure(text='''Label''')
        self.Label10.configure(textvariable=rplay_support.start_time)

        self.Button2 = Button(top)
        self.Button2.place(relx=0.07, rely=0.82, height=51, width=165)
        self.Button2.configure(activebackground="#f4bcb2")
        self.Button2.configure(background="wheat")
        self.Button2.configure(command=rplay_support.new_album)
        self.Button2.configure(disabledforeground="#b8a786")
        self.Button2.configure(font=font10)
        self.Button2.configure(highlightbackground="wheat")
        self.Button2.configure(text='''New Album''')

        self.Button3 = Button(top)
        self.Button3.place(relx=0.74, rely=0.82, height=51, width=165)
        self.Button3.configure(activebackground="#f4bcb2")
        self.Button3.configure(background="wheat")
        self.Button3.configure(command=rplay_support.quit)
        self.Button3.configure(disabledforeground="#b8a786")
        self.Button3.configure(font=font10)
        self.Button3.configure(highlightbackground="wheat")
        self.Button3.configure(text='''Quit''')

        self.Button4 = Button(top)
        self.Button4.place(relx=0.07, rely=0.72, height=51, width=165)
        self.Button4.configure(activebackground="#f4bcb2")
        self.Button4.configure(background="wheat")
        self.Button4.configure(command=rplay_support.repeat_cd)
        self.Button4.configure(disabledforeground="#b8a786")
        self.Button4.configure(font=font10)
        self.Button4.configure(highlightbackground="wheat")
        self.Button4.configure(text='''Repeat CD''')

        self.Button5 = Button(top)
        self.Button5.place(relx=0.42, rely=0.82, height=51, width=165)
        self.Button5.configure(activebackground="#f4bcb2")
        self.Button5.configure(background="wheat")
        self.Button5.configure(command=rplay_support.cont)
        self.Button5.configure(disabledforeground="#b8a786")
        self.Button5.configure(font=font10)
        self.Button5.configure(highlightbackground="wheat")
        self.Button5.configure(text='''Continue''')

        self.Button6 = Button(top)
        self.Button6.place(relx=0.74, rely=0.72, height=51, width=165)
        self.Button6.configure(activebackground="#f4bcb2")
        self.Button6.configure(background="wheat")
        self.Button6.configure(command=rplay_support.stop)
        self.Button6.configure(disabledforeground="#b8a786")
        self.Button6.configure(font=font10)
        self.Button6.configure(highlightbackground="wheat")
        self.Button6.configure(text='''Stop''')

        self.Scrolledtext2 = ScrolledText(top)
        self.Scrolledtext2.place(relx=0.2, rely=0.01, relheight=0.08
                , relwidth=0.66)
        self.Scrolledtext2.configure(background="white")
        self.Scrolledtext2.configure(font=font10)
        self.Scrolledtext2.configure(highlightbackground="wheat")
        self.Scrolledtext2.configure(insertborderwidth="3")
        self.Scrolledtext2.configure(selectbackground="#ddc8a1")
        self.Scrolledtext2.configure(width=10)
        self.Scrolledtext2.configure(wrap=WORD)

        self.Button7 = Button(top)
        self.Button7.place(relx=0.21, rely=0.92, height=35, width=90)
        self.Button7.configure(activebackground="#f4bcb2")
        self.Button7.configure(background="wheat")
        self.Button7.configure(command=rplay_support.search)
        self.Button7.configure(disabledforeground="#b8a786")
        self.Button7.configure(font=font10)
        self.Button7.configure(highlightbackground="wheat")
        self.Button7.configure(text='''Search''')

        self.Entry1 = Entry(top)
        self.Entry1.place(relx=0.44, rely=0.92, relheight=0.04, relwidth=0.3)
        self.Entry1.configure(background="white")
        self.Entry1.configure(disabledforeground="#b8a786")
        self.Entry1.configure(font=font10)
        self.Entry1.configure(highlightbackground="#f5deb3")
        self.Entry1.configure(selectbackground="#ddc8a1")
        self.Entry1.configure(textvariable=rplay_support.criteria)
        self.Entry1.bind('<Key-Return>',lambda e:rplay_support.search())





# The following code is added to facilitate the Scrolled widgets you specified.
class AutoScroll(object):
    '''Configure the scrollbars for a widget.'''

    def __init__(self, master):
        #  Rozen. Added the try-except clauses so that this class
        #  could be used for scrolled entry widget for which vertical
        #  scrolling is not supported. 5/7/14.
        try:
            vsb = ttk.Scrollbar(master, orient='vertical', command=self.yview)
        except:
            pass
        hsb = ttk.Scrollbar(master, orient='horizontal', command=self.xview)

        #self.configure(yscrollcommand=_autoscroll(vsb),
        #    xscrollcommand=_autoscroll(hsb))
        try:
            self.configure(yscrollcommand=self._autoscroll(vsb))
        except:
            pass
        self.configure(xscrollcommand=self._autoscroll(hsb))

        self.grid(column=0, row=0, sticky='nsew')
        try:
            vsb.grid(column=1, row=0, sticky='ns')
        except:
            pass
        hsb.grid(column=0, row=1, sticky='ew')

        master.grid_columnconfigure(0, weight=1)
        master.grid_rowconfigure(0, weight=1)

        # Copy geometry methods of master  (taken from ScrolledText.py)
        if py3:
            methods = Pack.__dict__.keys() | Grid.__dict__.keys() \
                  | Place.__dict__.keys()
        else:
            methods = Pack.__dict__.keys() + Grid.__dict__.keys() \
                  + Place.__dict__.keys()

        for meth in methods:
            if meth[0] != '_' and meth not in ('config', 'configure'):
                setattr(self, meth, getattr(master, meth))

    @staticmethod
    def _autoscroll(sbar):
        '''Hide and show scrollbar as needed.'''
        def wrapped(first, last):
            first, last = float(first), float(last)
            if first <= 0 and last >= 1:
                sbar.grid_remove()
            else:
                sbar.grid()
            sbar.set(first, last)
        return wrapped

    def __str__(self):
        return str(self.master)

def _create_container(func):
    '''Creates a ttk Frame with a given master, and use this new frame to
    place the scrollbars and the widget.'''
    def wrapped(cls, master, **kw):
        container = ttk.Frame(master)
        return func(cls, container, **kw)
    return wrapped

class ScrolledText(AutoScroll, Text):
    '''A standard Tkinter Text widget with scrollbars that will
    automatically show/hide as needed.'''
    @_create_container
    def __init__(self, master, **kw):
        Text.__init__(self, master, **kw)
        AutoScroll.__init__(self, master)

if __name__ == '__main__':
    vp_start_gui()



