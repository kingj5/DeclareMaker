#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Open()
		  app.AutoQuit = True
		  
		  if not appData.Exists then
		    appData.CreateAsFolder
		  end if
		End Sub
	#tag EndEvent

	#tag Event
		Function UnhandledException(error As RuntimeException) As Boolean
		  dim d as new date
		  dim time as String = d.SQLDateTime
		  time = time.ReplaceAll(":","-")
		  dim tos as TextOutputStream = TextOutputStream.Create(appData.Child("Error log " + time))
		  tos.Write Join(error.Stack,EndOfLine)
		  tos.Close
		  
		  MsgBox "A crash log has been placed in the Application Support folder." 
		  
		  Return False
		End Function
	#tag EndEvent


	#tag Method, Flags = &h0
		Function appData() As FolderItem
		  Return SpecialFolder.ApplicationData.Child("DeclareMaker")
		End Function
	#tag EndMethod


	#tag Constant, Name = kEditClear, Type = String, Dynamic = False, Default = \"&Delete", Scope = Public
		#Tag Instance, Platform = Windows, Language = Default, Definition  = \"&Delete"
		#Tag Instance, Platform = Linux, Language = Default, Definition  = \"&Delete"
	#tag EndConstant

	#tag Constant, Name = kFileQuit, Type = String, Dynamic = False, Default = \"&Quit", Scope = Public
		#Tag Instance, Platform = Windows, Language = Default, Definition  = \"E&xit"
	#tag EndConstant

	#tag Constant, Name = kFileQuitShortcut, Type = String, Dynamic = False, Default = \"", Scope = Public
		#Tag Instance, Platform = Mac OS, Language = Default, Definition  = \"Cmd+Q"
		#Tag Instance, Platform = Linux, Language = Default, Definition  = \"Ctrl+Q"
	#tag EndConstant


	#tag ViewBehavior
	#tag EndViewBehavior
End Class
#tag EndClass
