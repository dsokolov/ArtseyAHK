; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ;
;                                                           ;
;          ARTSEY layout for Autohotkey (ver 0.1)           ;
;                                                           ;
; Copyright (C) 2024 Dmitry I. Sokolov                      ;
;                                                           ;
; Artsey laoyout version 0.9                                ;
; Autohotkey version 1.1                                    ;
;                                                           ;
; Lear more about ARTSEY on https://artsey.io/              ;
; Download AutoHotkey on https://www.autohotkey.com/        ;
;                                                           ;
; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ;

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