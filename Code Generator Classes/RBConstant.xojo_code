#tag Class
Protected Class RBConstant
	#tag Method, Flags = &h0
		Sub Constructor(aName As String, aType As Integer)
		  dim def as string
		  
		  select case aType
		  case RBConstantDefinitions.kString 
		    def = ""
		  case RBConstantDefinitions.kBoolean
		    def = "false"
		  case RBConstantDefinitions.kColor
		    def = "&c000000"
		  case RBConstantDefinitions.kDouble
		    def = "0.00"
		  case RBConstantDefinitions.kInteger
		    def = "0"
		  end select
		  
		  Constructor(aName, aType, def, RBConstantDefinitions.kPublic, Encodings.UTF8)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(aName As String, aType As Integer, aDef As String)
		  
		  Constructor(aName, aType, aDef, RBConstantDefinitions.kPublic, Encodings.UTF8)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(aName As String, aType As Integer, aDef As String, aFlag As Integer, enc As TextEncoding)
		  mname = aName
		  mType = aType
		  mDef = aDef
		  mFlags = aFlag
		  mEncoding = enc
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Operator_Convert() As String
		  Dim s As String
		  Dim i As Integer
		  Dim temp As String
		  
		  s = ""
		  s = s + " <Constant>" + EndOfLine
		  s = s + "   <TextEncoding>" + format(mEncoding.code,"#") + "</TextEncoding>"+ EndOfLine
		  s = s + "   <ItemName>" + mname + "</ItemName>"+ EndOfLine
		  s = s + "   <ItemType>" + format(mType,"#") + "</ItemType>" + EndOfLine
		  s = s + "   <ItemDef>" + mDef + "</ItemDef>" + EndOfLine
		  s = s + "   <ItemFlags>" + format(mFlags,"#") + "</ItemFlags>" + EndOfLine
		  s = s + " </Constant>"+ EndOfLine
		  Return s
		  
		End Function
	#tag EndMethod


	#tag Property, Flags = &h21
		Private mDef As String
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected mEncoding As TextEncoding
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mFlags As Integer
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected mname As string
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected mType As Integer
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
