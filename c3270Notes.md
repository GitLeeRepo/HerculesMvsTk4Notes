# Overview

Notes on the c3270 emulator program

# References

* []()

# Default Key mappings

Key(s)            	  | Action
----------------------|----------------   
Ctrl\<Key\>]	          | Escape
Ctrl\<Key\>a Ctrl\<Key\>a | Key(0x01)
Ctrl\<Key\>a Ctrl\<Key\>] |Key(0x1d)
Ctrl\<Key\>a \<Key\>Tab   | BackTab
Ctrl\<Key\>a \<Key\>c	    | Clear
Ctrl\<Key\>a \<Key\>e	    | Escape
Ctrl\<Key\>a \<Key\>r	    | Reset
Ctrl\<Key\>a \<Key\>k	    | Keypad
Ctrl\<Key\>a \<Key\>l	    | Redraw
Ctrl\<Key\>a \<Key\>m	    | Compose
Ctrl\<Key\>a \<Key\>n	    | Menu
Ctrl\<Key\>a \<Key\>p	    | PrintText
Ctrl\<Key\>a \<Key\>^	    | Key(notsign)
Ctrl\<Key\>k	          | Keypad
Ctrl\<Key\>n	          | Menu
\<Key\>UP	              | Up
\<Key\>DOWN	            | Down
\<Key\>LEFT	            | Left
\<Key\>RIGHT	          | Right
\<Key\>F(n)	            | PF(n)
Ctrl\<Key\>a \<Key\>F(n)  | PF(n+12)
Ctrl\<Key\>a \<Key\>1	    | PA(1)
Ctrl\<Key\>a \<Key\>2	    | PA(2)
Ctrl\<Key\>a \<Key\>3	    | PA(3)
\<Key\>PPAGE	          | Scroll(Backward)
\<Key\>NPAGE	          | Scroll(Forward)

The base 3270-mode keymap adds:

Key	           | Action
---------------| --------------------
Ctrl\<Key\>c	   | Clear
Ctrl\<Key\>d	   | Dup
Ctrl\<Key\>f	   | FieldMark
Ctrl\<Key\>i	   | Tab
Ctrl\<Key\>l	   | Redraw
Ctrl\<Key\>r	   | Reset
Ctrl\<Key\>u	   | DeleteField
\<Key\>BackSpace | BackSpace
\<Key\>Return	   |Enter
\<Key\>Tab	     | Tab
\<Key\>Linefeed  | Newline
\<Key\>BACKSPACE | BackSpace
\<Key\>DC        | Delete
\<Key\>HOME      |Home
\<Key\>IC        } ToggleInsert
