#tag Module
Protected Module DeclareMaker
	#tag Method, Flags = &h0
		Function AdditionalModule() As RBModule
		  dim result as new RBModule("Extensions",False,False,"")
		  for i as Integer = 0 to consts.Ubound
		    dim c as new RBConstant(consts(i),RBConstantDefinitions.kString,consts(i).Replace("Lib","")+".framework",RBConstantDefinitions.kPublic,Encodings.UTF8)
		    result.addConstant c
		  next
		  dim c as new RBConstant("FoundationLib",RBConstantDefinitions.kString,"Foundation.framework",RBConstantDefinitions.kPublic,Encodings.UTF8)
		  result.addConstant c
		  
		  dim m as new RBMethod("NSClassFromString","Ptr",RBConstantDefinitions.kPublic)
		  m.addParameter "clsName as Text"
		  m.sourceLine = "Declare function NSClassFromString lib FoundationLib (clsName as CFStringRef) as ptr"
		  m.sourceLine = "Return NSClassFromString(clsName)"
		  
		  result.addMethod m
		  
		  dim n as new RBNote("Important")
		  n.addLine "Your assistance in finding and correcting any bugs is appreciated.  If you find any errors in class generation"
		  n.addLine "please report them and I will attempt to correct them   -Jason King"
		  n.addLine ""
		  n.addLine "For now, class inheritance is not determined and must be manually assigned"
		  n.addLine ""
		  n.addLine "Please note that any calls which should be BYREF are not properly resolved and will not function correctly in the outputted classes"
		  n.addLine "Any function that uses a ByRef parameter should be inspected and corrected individually"
		  n.addLine ""
		  n.addLine "Please add the following structures to this module to be used by the classes:"
		  n.addLine ""
		  n.addLine "Struct CGRect"
		  n.addLine "x as Single"
		  n.addLine "y as Single"
		  n.addLine "w as Single"
		  n.addLine "h as Single"
		  n.addLine ""
		  n.addLine "Struct CGPoint"
		  n.addLine "x as Single"
		  n.addLine "y as Single"
		  n.addLine ""
		  n.addLine "Struct CGSize"
		  n.addLine "w as Single"
		  n.addLine "h as Single"
		  n.addLine ""
		  n.addLine "Struct NSRect"
		  n.addLine "x as Single"
		  n.addLine "y as Single"
		  n.addLine "w as Single"
		  n.addLine "h as Single"
		  n.addLine ""
		  n.addLine "Struct NSPoint"
		  n.addLine "x as Single"
		  n.addLine "y as Single"
		  n.addLine ""
		  n.addLine "Struct NSSize"
		  n.addLine "w as Single"
		  n.addLine "h as Single"
		  
		  result.addNote n
		  
		  dim d as new date
		  dim n2 as new RBNote("About")
		  n2.addLine "Generated by DeclareMaker on " + d.ShortDate
		  
		  result.addNote n2
		  
		  Return result
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub addRequiredConstant(aConst as String)
		  if consts.IndexOf(aConst) = -1 then
		    consts.Append aConst
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function capFirstLetter(txt as String) As String
		  dim first as String = txt.Left(1)
		  first = first.Uppercase
		  dim rest as String = txt.Mid(2)
		  
		  Return first + rest
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function declareStringForType(typeString as String) As String
		  select case typeString
		  case "BOOL"
		    Return "Boolean"
		  case "double"
		    Return "Double"
		  case "NSString"
		    Return "CFStringRef"
		  case "Void"
		    Return ""
		  case "NSInteger"
		    Return "Integer"
		  case "NSUInteger"
		    Return "UInteger"
		  case "CGRect"
		    Return "CGRect"
		  case "CGPoint"
		    Return "CGPoint"
		  case "CGSize"
		    Return "CGSize"
		  case "NSPoint"
		    Return "NSPoint"
		  case "NSSize"
		    Return "NSSize"
		  case "NSRect"
		    Return "NSRect"
		  case "CGFloat"
		    Return "Double"
		  case "CLLocationAccuracy"
		    Return "Double"
		  case "CLLocationCoordinate2D"
		    Return "CLLocationCoordinate2D"
		  Case "CLLocationDegrees"
		    Return "Double"
		  case "CLLocationDirection"
		    Return "Double"
		  case "CLLocationDistance"
		    Return "Double"
		  Case "CLLocationSpeed"
		    Return "Double"
		  case "NSTimeInterval"
		    Return "Double"
		  case "float"
		    Return "Double"
		  else
		    Return "ptr"
		  end select
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function isPrimitiveType(txt as String) As Boolean
		  Return declareStringForType(txt) <> "Ptr"
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function NSObject() As RBClass
		  dim result as new RBClass("NSObject")
		  
		  dim privateConstructor as new RBMethod("Constructor","",RBConstantDefinitions.kPrivate)
		  privateConstructor.sourceLine = "//don't allow direct initialization"
		  
		  dim publicConstructor as new RBMethod("Constructor","")
		  publicConstructor.addParameter "ref as ptr"
		  publicConstructor.sourceLine = "declare function retain lib FoundationLib selector ""retain"" (obj_id as ptr) as ptr"
		  publicConstructor.sourceLine = "m_id = retain(ref)"
		  
		  dim destructor as new RBMethod("Destructor","")
		  destructor.sourceLine = "declare sub release lib FoundationLib selector ""release"" (obj_id as ptr)"
		  destructor.sourceLine = "release(m_id)"
		  
		  dim id as new RBMethod("id","Ptr")
		  id.sourceLine = "Return self.m_id"
		  
		  dim op_convert as new RBMethod("Operator_Convert","Ptr")
		  op_convert.sourceLine = "Return self.id"
		  
		  dim init as new RBMethod("Initialize","Ptr")
		  init.IsShared = True
		  init.addParameter "obj_id as ptr"
		  init.sourceLine = "declare function init lib FoundationLib selector ""init"" (obj_id as ptr) as ptr"
		  init.sourceLine = "Return init(obj_id)"
		  
		  dim alloc as new RBMethod("Allocate","Ptr")
		  alloc.IsShared = True
		  alloc.addParameter "clsRef as ptr"
		  alloc.sourceLine = "declare function alloc lib FoundationLib selector ""alloc"" (clsRef as ptr) as ptr"
		  alloc.sourceLine = "Return alloc(clsRef)"
		  
		  dim m_id as new RBProperty("m_id","Ptr",RBConstantDefinitions.kPrivate)
		  
		  result.addMethod privateConstructor
		  result.addMethod publicConstructor
		  result.addMethod destructor
		  result.addMethod id
		  result.addMethod op_convert
		  result.addMethod init
		  result.addMethod alloc
		  result.addProperty m_id
		  
		  Return result
		End Function
	#tag EndMethod


	#tag Property, Flags = &h0
		attemptConvertConstructors As Boolean = True
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected consts() As String
	#tag EndProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="attemptConvertConstructors"
			Group="Behavior"
			InitialValue="True"
			Type="Boolean"
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
			Name="Name"
			Visible=true
			Group="ID"
			Type="String"
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
End Module
#tag EndModule
