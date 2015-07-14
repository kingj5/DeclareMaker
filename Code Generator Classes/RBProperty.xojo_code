#tag Class
Protected Class RBProperty
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
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function name() As String
		  Return mname
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function operator_convert() As string
		  dim s as string
		  dim i as integer
		  dim paramStr as string
		  '<Property Flags="37" [Shared="true"]>aProperty As String</Property>
		  s = ""
		  
		  select case mScope
		  case RBConstantDefinitions.kPublic
		    s = s + " <Property>"
		  case RBConstantDefinitions.kProtected
		    s = s + " <Property Flags=" + chr(34)+ format(RBConstantDefinitions.kProtected,"#")+ CHR(34) + ">"
		  case RBConstantDefinitions.kPrivate
		    s = s + " <Property Flags=" + chr(34)+ format(RBConstantDefinitions.kPrivate,"#")+ CHR(34) + ">"
		  end Select
		  
		  s = s + mname + " AS " + mType + "</Property>" + EndOfLine
		  
		  return s
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function type() As String
		  return mType
		End Function
	#tag EndMethod


	#tag Property, Flags = &h1
		Protected isShared As boolean
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
