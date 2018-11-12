##############################################################################
# callback.tcl - procedures for displaying callbacks tied to a particular widget.
#
# Copyright (C) 2018 Donald Rozenberg
#
# This program is free software; you can redistribute it and/or
# modify it under the terms of the GNU General Public License
# as published by the Free Software Foundation; either version 2
# of the License, or (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.

##############################################################################

# vTcl:show_callbacks
# vTcl:update_callback_list
# vTcl:callback:show
# vTcl:show_function
# vTclWindow.vTcl.callback
# vTcl:show_all_callbacks

proc vTcl:show_all_callbacks {} {
    # Called from main memu -> Window. It opens a window and displays
    # all of the callback functions that have been specified.
    global vTcl
    set tree [vTcl:complete_widget_tree]
    foreach ii $tree {
        set ii   [split $ii \#]
        set i    [lindex $ii 0]
        set class [winfo class $i]
        if {$i == "."} {
            continue
        }
        if {[string first "vTH_" $i] > -1} {
            continue
        } ;# end if

        if {$class == "Scrollbar"} {
            continue
        }
        if {$class == "Menu"} {
            # It's a menu
            set wrote_label 0
            set ll [split $ii "."]
            set pop [string first ".pop" $i]
            # the first clause below is for regular menus; the second, popups.
            if {([llength $ll] == 3 && $pop == -1)
                || ($pop > -1 && [llength $ll] == 2)} {
                set t [vTcl:widget:get_tree_label $i]
            }
            if {([llength $ll] > 2 && $pop > -1 ) || \
                    ([llength $ll] == 3 && $pop == -1)} {
                set vTcl(toplevel_menu) ""
                set vTcl(support_function_list) [list]
                vTcl:python_inspect_menu_config $i
                if {[llength $vTcl(support_function_list)]} {
                    if {!$wrote_label} {
                        lappend  o_str  "$t"
                        set wrote_label 1
                    }
                    foreach b $vTcl(support_function_list) {
                        lappend o_str "   command: $b"
                    }
                }
                continue
            }
        }
        set ind [vTcl:indent $ii]
        set t [vTcl:widget:get_tree_label $i]
        set cmd ""
        catch {set cmd [$i cget -command]}
        if {$cmd != ""} {
            lappend  o_str  "$t"
            lappend o_str "   command: $cmd"
        }
        set bind [bind $i]
        if {[llength $bind] > 0} {
            lappend  o_str  "$t"
        }
        foreach b $bind {
            lappend o_str \
                "   bind:  $b  to \{ [string trim [bind $i $b]] \}"
        }
        set bind [bind $class]
        foreach b $bind {
            set binding [string trim [bind $i $b]]
            if {$binding != "" && [string first $b $o_str] == -1 } {
                lappend o_str "   bind: $b  \{ $binding \} \n"
            } ;# end if
        }
    }
    if {[info exists o_str]} {
        vTcl:callback:show 2 $o_str
    }
}

proc vTcl:show_callbacks {} {
    # Called from the Right Click Menu on selecting a widget. It sees
    # if a command attribute is present and records it. It then finds
    # all bindings for the widet and records them. It finally opens a
    # window to display the bindings.
    vTcl:callback:show 1
}

proc vTcl:update_callback_list {} {
    # Generates the callback list for a single widget.
    global vTcl
    if {![winfo exists $vTcl(gui,callback)]} { return }
    if {$vTcl(w,widget) != ""} {
        set i $vTcl(w,widget)
        set class [winfo class $i]
        set callbacks [list]
        set t [vTcl:widget:get_tree_label $i]
        lappend callbacks "$t"
        set cmd ""
        # Add command if one exists.
        catch {set cmd [$i cget -command]}
        if {$cmd != ""} {
            lappend callbacks "   command: $cmd"
        }
        # Add any callbacks
        set bind [bind $i]
        foreach b $bind {
            lappend callbacks \
                "   bind:  $b  to \{ [string trim [bind $i $b]] \}"
        }
        set bind [bind $class]
        foreach b $bind {
            set binding [string trim [bind $i $b]]
            if {$binding != "" && [string first $b $o_str] == -1 } {
                lappend callbacks \
                    [concat bind: " "  $b " \{" $binding "\}"]
            } ;# end if
        }
    } else {
        ::vTcl::MessageBox -icon error -message "No widget selected!" \
            -title "Error!" -type ok
    }
    $vTcl(gui,callback).f2.list delete 0 end
    if {[llength $callbacks] == 0} {
        $vTcl(gui,callback).f2.list insert end "No Callback for Widget"
    } else {
        foreach c $callbacks {
            $vTcl(gui,callback).f2.list insert end $c
        }
    }
}
proc vTcl:callback:show {{on 1} {callbacks ""}} {
    global vTcl
    if {$on == 1} {
        Window show $vTcl(gui,callback)
        vTcl:update_callback_list
    } elseif {$on == 2} {
        Window show $vTcl(gui,callback)
        $vTcl(gui,callback).f2.list delete 0 end
        if {[llength $callbacks] == 0} {
            $vTcl(gui,callback).f2.list insert end "No Callback for Widget"
        } else {
            foreach c $callbacks {
                $vTcl(gui,callback).f2.list insert end $c
            }
        }
    } else {
        Window hide $vTcl(gui,proclist)
    }
}

proc vTcl:show_function {line} {
    # Extracts function name from selected line, and searches for it
    # in the support console.

    global vTcl
    set name ""
    # Line will not have both command and bind.
    if {![regexp {command:\s+(\w+)} $line l name]} {
        regexp {bind:.* (\w*)\(\w*\)} $line l name
    }
    if {$name != ""} {
        if { [string first "pop" $name] == -1} {
            # look in support module
            set prefix "supp"
            set fs "[file rootname $vTcl(project,file)]_support.py"
            set m_name "support"
        } else {
            # look in GUI module
            set prefix "gui"
            set fs "[file rootname $vTcl(project,file)].py"
            set m_name "GUI"
        } ;# end if

        set fs_exists [file exists $fs]
        if {!$fs_exists} {
            tk_messageBox -title Error -message "No $m_name module available."
            return
        }
        vTcl:load_console $prefix $fs
        set vTcl(${prefix}_search_pattern) "def\\s+$name"
        vTcl:search_console $prefix
    }
}
proc vTcl:save_callbacks {} {
    # Saves the callback window to a file in the PWD with the default
    # file extension '.cbl'.
    global vTcl
    set file [vTcl:get_file callback]
    set output [$vTcl(gui,callback).f2.list get 0 end]
    set callback_file [open $file w]
    foreach o $output {
        puts $callback_file $o
    }
    close $callback_file
}

proc vTcl:copy_callbacks {} {
    # Copies callback window to clipboard.
    global vTcl
    set output [$vTcl(gui,callback).f2.list get 0 end]
    clipboard clear
    foreach o $output {
        clipboard append $o\n
    }
}


proc vTclWindow.vTcl.callback {args} {
    global vTcl
    set base .vTcl.callback
    if { [winfo exists $base] } { wm deiconify $base; return }
    toplevel $base -class vTcl
    wm transient $base .vTcl
    wm withdraw $vTcl(gui,callback)
    wm focusmodel $base passive
    wm geometry $base 600x200+48+237
    #wm maxsize $base 1137 870
    wm minsize $base 200 100
    wm overrideredirect $base 0
    wm resizable $base 1 1
    wm title $base "Callback List"
    wm protocol $base WM_DELETE_WINDOW {vTcl:callback:show 0}
    frame $base.frame7 \
        -borderwidth 1 -height 30 -relief sunken -width 30
    pack $base.frame7 \
        -anchor center -expand 0 -fill x -ipadx 0 -ipady 0 -padx 0 -pady 0 \
        -side top
    ::vTcl::OkButton $base.frame7.button11 -command "Window hide $base"
    button $base.frame7.button12 -text Save -command "vTcl:save_callbacks"
    button $base.frame7.button13 -text Copy -command "vTcl:copy_callbacks"
    label $base.frame7.label2 \
        -text "Double Click a callback to view in console."
    pack $base.frame7.label2 \
        -anchor center -expand 0 -side left
    pack $base.frame7.button11 \
        -expand 0 -side right
    pack $base.frame7.button12 \
        -expand 0 -side right
    pack $base.frame7.button13 \
        -expand 0 -side right
    vTcl:set_balloon $base.frame7.button11 "Close"

    ScrolledWindow $base.f2
    pack $base.f2 \
        -anchor center -expand 1 -fill both -ipadx 0 -ipady 0 -padx 0 -pady 0 \
        -side top
    listbox $base.f2.list \
        -yscrollcommand {.vTcl.callback.f2.sb4  set}
    bind $base.f2.list <Double-Button-1> {
        set vTcl(x) [.vTcl.callback.f2.list curselection]
        if {$vTcl(x) != ""} {
            vTcl:show_function [.vTcl.callback.f2.list get $vTcl(x)]
        }
    }
    #pack $base.f2.list \
    #    -anchor center -expand 1 -fill both -ipadx 0 -ipady 0 -padx 0 -pady 0 \
    #    -side left    Rozen 7/19  pm
#pack [ttk::sizegrip $base.f2.sz -style "PyConsole.TSizegrip"] -side right -anchor se
#grid [ttk::sizegrip $base.f2.sz] -column 999 -row 999 -sticky se
    $base.f2 setwidget $base.f2.list
    catch {wm geometry .vTcl.callback $vTcl(geometry,.vTcl.callback)}
    vTcl:setup_vTcl:bind $vTcl(gui,callback)
    catch {wm geometry $vTcl(gui,callback) $vTcl(geometry,$vTcl(gui,callback))}
    update idletasks
    wm deiconify $vTcl(gui,callback)

    vTcl:BindHelp $vTcl(gui,callback) FunctionList
}

