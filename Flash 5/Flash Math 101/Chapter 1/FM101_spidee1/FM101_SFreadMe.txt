Flash Math 101: The Integration of Mathematics with the Flash Scripting Environment

  By: Richard Wright
  Date: 06-01-2000
  URL: http://www.were-here.com/forum/Articles/FlashMath101

-----------------------------------------------------------

1.1 - 06/01/2000

This is the accompanying text for your initial download of The Spider vs. The Fly, an 
interactive game that was first produced to display at Wright Internet Solutions website:
http://www.wisolutions.london.on.ca 

The game has been in a state of transition since my decision to alter the collision detection 
script, which denies the code from cycling through the timeline, due to a linear based double 
loop that takes far too long to cycle through to do any detecting!

Due to time constraints, I've decided to provide for you the "entire mess" of files that I've
developed for the game content, and for potential changes to the script. There will be a main 
folder for all of the movies that are required in the game, and an alternate folder within that 
to house my experimental movies. I've left in place all the loading movies on their original 
levels, so as not to confuse myself when I re-introduce the finished product to my web design 
site, which is Spidee's home-sweet-home! Also, I've left cleanup of all the textfields for the 
next update, for two reasons: firstly, the time constraints, and secondly, for you to see my 
whole learning curve transpire, with your assistance, of course!

It has been over 6 months since I did any real editing to the game, so I will be reviewing my 
work right along with you. Please check the update link found on the Introduction page in a few 
weeks, and I'll make sure to update the download with a much more informative FM101_readMe.txt 
to help you along the way. There is not much merit in false information, and I just haven't had 
the time to refresh my memory prior to submission.

The shortest distance code is our concern for this chapter, and I've included a spreadsheet in 
both Notepad (.txt) and MS Works format (.wks, for easier manipulation of the values). There is 
also an html copy of the 3 different scripts so you may have both types of interface available
for editing the code. We'll be left with the same number of code snippets (152), but their total 
byte size will be considerably less.

A likely scenario for efficiency would be to have the 3 different "path" scripts available on 
their own layer, and called from each Pos# frame after initializing the variable set that will
be used for the input values. Please explore the files and apply your own logic to the shortest 
distance code. You may submit your work to post your results for comparison with others, and we 
will discover the best alternative for the code together.

The Alternate.fla folder includes several copies of FM101_SFspidee1A?.fla that hold progressive 
changes to the scripts in "Extreme-Alpha" version. I've included these files to give you an idea 
of how the collision detection code may be altered (there are no Javascript:Math.methods utilized,
however, so we may not pursue these alternatives). Also, I have made changes to file names in 
FM101_SFspidee.fla that are not reflected in these alternates, so I hope this doesn't confuse you 
too much; I'll either update these files (check the update link) or omit them by next chapter. 

The textfields displayed are a real hodge-podge to figure out, so I'll give you a rundown below.
Click on the middle left arrow, then the square start button to begin the game. 

If you have any questions, or if you would like to submit a solution, please find "My Parameters" 
email form on the Introduction page, or email me at:
2000wisolutions@home.com

------------------------------------------------------------
------------------------------------------------------------

Main Folder

FM101_SFempty.html - required for frameset display.
FM101_SFspidee1.html - main movie frameset top. 
FM101_SFspidee1frameset.html - main movie frameset - open using this file.
FM101_SFpixelCount.swf - parameters - changes the Fly's pixel count per move.
FM101_SFspidee.swf - actual game movie where all the interaction occurs.
FM101_SFspidee1.swf - main movie.
FM101_SFspideeTrap.swf - tracker movie.
FM101_SFtheFly.swf - The Fly's introduction.
FM101_SFtheSpider.swf - Spidee's introduction.
FM101_SFtotalMoves.swf - parameters - changes the Fly's total moves before freezing position.
FM101_SFwebDrop.swf - starting animation for initial Spidee position. 
FM101_SFwebSpeed.swf - parameters - changes speed of Spidee's web building by percentile.
FM101_SFreadMe.txt - you're reading it.
FM101_SFshortDistance.txt - spreadsheet of shortest distance code input in text format.
FM101_SFshortDistance.wks - spreadsheet of shortest distance code input in MS works format.

----------

Alternate.fla Folder

FM101_SFspideeA1.fla - 1st attempt to cleanup main movie.
FM101_SFspideeA2.fla - next 3 files progress new bounding box solution.
FM101_SFspideeA3.fla - ...
FM101_SFspideeA4.fla - ...

-----------------------------------------------------------------------------

Levels

