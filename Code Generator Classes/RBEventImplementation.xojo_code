#tag Class
Protected Class RBEventImplementation
Inherits RBMethod
	#tag Method, Flags = &h0
		Function operator_convert() As string
		  '<HookInstance>
		  '<ItemName>Untitled</ItemName>
		  '<Compatibility></Compatibility>
		  '<Visible>1</Visible>
		  '<ItemSource>
		  '<TextEncoding>134217984</TextEncoding>
		  '<SourceLine>Function Untitled(a as string) As string</SourceLine>
		  '<SourceLine>// this is as test</SourceLine>
		  '<SourceLine>End Function</SourceLine>
		  '</ItemSource>
		  '</HookInstance>
		  
		  dim s as string
		  dim i as integer
		  dim paramStr as string
		  
		  s = ""
		  s = s + "<HookInstance>" + EndOfLine
		  
		  s = s + " <ItemName>" + mname + "</ItemName>"+ EndOfLine
		  s = s + " <Compatibility></Compatibility>"+ EndOfLine
		  s = s + " <ItemSource>"+ EndOfLine
		  s = s + "  <TextEncoding>" + format(mEncoding.code,"#") + "</TextEncoding>"+ EndOfLine
		  
		  if mresultType = "" then
		    s = s + "  <SourceLine>" + "Sub " + mname + "(" + paramStr + ")</SourceLine>"+ EndOfLine
		  else
		    s = s + "   <SourceLine>" + "Function " + mname + "(" + paramStr + ") as " + mresultType + "</SourceLine>"+ EndOfLine
		  end if
		  
		  if uBound(mSourceLines) > -1 then
		    for i = 0 to ubound(msourceLines)
		      
		      s = s + "    <SourceLine>" + msourceLines(i) + "</SourceLine>"+ EndOfLine
		      
		    next
		  else
		    s = s + "    <SourceLine></SourceLine>"+ EndOfLine
		  end if
		  
		  if mresultType = "" then
		    s = s + "   <SourceLine>End Sub</SourceLine>"+ EndOfLine
		  else
		    s = s + "   <SourceLine>End Function</SourceLine>"+ EndOfLine
		  end if
		  s = s + "  </ItemSource>"+ EndOfLine
		  
		  s = s + " </HookInstance>"+ EndOfLine
		  
		  return s
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
