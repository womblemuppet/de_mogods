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
	else if checkkey(downbutton)
		octdir=225
}
else if checkkey(rightbutton)
{
	octdir=0
	if checkkey(upbutton)
		octdir=45
	else if checkkey(downbutton)
		octdir=315
}
else	if checkkey(upbutton)
	octdir=90
else if checkkey(downbutton)
	octdir=270
else
{
	if right==true
		octdir=0
	else
		octdir=180
}