_level0 - FM101_SFspidee1.swf
_level1 - this level is reserved for loading text scrolls from my website.
_level2 - FM101_SFtheFly.swf
_level3 - FM101_SFtheSpider.swf
_level4 - FM101_SFspideeTrap.swf
_level5 - FM101_SFwebDrop.swf
_level6 - FM101_SFpixelCount.swf
_level7 - FM101_SFtotalMoves.swf
_level8 - FM101_SFwebSpeed.swf
_level9 - FM101_SFspidee.swf

------------------------------------------------------------

------------------------------------------------------------

FM101_SFspidee.fla - Actionscript - Text Format

------------------

Main Timeline

------------------

Actions

Find Action data spreadsheets within Spidee1 folder

----

Button_move

On (Press)
      Begin Tell Target ("_level0")
            Unload Movie (3)
      End Tell Target
End On
On (Release)
      Play
End On


----

Textfields

fly_x
fly_y
dp1x
dp1y
dp2x
dp2y
dp3x
dp3y
dp4x
dp4y

-----------------------------------------------------------------

MC:Liveweb

Stop
Set Property ("v1", Visibility) = True
Set Property ("v2", Visibility) = False
Set Property ("v3", Visibility) = False
Set Property ("v4", Visibility) = True
Set Property ("v5", Visibility) = True
Set Property ("v6", Visibility) = False
Set Property ("v7", Visibility) = False
Set Property ("v8", Visibility) = True
Set Property ("v9", Visibility) = True
Set Property ("v10", Visibility) = False
Set Property ("v11", Visibility) = False
Set Property ("v12", Visibility) = True
Set Property ("v13", Visibility) = True
Set Property ("v14", Visibility) = False
Set Property ("v15", Visibility) = False
Set Property ("v16", Visibility) = True
Set Property ("v17", Visibility) = True
Set Property ("v18", Visibility) = False
Set Property ("v19", Visibility) = False
Set Property ("v20", Visibility) = False
Set Property ("v21", Visibility) = True
Set Property ("v22", Visibility) = False
Set Property ("v23", Visibility) = False
Set Property ("v24", Visibility) = False
Set Property ("v25", Visibility) = False
Set Property ("v26", Visibility) = False
Set Property ("v27", Visibility) = False
Set Property ("v28", Visibility) = False
Set Property ("v29", Visibility) = False
Set Property ("v30", Visibility) = False
Set Property ("v31", Visibility) = False
Set Property ("v32", Visibility) = False
Set Property ("v33", Visibility) = False
Set Property ("v34", Visibility) = False
Set Property ("v35", Visibility) = False
Set Property ("v36", Visibility) = False
Set Property ("v37", Visibility) = False
Set Property ("v38", Visibility) = False
Set Property ("v39", Visibility) = False
Set Property ("v40", Visibility) = False
Set Property ("v41", Visibility) = False
Set Property ("v42", Visibility) = False
Set Property ("v43", Visibility) = False
Set Property ("v44", Visibility) = False
Set Property ("v45", Visibility) = False
Set Property ("v46", Visibility) = False
Set Property ("v47", Visibility) = False
Set Property ("v48", Visibility) = False
Set Property ("v49", Visibility) = False
Set Property ("v50", Visibility) = False
Set Property ("v51", Visibility) = False
Set Property ("v52", Visibility) = False
Set Property ("v53", Visibility) = False
Set Property ("v54", Visibility) = False
Set Property ("v55", Visibility) = False
Set Property ("v56", Visibility) = False
Set Property ("v57", Visibility) = False
Set Property ("v58", Visibility) = False
Set Property ("v59", Visibility) = False
Set Property ("v60", Visibility) = False
Set Property ("v61", Visibility) = False
Set Property ("v62", Visibility) = False
Set Property ("v63", Visibility) = False
Set Property ("v64", Visibility) = False
Set Property ("v65", Visibility) = False
Set Property ("v66", Visibility) = False
Set Property ("v67", Visibility) = False
Set Property ("v68", Visibility) = False
Set Property ("v69", Visibility) = False
Set Property ("v70", Visibility) = False
Set Property ("v71", Visibility) = False
Set Property ("v72", Visibility) = False
Set Property ("v73", Visibility) = False
Set Property ("v74", Visibility) = False
Set Property ("v75", Visibility) = False

----

Textfields

Va (f2)
Va_v (f2)
V (f4)
V1_x_L (f4)
V1_y_L (f4)

v1_v thru v75_v

-----------------------------------------------------------------

MC:Subroutines

Actions

f1

Set Variable: "frame1" = frame1 + 1
Set Variable: "frame2" = 0
Set Variable: "frame3" = 0
Set Variable: "frame4" = 0
Set Variable: "frame5" = 0
Set Variable: "a" = 1
Set Variable: "a1" = a

----

f2

