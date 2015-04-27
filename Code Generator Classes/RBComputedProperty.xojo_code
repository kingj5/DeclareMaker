#tag Class
Protected Class RBComputedProperty
Inherits RBProperty
	#tag Method, Flags = &h0
		Sub Constructor(Name as string, type As String)
		  me.Constructor(Name,type, RBConstantDefinitions.kPublic, Encodings.UTF8)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(Name as string, type As String, scope As Integer)
		  me.Constructor(Name,type, scope, Encodings.UTF8)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(Name as string, type as String, scope as Integer, enc as TextEncoding)
		  mname = name
		  mType = type
		  mScope = scope
		  mEncoding = enc
		  
		  getmethodCode = new RBMethod("Get", mType, mScope)
		  setmethodCode = new RBMethod("Set", mType, mScope)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function getMethod() As RBMethod
		  return getMethodCode
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub getMethod(assigns s as RBMethod)
		  // strip the header and replace it with our own
		  getmethodCode = new RBMethod("Get", mType, mScope)
		  
		  for i as integer = 1 to s.LineCount
		    getmethodCode.sourceLine = s.sourceLine(i)
		  next
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function name() As String
		  Return mname
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function operator_convert() As String
		  dim s as string
		  dim i as integer
		  dim methodCodeLines() as string
		  
		  '<ComputedProperty Flags="0" Compatibility="" [Shared="true"]>
		  '<Declaration>globalComputedProperty As Integer</Declaration>
		  '<GetAccessor>
		  '<TextEncoding>134217984</TextEncoding>
		  '<SourceLine>Get</SourceLine>
		  '<SourceLine></SourceLine>
		  '<SourceLine>End Get</SourceLine>
		  '</GetAccessor>
		  ''<SetAccessor>
		  '<TextEncoding>134217984</TextEncoding>
		  '<SourceLine>Set</SourceLine>
		  '<SourceLine></SourceLine>
		  '<SourceLine>End Set</SourceLine>
		  '</SetAccessor>
		  ''</ComputedProperty>
		  
		  s = ""
		  
		  s = s + "<ComputedProperty Flags=""" + format(mScope,"#")  + """"
		  if isShared then
		    s = s + " Shared=""true"""
		  end if
		  s = s + ">" + EndOfLine
		  
		  s = s + "<Declaration>" + mName + " as " + mType + "</Declaration>" + EndOfLine
		  
		  s = s + "<GetAccessor>" + EndOfLine
		  s = s + "<TextEncoding>134217984</TextEncoding>" + EndOfLine
		  s = s + "<SourceLine>Get</SourceLine>" + EndOfLine
		  for i = 1 to getmethodCode.LineCount
		    s = s + "<SourceLine>" + getmethodCode.sourceLine(i) + "</SourceLine>" + EndOfLine
		  next
		  s = s + "<SourceLine>End Get</SourceLine>" + EndOfLine
		  s = s + "</GetAccessor>" + EndOfLine + EndOfLine
		  
		  s = s + "<SetAccessor>" + EndOfLine
		  s = s + "<TextEncoding>134217984</TextEncoding>" + EndOfLine
		  s = s + "<SourceLine>Set</SourceLine>" + EndOfLine
		  for i = 1 to setmethodCode.LineCount
		    s = s + "<SourceLine>" + setmethodCode.sourceLine(i)  + "</SourceLine>" + EndOfLine
		  next
		  s = s + "<SourceLine>End Set</SourceLine>" + EndOfLine
		  s = s + "</SetAccessor>" + EndOfLine + EndOfLine
		  
		  s = s + "</ComputedProperty>" + endOfline
		  
		  return s
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function setMethod() As RBMethod
		  return setMethodCode
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub setMethod(assigns s as RBMethod)
		  // strip the header and replace it with our own
		  setmethodCode = new RBMethod("Set", mType, mScope)
		  
		  for i as integer = 1 to s.LineCount
		    setmethodCode.sourceLine = s.sourceLine(i)
		  next
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function type() As String
		  return mType
		End Function
	#tag EndMethod


	#tag Property, Flags = &h1
		Protected getmethodCode As RBMethod
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected isShared As boolean = false
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected mEncoding As TextEncoding
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected mname As string
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected mScope As integer
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected mType As String
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected setmethodCode As RBMethod
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
