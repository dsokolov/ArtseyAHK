; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ;
;                                                                       ;
;                ARTSEY layout for Autohotkey (ver 0.1)                 ;
;                                                                       ;
; Copyright (C) 2024 Dmitry I. Sokolov                                  ;
;                                                                       ;
; This program is free software: you can redistribute it and/or modify  ;
; it under the terms of the GNU General Public License as published by  ;
; the Free Software Foundation, either version 3 of the License, or     ;
; (at your option) any later version.                                   ;
;                                                                       ;
; This program is distributed in the hope that it will be useful,       ;
; but WITHOUT ANY WARRANTY; without even the implied warranty of        ;
; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the         ;
; GNU General Public License for more details.                          ;
;                                                                       ;
; You should have received a copy of the GNU General Public License     ;
; along with this program.  If not, see <http://www.gnu.org/licenses/>. ;
;                                                                       ;
; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ;

; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ;
;                                                                       ;
; Artsey laoyout version 0.9                                            ;
; Autohotkey version 1.1                                                ;
;                                                                       ;
; See README.md and LICENSE for more info                               ;
; Lear more about ARTSEY on https://artsey.io/                          ;
; Download AutoHotkey on https://www.autohotkey.com/                    ;
;                                                                       ;
; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ;

#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

Const_Key_None := 0
Const_Key_A := 1
Const_Key_R := 2
Const_Key_T := 4
Const_Key_S := 8
Const_Key_E := 16
Const_Key_Y := 32
Const_Key_I := 64
Const_Key_O := 128

Map_Keys :=  { }

Map_Keys[Const_Key_A] := "{a}"
Map_Keys[Const_Key_R] := "{r}"
Map_Keys[Const_Key_T] := "{t}"
Map_Keys[Const_Key_S] := "{s}"
Map_Keys[Const_Key_E] := "{e}"
Map_Keys[Const_Key_Y] := "{y}"
Map_Keys[Const_Key_I] := "{i}"
Map_Keys[Const_Key_O] := "{o}"

Map_Keys[Const_Key_E + Const_Key_O] := "{b}"
Map_Keys[Const_Key_Y + Const_Key_I + Const_Key_O] := "{m}"
Map_Keys[Const_Key_E + Const_Key_Y] := "{c}"
Map_Keys[Const_Key_I + Const_Key_O] := "{n}"
Map_Keys[Const_Key_A + Const_Key_R + Const_Key_T] := "{d}"
Map_Keys[Const_Key_E + Const_Key_I + Const_Key_O] := "{p}"
Map_Keys[Const_Key_A + Const_Key_R] := "{f}"
Map_Keys[Const_Key_A + Const_Key_T + Const_Key_S] := "{q}"
Map_Keys[Const_Key_R + Const_Key_T] := "{g}"
Map_Keys[Const_Key_Y + Const_Key_I] := "{u}"
Map_Keys[Const_Key_Y + Const_Key_I] := "{u}"
Map_Keys[Const_Key_E + Const_Key_I] := "{h}"
Map_Keys[Const_Key_R + Const_Key_S] := "{v}"
Map_Keys[Const_Key_T + Const_Key_S] := "{j}"
Map_Keys[Const_Key_A + Const_Key_S] := "{w}"
Map_Keys[Const_Key_Y + Const_Key_O] := "{k}"
Map_Keys[Const_Key_R + Const_Key_T + Const_Key_S] := "{x}"
Map_Keys[Const_Key_E + Const_Key_Y + Const_Key_I] := "{l}"
Map_Keys[Const_Key_A + Const_Key_R + Const_Key_T + Const_Key_S] := "{z}"

Map_Keys[Const_Key_A + Const_Key_Y] := "{,}"
Map_Keys[Const_Key_R + Const_Key_Y] := "{'}"
Map_Keys[Const_Key_A + Const_Key_I] := "{.}"
Map_Keys[Const_Key_T + Const_Key_I] := "{!}"
Map_Keys[Const_Key_A + Const_Key_O] := "{/}"
Map_Keys[Const_Key_S + Const_Key_O] := "{?}"

