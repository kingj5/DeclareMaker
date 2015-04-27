#tag Class
Protected Class RBEventDefinition
Inherits RBMethod
	#tag Method, Flags = &h0
		Function LineCount() As integer
		  return 0
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function operator_convert() As string
		  '<Hook>
		  '<ItemName>Untitled</ItemName>
		  '<TextEncoding>134217984</TextEncoding>
		  '<ItemFlags>33</ItemFlags>
		  '<SystemFlags>0</SystemFlags>
		  '<ItemParams>a as string, b as integer</ItemParams>
		  '<ItemResult>string</ItemResult>
		  '</Hook>
		  
		  dim s as string
		  dim i as integer
		  dim paramStr as string
		  
		  s = ""
		  s = s + " <Hook>" + EndOfLine
		  
		  s = s + "  <ItemName>" + mname + "</ItemName>"+ EndOfLine
		  s = s + "   <TextEncoding>" + format(mEncoding.code,"#") + "</TextEncoding>"+ EndOfLine
		  
		  s = s + "  <ItemParams>"
		  for i = 0 to UBound(mparams)
		    if i > 0 then paramStr = paramStr + ", "
		    paramStr = paramStr + mparams(i)
		  next
		  s = s + paramStr + "</ItemParams>"+ EndOfLine
		  s = s + "  <ItemResult>" + mresultType + "</ItemResult>"+ EndOfLine
		  
		  s = s + " </Hook>"+ EndOfLine
		  
		  return s
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub sourceLine(assigns s as string)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function sourceLine(i as integer) As string
		  raise new OutOfBoundsException
		  
		End Function
	#tag EndMethod


	#tag ViewBehavior
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="-2147483648"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="IsShared"
			Group="Behavior"
			Type="boolean"
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
