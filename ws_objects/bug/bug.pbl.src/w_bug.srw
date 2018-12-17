$PBExportHeader$w_bug.srw
forward
global type w_bug from window
end type
type cb_6 from commandbutton within w_bug
end type
type cb_5 from commandbutton within w_bug
end type
type cb_4 from commandbutton within w_bug
end type
type cb_3 from commandbutton within w_bug
end type
type cb_2 from commandbutton within w_bug
end type
type cb_1 from commandbutton within w_bug
end type
type st_ds from statictext within w_bug
end type
type cb_dw from commandbutton within w_bug
end type
type st_dw from statictext within w_bug
end type
type dw from datawindow within w_bug
end type
type ln_1 from line within w_bug
end type
end forward

global type w_bug from window
integer width = 2587
integer height = 1900
boolean titlebar = true
string title = "Bug"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
cb_6 cb_6
cb_5 cb_5
cb_4 cb_4
cb_3 cb_3
cb_2 cb_2
cb_1 cb_1
st_ds st_ds
cb_dw cb_dw
st_dw st_dw
dw dw
ln_1 ln_1
end type
global w_bug w_bug

on w_bug.create
this.cb_6=create cb_6
this.cb_5=create cb_5
this.cb_4=create cb_4
this.cb_3=create cb_3
this.cb_2=create cb_2
this.cb_1=create cb_1
this.st_ds=create st_ds
this.cb_dw=create cb_dw
this.st_dw=create st_dw
this.dw=create dw
this.ln_1=create ln_1
this.Control[]={this.cb_6,&
this.cb_5,&
this.cb_4,&
this.cb_3,&
this.cb_2,&
this.cb_1,&
this.st_ds,&
this.cb_dw,&
this.st_dw,&
this.dw,&
this.ln_1}
end on

on w_bug.destroy
destroy(this.cb_6)
destroy(this.cb_5)
destroy(this.cb_4)
destroy(this.cb_3)
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.st_ds)
destroy(this.cb_dw)
destroy(this.st_dw)
destroy(this.dw)
destroy(this.ln_1)
end on

type cb_6 from commandbutton within w_bug
integer x = 1253
integer y = 372
integer width = 402
integer height = 112
integer taborder = 30
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "sort"
end type

event clicked;	
	dw.SetSort("c_per DESC")
	dw.Sort()
end event

type cb_5 from commandbutton within w_bug
integer x = 1257
integer y = 236
integer width = 402
integer height = 112
integer taborder = 20
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "reset"
end type

event clicked;dw.reset()
end event

type cb_4 from commandbutton within w_bug
integer x = 18
integer y = 1140
integer width = 1847
integer height = 112
integer taborder = 40
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "3. Bug 1765: DataWindow setredraw(False) and Sorting: Fixed"
end type

event clicked;LONG		i, Row
dw.reset()
dw.setredraw(false) 
	FOR i = 1 TO 5
		Row = dw.InsertRow(0)
		dw.SetItem(Row, "nr", String(i))
		dw.SetItem(Row, "zendpr", i)
	NEXT
	
	dw.SetSort("c_per DESC")
	dw.Sort()
dw.setredraw(true) 
	RETURN 0
end event

type cb_3 from commandbutton within w_bug
integer x = 18
integer y = 1292
integer width = 1778
integer height = 112
integer taborder = 20
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "4. Bug new: DataWindow Hide and Sorting: Crash"
end type

event clicked;LONG		i, Row
dw.reset()
dw.visible = False
	FOR i = 1 TO 5
		Row = dw.InsertRow(0)
		dw.SetItem(Row, "nr", String(i))
		dw.SetItem(Row, "zendpr", i)
	NEXT
	
	dw.SetSort("c_per DESC")
	dw.Sort()
dw.visible = true
	RETURN 0
end event

type cb_2 from commandbutton within w_bug
integer x = 1847
integer y = 1000
integer width = 448
integer height = 112
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Workaround"
end type

event clicked;LONG		i, Row
datastore	ds

	ds = CREATE datastore
	ds.DataObject = "dw_bug"
	
	FOR i = 1 TO 5
		Row = ds.InsertRow(0)
		ds.SetItem(Row, "nr", String(i))
		ds.SetItem(Row, "zendpr", i)
	NEXT
	ds.getitemnumber(1, 'c_per')
	ds.SetSort("c_per DESC")
	ds.Sort()


	Blob lb
	ds.GetFullState (lb)
	dw.reset()
	dw.SetFullState (lb)	
	
	IF isValid(ds) THEN DESTROY ds

	RETURN 0
end event

type cb_1 from commandbutton within w_bug
integer x = 18
integer y = 996
integer width = 1778
integer height = 112
integer taborder = 20
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "2.Bug 1808: DataStore InsertRows and Sorting: Crash"
end type

event clicked;LONG		i, Row
datastore	ds

	ds = CREATE datastore
	ds.DataObject = "dw_bug"
	
	FOR i = 1 TO 5
		Row = ds.InsertRow(0)
		ds.SetItem(Row, "nr", String(i))
		ds.SetItem(Row, "zendpr", i)
	NEXT
//	ds.getitemnumber(1, 'c_per')
	ds.SetSort("c_per DESC")
	ds.Sort()
	
	Blob lb
	ds.GetFullState (lb)
	dw.reset()
	dw.SetFullState (lb)	
	
	IF isValid(ds) THEN DESTROY ds	
	RETURN 0
end event

type st_ds from statictext within w_bug
integer y = 916
integer width = 1143
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 255
long backcolor = 67108864
string text = "Sorting isn~'t working:"
alignment alignment = center!
boolean focusrectangle = false
end type

type cb_dw from commandbutton within w_bug
integer y = 688
integer width = 1262
integer height = 112
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "1.DataWindow InsertRows and Sorting Works"
end type

event clicked;LONG		i, Row
	dw.reset()
	FOR i = 1 TO 5
		Row = dw.InsertRow(0)
		dw.SetItem(Row, "nr", String(i))
		dw.SetItem(Row, "zendpr", i)
	NEXT
	
	dw.SetSort("c_per DESC")
	dw.Sort()
	
	RETURN 0
end event

type st_dw from statictext within w_bug
integer width = 1143
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "DataWindow - Sorting is working"
alignment alignment = center!
boolean focusrectangle = false
end type

type dw from datawindow within w_bug
integer y = 80
integer width = 1143
integer height = 596
integer taborder = 10
string title = "none"
string dataobject = "dw_bug"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type ln_1 from line within w_bug
long linecolor = 33554432
integer linethickness = 4
integer beginy = 864
integer endx = 1143
integer endy = 864
end type