Set Variable: "frame2" = frame2 + 1
Set Variable: "Va_S" = "v" & a
Begin Tell Target ("/Liveweb")
      Set Variable: "Va" = /Subroutines:Va_S
      Set Variable: "Va_v" = GetProperty ("Va",_visible) 
      Set Variable: "v1_v" = GetProperty ("v1",_visible) 
      Set Variable: "v2_v" = GetProperty ("v2",_visible) 
      Set Variable: "v3_v" = GetProperty ("v3",_visible) 
      Set Variable: "v4_v" = GetProperty ("v4",_visible) 
      Set Variable: "v5_v" = GetProperty ("v5",_visible) 
      Set Variable: "v6_v" = GetProperty ("v6",_visible) 
      Set Variable: "v7_v" = GetProperty ("v7",_visible) 
      Set Variable: "v8_v" = GetProperty ("v8",_visible) 
      Set Variable: "v9_v" = GetProperty ("v9",_visible) 
      Set Variable: "v10_v" = GetProperty ("v10",_visible) 
      Set Variable: "v11_v" = GetProperty ("v11",_visible) 
      Set Variable: "v12_v" = GetProperty ("v12",_visible) 
      Set Variable: "v13_v" = GetProperty ("v13",_visible) 
      Set Variable: "v14_v" = GetProperty ("v14",_visible) 
      Set Variable: "v15_v" = GetProperty ("v15",_visible) 
      Set Variable: "v16_v" = GetProperty ("v16",_visible) 
      Set Variable: "v17_v" = GetProperty ("v17",_visible) 
      Set Variable: "v18_v" = GetProperty ("v18",_visible) 
      Set Variable: "v19_v" = GetProperty ("v19",_visible) 
      Set Variable: "v20_v" = GetProperty ("v20",_visible) 
      Set Variable: "v21_v" = GetProperty ("v21",_visible) 
      Set Variable: "v22_v" = GetProperty ("v22",_visible) 
      Set Variable: "v23_v" = GetProperty ("v23",_visible) 
      Set Variable: "v24_v" = GetProperty ("v24",_visible) 
      Set Variable: "v25_v" = GetProperty ("v25",_visible) 
      Set Variable: "v26_v" = GetProperty ("v26",_visible) 
      Set Variable: "v27_v" = GetProperty ("v27",_visible) 
      Set Variable: "v28_v" = GetProperty ("v28",_visible) 
      Set Variable: "v29_v" = GetProperty ("v29",_visible) 
      Set Variable: "v30_v" = GetProperty ("v30",_visible) 
      Set Variable: "v31_v" = GetProperty ("v31",_visible) 
      Set Variable: "v32_v" = GetProperty ("v32",_visible) 
      Set Variable: "v33_v" = GetProperty ("v33",_visible) 
      Set Variable: "v34_v" = GetProperty ("v34",_visible) 
      Set Variable: "v35_v" = GetProperty ("v35",_visible) 
      Set Variable: "v36_v" = GetProperty ("v36",_visible) 
      Set Variable: "v37_v" = GetProperty ("v37",_visible) 
      Set Variable: "v38_v" = GetProperty ("v38",_visible) 
      Set Variable: "v39_v" = GetProperty ("v39",_visible) 
      Set Variable: "v40_v" = GetProperty ("v40",_visible) 
      Set Variable: "v41_v" = GetProperty ("v41",_visible) 
      Set Variable: "v42_v" = GetProperty ("v42",_visible) 
      Set Variable: "v43_v" = GetProperty ("v43",_visible) 
      Set Variable: "v44_v" = GetProperty ("v44",_visible) 
      Set Variable: "v45_v" = GetProperty ("v45",_visible) 
      Set Variable: "v46_v" = GetProperty ("v46",_visible) 
      Set Variable: "v47_v" = GetProperty ("v47",_visible) 
      Set Variable: "v48_v" = GetProperty ("v48",_visible) 
      Set Variable: "v49_v" = GetProperty ("v49",_visible) 
      Set Variable: "v50_v" = GetProperty ("v50",_visible) 
      Set Variable: "v51_v" = GetProperty ("v51",_visible) 
      Set Variable: "v52_v" = GetProperty ("v52",_visible) 
      Set Variable: "v53_v" = GetProperty ("v53",_visible) 
      Set Variable: "v54_v" = GetProperty ("v54",_visible) 
      Set Variable: "v55_v" = GetProperty ("v55",_visible) 
      Set Variable: "v56_v" = GetProperty ("v56",_visible) 
      Set Variable: "v57_v" = GetProperty ("v57",_visible) 
      Set Variable: "v58_v" = GetProperty ("v58",_visible) 
      Set Variable: "v59_v" = GetProperty ("v59",_visible) 
      Set Variable: "v60_v" = GetProperty ("v60",_visible) 
      Set Variable: "v61_v" = GetProperty ("v61",_visible) 
      Set Variable: "v62_v" = GetProperty ("v62",_visible) 
      Set Variable: "v63_v" = GetProperty ("v63",_visible) 
      Set Variable: "v64_v" = GetProperty ("v64",_visible) 
      Set Variable: "v65_v" = GetProperty ("v65",_visible) 
      Set Variable: "v66_v" = GetProperty ("v66",_visible) 
      Set Variable: "v67_v" = GetProperty ("v67",_visible) 
      Set Variable: "v68_v" = GetProperty ("v68",_visible) 
      Set Variable: "v69_v" = GetProperty ("v69",_visible) 
      Set Variable: "v70_v" = GetProperty ("v70",_visible) 
      Set Variable: "v71_v" = GetProperty ("v71",_visible) 
      Set Variable: "v72_v" = GetProperty ("v72",_visible) 
      Set Variable: "v73_v" = GetProperty ("v73",_visible) 
      Set Variable: "v74_v" = GetProperty ("v74",_visible) 
      Set Variable: "v75_v" = GetProperty ("v75",_visible) 
