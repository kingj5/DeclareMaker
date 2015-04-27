#tag Class
Protected Class RBModule
	#tag Method, Flags = &h0
		Sub addConstant(aConstant As RBConstant)
		  mconstants.Append aConstant
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub addMethod(m as RBMethod)
		  if m isa RBSharedMethod then 
		    
		  else
		    mmethods.append m
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub addNote(aNote As RBNote)
		  mnotes.Append aNote
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub addProperty(aproperty As RBProperty)
		  if aproperty isA RBSharedProperty then
		    //
		  else
		    mproperties.Append aproperty
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function boolToStr(a as boolean) As string
		  if a = true then
		    return "1"
		  else
		    return "0"
		  end if
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(nm as String)
		  me.Constructor(nm, false)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(nm as string, isClass as boolean)
		  me.Constructor(nm, isClass, false)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(nm as string, isClass as boolean, isInterface as boolean)
		  me.Constructor(nm,isClass,isinterface,"")
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(nm as string, isClass as boolean, isInterface as boolean, superClass as string)
		  mname = nm
		  mIsClass = isClass
		  mIsInterface = isInterface
		  mSuper = superClass
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function name() As string
		  Return mname
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub name(assigns n as string)
		  mname = n
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Operator_Convert() As String
		  
		  dim s as string
		  dim i as integer
		  dim temp as string
		  
		  s = ""
		  s = s + "<block type=""Module"" ID=""" + format(ticks,"#") + """>" + EndOfLine
		  s = s + " <ObjName>" + mname + "</ObjName>" + EndOfLine
		  s = s + " <ObjContainerID>0</ObjContainerID>"+ EndOfLine
		  s = s + " <IsClass>" + boolToStr(mIsClass) + "</IsClass>" + EndOfLine
		  if mSuper <> "" then 
		    s = s + " <Superclass>" + mSuper + "</Superclass>" + EndOfLine
		  end if
		  s = s + " <IsInterface>" + boolToStr(mIsInterface) + "</IsInterface>" + EndOfLine
		  s = s + " <Compatibility></Compatibility>" + EndOfLine
		  
		  s = s + renderExtraBits()
		  
		  'methods
		  for i = 0 to uBound(mmethods)
		    temp = mmethods(i)
		    s = s + temp
		  next
		  
		  'notes
		  for i = 0 to uBound(mnotes)
		    temp = mnotes(i)
		    s = s + temp
		  next
		  
		  'properties
		  for i = 0 to UBound(mproperties)
		    temp = mproperties(i)
		    s = s + temp
		  next i
		  
		  'constants
		  for i = 0 to uBound(mconstants)
		    temp = mconstants(i)
		    s = s + temp
		  next
		  
		  s = s + " <Interfaces>" + join(minterfacesImplemented,", ") + "</Interfaces>" + EndOfLine
		  
		  
		  s = s + "</block>" + EndOfLine
		  
		  return s
		End Function
	#tag EndMethod


	#tag Hook, Flags = &h0
		Event RenderExtraBits() As string
	#tag EndHook


	#tag Property, Flags = &h1
		Protected mconstants(-1) As RBConstant
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected minterfacesImplemented(-1) As string
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected mIsClass As boolean
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected mIsInterface As boolean
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected mmethods(-1) As RBMethod
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected mname As string
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected mnotes(-1) As RBNote
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected mproperties(-1) As RBProperty
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected mSuper As string
	#tag EndProperty


	#tag ViewBehavior
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
End Class
#tag EndClass
