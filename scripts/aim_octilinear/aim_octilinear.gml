/***************************************************
  aim octilinear
  called by player
  changes octdir variable, does not return anything
***************************************************/

octdir=-1


if checkkey(leftbutton)
{
    octdir=180
    if checkkey(upbutton)
        octdir=135
    if checkkey(downbutton)
        octdir=225
}
if checkkey(rightbutton)
{
    octdir=0
    if checkkey(upbutton)
        octdir=45
    if checkkey(downbutton)
        octdir=315
}
if octdir==-1
{
    if checkkey(upbutton)
        octdir=90
    if checkkey(downbutton)
        octdir=270
}
if octdir==-1
{
    if right==true
        octdir=0
    else
        octdir=180
}