End Tell Target

----

f3

Set Variable: "frame3" = frame3 + 1
If (a <= 75 and GetProperty ("../Liveweb/:Va",_visible) = True)
      Set Variable: "a3" = a
      Set Variable: "n" = 1
      Set Variable: "n3" = n
      Go to and Play (4)
Else
      If (a < 75 and GetProperty ("../Liveweb/:Va",_visible) = False)
            Set Variable: "a" = a + 1
            Set Variable: "a3.1" = a
            Go to and Play (2)
      Else
            If (a = 75 and GetProperty ("../Liveweb/:Va",_visible) = False)
                  Go to and Play (1)
            End If
      End If
End If

----

f4

Set Variable: "frame4" = frame4 + 1
If (n <= 11)
      Set Variable: "n4" = n
      Set Variable: "d" = 40
      Set Variable: "V_S" = "v" & a & "." & n
      Begin Tell Target ("/Liveweb")
            Set Variable: "V" = /Subroutines:V_S
      End Tell Target
      Go to and Play (5)
Else
      Set Variable: "a" = a + 1
      Set Variable: "a4" = a
      Go to and Play (2)
End If

----

f5

Set Variable: "frame3" = frame3 + 1
Begin Tell Target ("/Liveweb")
      Set Variable: "V1_x_L" = GetProperty ("V",_x)
      Set Variable: "V1_y_L" = GetProperty ("V",_y)
End Tell Target
Set Variable: "V1_x" = ../Liveweb:V1_x_L
Set Variable: "V1_y" = ../Liveweb:V1_y_L
Set Variable: "obj1_x" = GetProperty ("_level4/Fly_Guy",_x)
Set Variable: "obj2_x" = V1_x
Set Variable: "delta_x" = obj1_x - obj2_x
Set Variable: "obj1_y" = GetProperty ("_level4/Fly_Guy",_y)
Set Variable: "obj2_y" = V1_y
Set Variable: "delta_y" = obj1_y - obj2_y
If ((delta_x > (-1 * d) and delta_x < d) and (delta_y > (-1 * d) and delta_y < d))
      Stop
      Begin Tell Target ("_level0")
            Go to and Play ("Spidee_wins")
      End Tell Target
Else
      Set Variable: "n" = n + 1
      Set Variable: "n5" = n
      Go to and Play (4)
End If

f8 - (f3 alternate

Set Variable: "frame3" = frame3 + 1
If (a <= 75)
      Set Variable: "a3.2" = a
      Set Variable: "n" = 1
      Set Variable: "n3.2" = n
      Go to and Play (4)
Else
      Set Variable: "a" = a + 1
      Set Variable: "a3.3" = a
      Go to and Play (2)
End If

----

Textfields

Va_S (f2)
V_S (f4)
V1_x (f5)
V1_y (f5)
obj1_x (f5)
obj2_x (f5)
delta_x (f5)
obj1_y (f5)
obj2_y (f5)
delta_y (f5)

frame1
frame2
frame3
frame4
frame5

a1
a3
a3.1
a3.2
a3.3
a4
a (f1,f3,f4)
n3
n3.2
n4
n5
n (f3,f5)

------------------------------------------------

MC:Frame#'s

Action

Set Variable: "frame" = GetProperty ("/",_currentframe)
Set Variable: "loopframe" = GetProperty ("/Subroutines",_currentframe)
Go to and Play (1)

Textfields

loopframe
frame (main timeline)

------------------------------------------------------------------------
------------------------------------------------------------------------

Don't forget to check for updates, and good luck!

  

 