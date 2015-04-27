#tag Class
Protected Class RBNote
	#tag Method, Flags = &h0
		Sub addLine(s as string)
		  lines.Append s
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(nm as String)
		  mEncoding = Encodings.UTF8
		  me.mname = nm
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function operator_convert() As string
		  '<Note>
		  '<ItemName>Untitled</ItemName>
		  '<Compatibility></Compatibility>
		  '<Visible>1</Visible>
		  '<ItemSource>
		  '<TextEncoding>134217984</TextEncoding>
		  '<NoteLine>Untitled</NoteLine>
		  '<NoteLine></NoteLine> // first empty line is ignored !!!!
		  '<NoteLine></NoteLine>
		  '</ItemSource>
		  '<ItemFlags>0</ItemFlags>
		  '</Note>
		  
		  
		  dim s as string
		  dim i as integer
		  dim temp as string
		  
		  s = ""
		  s = s + "<Note>" + EndOfLine
		  s = s + "<ItemName>" + mname + "</ItemName>" + EndOfLine
		  s = s + "<Compatibility></Compatibility>"+ EndOfLine
		  s = s + " <Visible>1</Visible>" + EndOfLine
		  
		  s = s + "<ItemSource>"
		  s = s + "<TextEncoding>" + format(mEncoding.code,"#") + "</TextEncoding>"+ EndOfLine
		  
		  s = s + "<NoteLine></NoteLine>"
		  
		  for i = 0 to ubound(lines)
		    s = s + "<NoteLine>" + lines(i) + "</NoteLine>"
		  next
		  
		  s = s + "</ItemSource>"
		  s = s + "<ItemFlags>0</ItemFlags>"
		  s = s + "</Note>"
		  
		  return s
		End Function
	#tag EndMethod


	#tag Property, Flags = &h1
		Protected lines(-1) As string
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected mEncoding As TextEncoding
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected mname As string
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
