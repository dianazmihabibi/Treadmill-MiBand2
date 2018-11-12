#############################################################################
# Generated by PAGE version 4.17
# in conjunction with Tcl version 8.6
# Nov 05, 2018 06:16:21 AM WIB  platform: Linux
set vTcl(timestamp) ""


if {!$vTcl(borrow)} {

vTcl:font:add_GUI_font TkDefaultFont \
"-family Helvetica -size -12 -weight normal -slant roman -underline 0 -overstrike 0"
vTcl:font:add_GUI_font TkFixedFont \
"-family courier -size -12 -weight normal -slant roman -underline 0 -overstrike 0"
vTcl:font:add_GUI_font TkMenuFont \
"-family Helvetica -size -12 -weight normal -slant roman -underline 0 -overstrike 0"
vTcl:font:add_GUI_font TkTextFont \
"-family Helvetica -size -12 -weight normal -slant roman -underline 0 -overstrike 0"
set vTcl(actual_gui_bg) #d9d9d9
set vTcl(actual_gui_fg) #000000
set vTcl(actual_gui_menu_bg) #d9d9d9
set vTcl(actual_gui_menu_fg) #000000
set vTcl(complement_color) #d9d9d9
set vTcl(analog_color_p) #d9d9d9
set vTcl(analog_color_m) #d9d9d9
set vTcl(active_fg) #000000
set vTcl(actual_gui_menu_active_bg)  #d8d8d8
set vTcl(active_menu_fg) #000000
}

#################################
#LIBRARY PROCEDURES
#


