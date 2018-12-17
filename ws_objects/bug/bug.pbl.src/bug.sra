$PBExportHeader$bug.sra
$PBExportComments$Generated Application Object
forward
global type bug from application
end type
global transaction sqlca
global dynamicdescriptionarea sqlda
global dynamicstagingarea sqlsa
global error error
global message message
end forward

global type bug from application
string appname = "bug"
end type
global bug bug

on bug.create
appname="bug"
message=create message
sqlca=create transaction
sqlda=create dynamicdescriptionarea
sqlsa=create dynamicstagingarea
error=create error
end on

on bug.destroy
destroy(sqlca)
destroy(sqlda)
destroy(sqlsa)
destroy(error)
destroy(message)
end on

event open;
	Open(w_bug)
	RETURN
end event

