#tag Class
Protected Class RBProject
	#tag Method, Flags = &h0
		Sub addModule(m as RBModule)
		  myModules.append m
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function HasAppClass() As boolean
		  Return True
		  
		  dim i as integer
		  
		  for i = 0 to UBound(myModules)
		    
		    if myModules(i) Isa RBAppClass then return true
		    
		  next
		  
		  return false
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function operator_convert() As string
		  dim s as string
		  dim i as integer
		  dim temp as string
		  
		  if saveAsRBVersion = "" then 
		    saveAsRBVersion = kVersion2009r2
		  end if
		  
		  if me.HasAppClass = false then 
		    myModules.Append new RBAppClass
		  end if
		  
		  s =  "<?xml version=""1.0""?>" + EndOfLine
		  s = s + "<RBProject version=""" + saveAsRBVersion + """>" + EndOfLine
		  s = s + "<block type=""Project"" ID=""0"">" + EndOfLine
		  s = s + " <ProjectSavedInVers>" + RBVersionValue() + "</ProjectSavedInVers>" + EndOfLine
		  s = s + " <ProjMgrUser></ProjMgrUser>" + EndOfLine
		  s = s + " <ProjMgrServer></ProjMgrServer>" + EndOfLine
		  s = s + " <MajorVersion>" + format(MajorVersion,"#") + "</MajorVersion>" + EndOfLine
		  s = s + " <MinorVersion>" + format(MinorVersion,"#") + "</MinorVersion>" + EndOfLine
		  s = s + " <SubVersion>" + format(SubVersion,"#") + "</SubVersion>" + EndOfLine
		  s = s + " <Release>" + format(Release,"#") + "</Release>" + EndOfLine
		  s = s + " <NonRelease>" + format(NonRelease,"#") + "</NonRelease>" + EndOfLine
		  s = s + " <Region></Region>" + EndOfLine
		  s = s + " <ShortVersion></ShortVersion>" + EndOfLine
		  s = s + " <LongVersion></LongVersion>" + EndOfLine
		  s = s + " <InfoVersion></InfoVersion>" + EndOfLine
		  s = s + " <AutoIncVersion>0</AutoIncVersion>" + EndOfLine
		  s = s + " <DefaultViewID>0</DefaultViewID>" + EndOfLine
		  s = s + " <ProjectType>" + format(projectType,"#") + "</ProjectType>" + EndOfLine
		  s = s + " <DefaultLanguage>0</DefaultLanguage>" + EndOfLine
		  s = s + " <CurrentLanguage>0</CurrentLanguage>" + EndOfLine
		  s = s + " <DefaultEncoding>0</DefaultEncoding>" + EndOfLine
		  s = s + " <BuildFlags>0</BuildFlags>" + EndOfLine
		  s = s + " <Icon>" + EndOfLine
		  s = s + " </Icon>" + EndOfLine
		  s = s + " <MacCreator>" + left(MacCreator,4) + "</MacCreator>" + EndOfLine
		  s = s + " <BuildMacName>" +BuildMacName + "</BuildMacName>" + EndOfLine
		  s = s + " <BuildCarbonName>" +BuildCarbonName + "</BuildCarbonName>" + EndOfLine
		  s = s + " <BuildCarbonMachOName>" + BuildCarbonMachOName + "</BuildCarbonMachOName>" + EndOfLine
		  s = s + " <BuildSize>0</BuildSize>" + EndOfLine
		  s = s + " <BuildMinSize>0</BuildMinSize>" + EndOfLine
		  s = s + " <BuildSizeAsString></BuildSizeAsString>" + EndOfLine
		  s = s + " <BuildMinSizeAsString></BuildMinSizeAsString>" + EndOfLine
		  s = s + " <WinMDICaption></WinMDICaption>" + EndOfLine
		  s = s + " <BuildWinName>" + BuildWinName +"</BuildWinName>" + EndOfLine
		  s = s + " <BuildWinMDI>0</BuildWinMDI>" + EndOfLine
		  s = s + " <BuildLinuxX86Name>" + BuildLinuxX86Name + "</BuildLinuxX86Name>" + EndOfLine
		  s = s + "</block>" + EndOfLine
		  
		  for i = 0 to ubound(myModules)
		    temp =  myModules(i)
		    
		    s = s + temp
		  next
		  
		  s = s + "<block type=""UIState"" ID=""0"">"+ EndOfLine
		  s = s + "<WindowState>"+ EndOfLine
		  s = s + "<OpenTab>"+ EndOfLine
		  s = s + "<ObjContainerID>0</ObjContainerID>"+ EndOfLine
		  s = s + "<EditSplit>280</EditSplit>"+ EndOfLine
		  s = s + "</OpenTab>"+ EndOfLine
		  s = s + "<LastLocation>(Home)</LastLocation>"+ EndOfLine
		  s = s + "</WindowState>"+ EndOfLine
		  s = s + "</block>"+ EndOfLine
		  
		  
		  s = s + "</RBProject>"
		  
		  return s
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function RBVersionValue() As string
		  select case saveAsRBVersion
		  case kVersion555
		    return "5.5.5"
		  case kVersion2005r4
		    return "2005.04"
		  case kVersion2006r4
		    return "2006.04"
		  case kVersion2007r3
		    return "2007.03"
		  end select
		  
		End Function
	#tag EndMethod


	#tag Property, Flags = &h0
		BuildCarbonMachOName As string = "MyApplication(Mach-O)"
	#tag EndProperty

	#tag Property, Flags = &h0
		BuildCarbonName As string = "MyApplication(Carbon)"
	#tag EndProperty

	#tag Property, Flags = &h0
		BuildLinuxX86Name As string = "MyApplication"
	#tag EndProperty

	#tag Property, Flags = &h0
		BuildMacName As String
	#tag EndProperty

	#tag Property, Flags = &h0
		BuildWinName As string = "My Application.exe"
	#tag EndProperty

	#tag Property, Flags = &h0
		MacCreator As string = "????"
	#tag EndProperty

	#tag Property, Flags = &h0
		MajorVersion As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		MinorVersion As Integer
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected myModules(-1) As RBModule
	#tag EndProperty

	#tag Property, Flags = &h0
		NonRelease As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		ProjectType As Integer = 0
	#tag EndProperty

	#tag Property, Flags = &h0
		Release As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		saveAsRBVersion As string = "5.5.2"
	#tag EndProperty

	#tag Property, Flags = &h0
		SubVersion As Integer
	#tag EndProperty


	#tag Constant, Name = kConsoleApp, Type = Double, Dynamic = False, Default = \"1", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kGUIApplication, Type = Double, Dynamic = False, Default = \"0", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kVersion2005r4, Type = String, Dynamic = False, Default = \"2005r4", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kVersion2006r4, Type = String, Dynamic = False, Default = \"2006r4", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kVersion2007r3, Type = String, Dynamic = False, Default = \"2007r3", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kVersion2009r2, Type = String, Dynamic = False, Default = \"2009r2", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kVersion555, Type = String, Dynamic = False, Default = \"5.5.5", Scope = Public
	#tag EndConstant


	#tag ViewBehavior
		#tag ViewProperty
			Name="BuildCarbonMachOName"
			Group="Behavior"
			InitialValue="MyApplication(Mach-O)"
			Type="string"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="BuildCarbonName"
			Group="Behavior"
			InitialValue="MyApplication(Carbon)"
			Type="string"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="BuildLinuxX86Name"
			Group="Behavior"
			InitialValue="MyApplication"
			Type="string"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="BuildMacName"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="BuildWinName"
			Group="Behavior"
			InitialValue="My Application.exe"
			Type="string"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="-2147483648"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="MacCreator"
			Group="Behavior"
			InitialValue="????"
			Type="string"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="MajorVersion"
			Group="Behavior"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="MinorVersion"
			Group="Behavior"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="NonRelease"
			Group="Behavior"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ProjectType"
			Group="Behavior"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Release"
			Group="Behavior"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="saveAsRBVersion"
			Group="Behavior"
			InitialValue="5.5.2"
			Type="string"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="SubVersion"
			Group="Behavior"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