if {[info exists vTcl(sourcing)]} {

proc vTcl:project:info {} {
    set base .top39
    global vTcl
    set base $vTcl(btop)
    if {$base == ""} {
        set base .top39
    }
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
# GENERATED GUI PROCEDURES
#

proc vTclWindow.top39 {base} {
    if {$base == ""} {
        set base .top39
    }
    if {[winfo exists $base]} {
        wm deiconify $base; return
    }
    set top $base
    ###################
    # CREATING WIDGETS
    ###################
    vTcl::widgets::core::toplevel::createCmd $top -class Toplevel \
        -background {#d9d9d9} -highlightcolor black 
    wm focusmodel $top passive
    wm geometry $top 1009x536+0+0
    update
    # set in toplevel.wgt.
    global vTcl
    global img_list
    set vTcl(save,dflt,origin) 0
    wm maxsize $top 1009 570
    wm minsize $top 1 1
    wm overrideredirect $top 0
    wm resizable $top 0 0
    wm deiconify $top
    wm title $top "Register"
    vTcl:DefineAlias "$top" "Toplevel1" vTcl:Toplevel:WidgetProc "" 1
    labelframe $top.lab41 \
        -foreground black -labelanchor n -text Gender -background {#d9d9d9} \
        -height 145 -highlightcolor black -width 980 
    vTcl:DefineAlias "$top.lab41" "Labelframe1" vTcl:WidgetProc "Toplevel1" 1
    set site_3_0 $top.lab41
    button $site_3_0.but48 \
        -activebackground {#d9d9d9} -activeforeground black \
        -background {#d9d9d9} -command left_btn_gender -foreground {#000000} \
        -highlightcolor black -text ? 
    vTcl:DefineAlias "$site_3_0.but48" "left_btn_gender" vTcl:WidgetProc "Toplevel1" 1
    button $site_3_0.but49 \
        -activebackground {#d9d9d9} -activeforeground black \
        -background {#d9d9d9} -command right_btn_gender -foreground {#000000} \
        -highlightcolor black -text Button 
    vTcl:DefineAlias "$site_3_0.but49" "right_btn_gender" vTcl:WidgetProc "Toplevel1" 1
    label $site_3_0.lab51 \
        -activebackground {#d9d9d9} -activeforeground black \
        -background {#ffffff} -foreground {#000000} -highlightcolor black \
        -text Label 
    vTcl:DefineAlias "$site_3_0.lab51" "gender_val" vTcl:WidgetProc "Toplevel1" 1
    place $site_3_0.but48 \
        -in $site_3_0 -x 0 -relx 0.014 -y 20 -width 62 -relwidth 0 \
        -height 110 -relheight 0 -anchor nw -bordermode ignore 
    place $site_3_0.but49 \
        -in $site_3_0 -x 900 -y 20 -width 62 -height 110 -anchor nw \
        -bordermode ignore 
    place $site_3_0.lab51 \
        -in $site_3_0 -x 90 -y 20 -width 794 -relwidth 0 -height 107 \
        -relheight 0 -anchor nw -bordermode ignore 
    labelframe $top.lab45 \
        -foreground black -labelanchor n -text Age -background {#d9d9d9} \
        -height 255 -highlightcolor black -width 470 
    vTcl:DefineAlias "$top.lab45" "Labelframe2" vTcl:WidgetProc "Toplevel1" 1
    set site_3_0 $top.lab45
    button $site_3_0.but52 \
        -activebackground {#d9d9d9} -activeforeground black \
        -background {#d9d9d9} -command age_pul_up_btn -foreground {#000000} \
        -highlightcolor black -text Button 
    vTcl:DefineAlias "$site_3_0.but52" "age_pul_up_btn" vTcl:WidgetProc "Toplevel1" 1
    button $site_3_0.but53 \
        -activebackground {#d9d9d9} -activeforeground black \
        -background {#d9d9d9} -command age_sat_up_btn -foreground {#000000} \
        -highlightcolor black -text Button 
    vTcl:DefineAlias "$site_3_0.but53" "age_sat_up_btn" vTcl:WidgetProc "Toplevel1" 1
    button $site_3_0.but54 \
        -activebackground {#d9d9d9} -activeforeground black \
        -background {#d9d9d9} -command age_pul_bot_btn -foreground {#000000} \
        -highlightcolor black -text Button 
    vTcl:DefineAlias "$site_3_0.but54" "age_pul_bot_btn" vTcl:WidgetProc "Toplevel1" 1
    button $site_3_0.but55 \
        -activebackground {#d9d9d9} -activeforeground black \
        -background {#d9d9d9} -command age_sat_bot_btn -foreground {#000000} \
        -highlightcolor black -text Button 
    vTcl:DefineAlias "$site_3_0.but55" "age_sat_bot_btn" vTcl:WidgetProc "Toplevel1" 1
    label $site_3_0.lab61 \
        -activebackground {#f9f9f9} -activeforeground black \
        -background {#ffffff} -foreground {#000000} -highlightcolor black \
        -text Label 
    vTcl:DefineAlias "$site_3_0.lab61" "age_puluh" vTcl:WidgetProc "Toplevel1" 1
    label $site_3_0.lab62 \
        -activebackground {#f9f9f9} -activeforeground black \
        -background {#ffffff} -foreground {#000000} -highlightcolor black \
        -text Label 
    vTcl:DefineAlias "$site_3_0.lab62" "age_satu" vTcl:WidgetProc "Toplevel1" 1
    place $site_3_0.but52 \
        -in $site_3_0 -x 20 -y 20 -width 192 -relwidth 0 -height 35 \
        -relheight 0 -anchor nw -bordermode ignore 
    place $site_3_0.but53 \
        -in $site_3_0 -x 250 -y 20 -width 192 -relwidth 0 -height 35 \
        -relheight 0 -anchor nw -bordermode ignore 
    place $site_3_0.but54 \
        -in $site_3_0 -x 20 -y 200 -width 192 -height 35 -anchor nw \
        -bordermode ignore 
    place $site_3_0.but55 \
        -in $site_3_0 -x 250 -y 200 -width 192 -height 35 -anchor nw \
        -bordermode ignore 
    place $site_3_0.lab61 \
        -in $site_3_0 -x 20 -y 0 -rely 0.24 -width 190 -relwidth 0 \
        -height 130 -relheight 0 -anchor nw -bordermode ignore 
    place $site_3_0.lab62 \
        -in $site_3_0 -x 250 -y 60 -width 190 -height 130 -anchor nw \
        -bordermode ignore 
    labelframe $top.lab46 \
        -foreground black -labelanchor n -text Weight -background {#d9d9d9} \
        -height 255 -highlightcolor black -width 480 
    vTcl:DefineAlias "$top.lab46" "Labelframe2_2" vTcl:WidgetProc "Toplevel1" 1
    set site_3_0 $top.lab46
    button $site_3_0.but56 \
        -activebackground {#d9d9d9} -activeforeground black \
        -background {#d9d9d9} -command wei_pul_up_btn -foreground {#000000} \
        -highlightcolor black -text Button 
    vTcl:DefineAlias "$site_3_0.but56" "wei_pul_up_btn" vTcl:WidgetProc "Toplevel1" 1
    button $site_3_0.but57 \
        -activebackground {#d9d9d9} -activeforeground black \
        -background {#d9d9d9} -command wei_pul_bot_btn -foreground {#000000} \
        -highlightcolor black -text Button 
    vTcl:DefineAlias "$site_3_0.but57" "wei_pul_bot_btn" vTcl:WidgetProc "Toplevel1" 1
    button $site_3_0.but58 \
        -activebackground {#d9d9d9} -activeforeground black \
        -background {#d9d9d9} -command wei_sat_up_btn -foreground {#000000} \
        -highlightcolor black -text Button 
    vTcl:DefineAlias "$site_3_0.but58" "wei_sat_up_btn" vTcl:WidgetProc "Toplevel1" 1
    button $site_3_0.but59 \
        -activebackground {#d9d9d9} -activeforeground black \
        -background {#d9d9d9} -command wei_sat_bot_btn -foreground {#000000} \
        -highlightcolor black -text Button 
    vTcl:DefineAlias "$site_3_0.but59" "wei_sat_bot_btn" vTcl:WidgetProc "Toplevel1" 1
    label $site_3_0.lab63 \
        -activebackground {#f9f9f9} -activeforeground black \
        -background {#ffffff} -foreground {#000000} -highlightcolor black \
        -text Label 
    vTcl:DefineAlias "$site_3_0.lab63" "wei_puluh" vTcl:WidgetProc "Toplevel1" 1
    label $site_3_0.lab64 \
        -activebackground {#f9f9f9} -activeforeground black \
        -background {#ffffff} -foreground {#000000} -highlightcolor black \
        -text Label 
    vTcl:DefineAlias "$site_3_0.lab64" "wei_satu" vTcl:WidgetProc "Toplevel1" 1
    place $site_3_0.but56 \
        -in $site_3_0 -x 20 -y 20 -width 192 -height 35 -anchor nw \
        -bordermode ignore 
    place $site_3_0.but57 \
        -in $site_3_0 -x 20 -y 200 -width 192 -height 35 -anchor nw \
        -bordermode ignore 
    place $site_3_0.but58 \
        -in $site_3_0 -x 260 -y 20 -width 192 -height 35 -anchor nw \
        -bordermode ignore 
    place $site_3_0.but59 \
        -in $site_3_0 -x 260 -y 200 -width 192 -height 35 -anchor nw \
        -bordermode ignore 
    place $site_3_0.lab63 \
        -in $site_3_0 -x 20 -y 60 -width 190 -height 130 -anchor nw \
        -bordermode ignore 
    place $site_3_0.lab64 \
        -in $site_3_0 -x 260 -y 60 -width 190 -height 130 -anchor nw \
        -bordermode ignore 
    button $top.but47 \
        -activebackground {#d9d9d9} -activeforeground black \
        -background {#d9d9d9} -command submit -foreground {#000000} \
        -highlightcolor black -text Submit 
    vTcl:DefineAlias "$top.but47" "submit" vTcl:WidgetProc "Toplevel1" 1
    ###################
    # SETTING GEOMETRY
    ###################
    place $top.lab41 \
        -in $top -x 20 -y 20 -width 980 -relwidth 0 -height 145 -relheight 0 \
        -anchor nw -bordermode ignore 
    place $top.lab45 \
        -in $top -x 20 -y 180 -width 470 -relwidth 0 -height 255 -relheight 0 \
        -anchor nw -bordermode ignore 
    place $top.lab46 \
        -in $top -x 520 -y 180 -width 480 -relwidth 0 -height 255 \
        -relheight 0 -anchor nw -bordermode ignore 
    place $top.but47 \
        -in $top -x 240 -y 450 -width 532 -relwidth 0 -height 65 -relheight 0 \
        -anchor nw -bordermode ignore 

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

set btop ""
if {$vTcl(borrow)} {
    set btop .bor[expr int([expr rand() * 100])]
    while {[lsearch $btop $vTcl(tops)] != -1} {
        set btop .bor[expr int([expr rand() * 100])]
    }
}
set vTcl(btop) $btop
Window show .
Window show .top39 $btop
if {$vTcl(borrow)} {
    $btop configure -background plum
}