Map_Keys[Const_Key_E + Const_Key_Y + Const_Key_I + Const_Key_O] := "{Space}"
Map_Keys[Const_Key_A + Const_Key_E] := "{Enter}"
Map_Keys[Const_Key_E + Const_Key_R] := "{BS}"
Map_Keys[Const_Key_A + Const_Key_R + Const_Key_O] := "{Esc}"
Map_Keys[Const_Key_R + Const_Key_I] := "{Del}"
Map_Keys[Const_Key_A + Const_Key_R + Const_Key_T + Const_Key_O] := "{Tab}"

Map_Keys[Const_Key_E + Const_Key_S] := "{Ctrl}" ; TODO hold and release
Map_Keys[Const_Key_A + Const_Key_Y + Const_Key_I + Const_Key_O] := "{Shift}" ; TODO hold and release
; Map_Keys[Const_Key_S + Const_Key_Y] := ; TODO GUI what is it?
Map_Keys[Const_Key_E + Const_Key_R + Const_Key_T + Const_Key_S] := "{Shift}"
Map_Keys[Const_Key_S + Const_Key_I] := "{Alt}" ; TODO hold and release
; Map_Keys[Const_Key_A + Const_Key_R + Const_Key_T + Const_Key_S + Const_Key_E + Const_Key_Y + Const_Key_I + Const_Key_O] := ; TODO CLEAR what is it?

Key_Down_Mask := Const_Key_None
Key_Up_Mask := Const_Key_None

Last_Key_Down_Time := A_TickCount
Last_Key_Down_Maks := Key_Down_Mask

a::
    Key_Down_Mask := Key_Down_Mask | Const_Key_A
    GoTo ProcessKeyDown

a Up::
    Key_Up_Mask := Key_Up_Mask | Const_Key_A
    GoTo ProcessKeyUp

r::
    Key_Down_Mask := Key_Down_Mask | Const_Key_R
    GoTo ProcessKeyDown

r Up::
    Key_Up_Mask := Key_Up_Mask | Const_Key_R
    GoTo ProcessKeyUp

t::
    Key_Down_Mask := Key_Down_Mask | Const_Key_T
    GoTo ProcessKeyDown

t Up::
    Key_Up_Mask := Key_Up_Mask | Const_Key_T
    GoTo ProcessKeyUp

s::
    Key_Down_Mask := Key_Down_Mask | Const_Key_S
    GoTo ProcessKeyDown

s Up::
    Key_Up_Mask := Key_Up_Mask | Const_Key_S
    GoTo ProcessKeyUp

e::
    Key_Down_Mask := Key_Down_Mask | Const_Key_E
    GoTo ProcessKeyDown

e Up::
    Key_Up_Mask := Key_Up_Mask | Const_Key_E
    GoTo ProcessKeyUp

y::
    Key_Down_Mask := Key_Down_Mask | Const_Key_Y
    GoTo ProcessKeyDown

y Up::
    Key_Up_Mask := Key_Up_Mask | Const_Key_Y
    GoTo ProcessKeyUp

i::
    Key_Down_Mask := Key_Down_Mask | Const_Key_I
    GoTo ProcessKeyDown

i Up::
    Key_Up_Mask := Key_Up_Mask | Const_Key_I
    GoTo ProcessKeyUp

o::
    Key_Down_Mask := Key_Down_Mask | Const_Key_O
    GoTo ProcessKeyDown

o Up::
    Key_Up_Mask := Key_Up_Mask | Const_Key_O
    GoTo ProcessKeyUp

ProcessKeyDown:
    if (Last_Key_Down_Maks <> Key_Down_Mask) {
        Last_Key_Down_Time := A_TickCount
        Last_Key_Down_Maks := Key_Down_Mask
    } else {
        diff := A_TickCount - Last_Key_Down_Time
        if (diff > 1000) {
            Gosub ProcessGenericKey
        }
    }
    return

ProcessKeyUp:
    Gosub ProcessGenericKey
    Key_Down_Mask := Const_Key_None
    Key_Up_Mask := Const_Key_None
    return

ProcessGenericKey:
    Key_To_Send := Map_Keys[Key_Down_Mask]
    if (Key_To_Send<>"") {
        Send, %Key_To_Send%
    }
    return
