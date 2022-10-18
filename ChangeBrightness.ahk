; Variables
Increments 			:= 10 ; < lower for a more granular change, higher for larger jump in brightness 
CurrentBrightness 	:= GetCurrentBrightNess()

; Hot Keys
; Win + Numpad 0/1/4/5/6

#Numpad0:: 	    ChangeBrightness(0) ;
#Numpad1::      ChangeBrightness(100) ;
#Numpad4::      ChangeBrightness( CurrentBrightness -= Increments ) ; decrease brightness
#Numpad5::      ChangeBrightness( CurrentBrightness := 50 ) ; default
#Numpad6::      ChangeBrightness( CurrentBrightness += Increments ) ; increase brightness


; Functions
ChangeBrightness( ByRef brightness := 50, timeout = 1 )
{
	if ( brightness >= 0 && brightness <= 100 )
	{
		For property in ComObjGet( "winmgmts:\\.\root\WMI" ).ExecQuery( "SELECT * FROM WmiMonitorBrightnessMethods" )
			property.WmiSetBrightness( timeout, brightness )	
	}
 	else if ( brightness > 100 )
 	{
 		brightness := 100
 	}
 	else if ( brightness < 0 )
 	{
 		brightness := 0
 	}
}

GetCurrentBrightNess()
{
	For property in ComObjGet( "winmgmts:\\.\root\WMI" ).ExecQuery( "SELECT * FROM WmiMonitorBrightness" )
		currentBrightness := property.CurrentBrightness	

	return currentBrightness
}