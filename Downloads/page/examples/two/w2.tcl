#############################################################################
# Generated by PAGE version 4.8.9.3
# in conjunction with Tcl version 8.6
set vTcl(timestamp) ""


vTcl:font:add_GUI_font font10 \
"-family {DejaVu Sans} -size 14 -weight normal -slant roman -underline 0 -overstrike 0"
set vTcl(actual_gui_bg) #f5deb3
set vTcl(actual_gui_fg) #000000
set vTcl(actual_gui_menu_bg) #f5deb3
set vTcl(actual_gui_menu_fg) #000000
set vTcl(complement_color) #b2c9f4
set vTcl(analog_color_p) #eaf4b2
set vTcl(analog_color_m) #f4bcb2
set vTcl(active_fg) #000000
set vTcl(actual_gui_menu_active_bg)  #f4bcb2
set vTcl(active_menu_fg) #000000
#############################################################################
#################################
#LIBRARY PROCEDURES
#


if {[info exists vTcl(sourcing)]} {

proc vTcl:project:info {} {
    set base .top37
    namespace eval ::widgets::$base {
        set dflt,origin 0
        set runvisible 1
    }
    namespace eval ::widgets_bindings {
        set tagslist _TopLevel
    }
    namespace eval ::vTcl::modules::main {
        set procs {
        }
        set compounds {
        }
        set projectType single
    }
}
}

#################################
# USER DEFINED PROCEDURES
#

#################################
# GENERATED GUI PROCEDURES
#

proc vTclWindow.top37 {base} {
    if {$base == ""} {
        set base .top37
    }
    if {[winfo exists $base]} {
        wm deiconify $base; return
    }
    set top $base
    ###################
    # CREATING WIDGETS
    ###################
    vTcl::widgets::core::toplevel::createCmd $top -class Toplevel \
        -background {#f5deb3} -highlightbackground {#f5deb3} \
        -highlightcolor black 
    wm focusmodel $top passive
    wm geometry $top 600x450+123+415
    update
    # set in toplevel.wgt.
    global vTcl
    set vTcl(save,dflt,origin) 0
    wm maxsize $top 1905 1050
    wm minsize $top 1 1
    wm overrideredirect $top 0
    wm resizable $top 1 1
    wm deiconify $top
    wm title $top "Window II"
    vTcl:DefineAlias "$top" "Toplevel1" vTcl:Toplevel:WidgetProc "" 1
    button $top.but38 \
        -activebackground {#f4bcb2} -activeforeground black \
        -background {#f5deb3} -command close -disabledforeground {#b8a786} \
        -font font9 -foreground {#000000} -highlightbackground {#f5deb3} \
        -highlightcolor black -text Close 
    vTcl:DefineAlias "$top.but38" "Button1" vTcl:WidgetProc "Toplevel1" 1
    label $top.lab37 \
        -activebackground {#ffffcd} -activeforeground black \
        -background {#f5deb3} -disabledforeground {#b8a786} -font font9 \
        -foreground {#000000} -highlightbackground {#f5deb3} \
        -highlightcolor black -text Greeting -textvariable greeting 
    vTcl:DefineAlias "$top.lab37" "Label1" vTcl:WidgetProc "Toplevel1" 1
    ttk::progressbar $top.tPr37 \
        -variable t 
    vTcl:DefineAlias "$top.tPr37" "TProgressbar1" vTcl:WidgetProc "Toplevel1" 1
    ###################
    # SETTING GEOMETRY
    ###################
    place $top.but38 \
        -in $top -x 290 -y 180 -anchor nw -bordermode ignore 
    place $top.lab37 \
        -in $top -x 160 -y 80 -anchor nw -bordermode ignore 
    place $top.tPr37 \
        -in $top -x 160 -y 310 -anchor nw -bordermode ignore 

    vTcl:FireEvent $base <<Ready>>
}

#############################################################################
## Binding tag:  _TopLevel

bind "_TopLevel" <<Create>> {
    if {![info exists _topcount]} {set _topcount 0}; incr _topcount
}
bind "_TopLevel" <<DeleteWindow>> {
    if {[set ::%W::_modal]} {
                vTcl:Toplevel:WidgetProc %W endmodal
            } else {
                destroy %W; if {$_topcount == 0} {exit}
            }
}
bind "_TopLevel" <Destroy> {
    if {[winfo toplevel %W] == "%W"} {incr _topcount -1}
}

Window show .
Window show .top37

