#tag Class
Protected Class RBSharedMethod
Inherits RBMethod
	#tag Method, Flags = &h0
		Sub Constructor(Name as string, returnType as string)
		  me.Constructor(Name, returnType, RBConstantDefinitions.kPublic)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(Name as string, returnType as string, scope as integer)
		  me.Constructor(name, returnType, scope, Encodings.UTF8)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(Name as string, returnType as string, scope as integer, enc as TextEncoding)
		  Super.Constructor(name, returnType, scope, enc)
		  
		  IsShared = true
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function xoperator_convert() As string
		  dim s as string
		  dim i as integer
		  dim paramStr as string
		  
		  s = ""
		  s = s + " <Method>" + EndOfLine
		  
		  s = s + "  <ItemName>" + mname + "</ItemName>"+ EndOfLine
		  s = s + "<Compatibility></Compatibility>"+ EndOfLine
		  s = s + "  <ItemSource>"+ EndOfLine
		  s = s + "   <TextEncoding>" + format(mEncoding.code,"#") + "</TextEncoding>"+ EndOfLine
		  
		  if mresultType = "" then
		    s = s + "   <SourceLine>Shared Sub " + mname + "(" + paramStr + ")</SourceLine>"+ EndOfLine
		  else
		    s = s + "   <SourceLine>Shared Function " + mname + "(" + paramStr + ") as " + mresultType + "</SourceLine>"+ EndOfLine
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
		  
		  s = s + "   <TextEncoding>" + format(mEncoding.code,"#") + "</TextEncoding>"+ EndOfLine
		  
		  s = s + "   <AliasName></AliasName>"+ EndOfLine
		  s = s + "  <IsShared>1</IsShared>"
		  s = s + "  <ItemFlags>" + format(mScope,"#") + "</ItemFlags>" + EndOfLine
		  
		  s = s + "  <ItemParams>"
		  for i = 0 to UBound(mparams)
		    if i > 0 then paramStr = paramStr + ", "
		    paramStr = paramStr + mparams(i)
		  next
		  s = s + paramStr + "</ItemParams>"+ EndOfLine
		  s = s + "  <ItemResult>" + mresultType + "</ItemResult>"+ EndOfLine
		  
		  s = s + " </Method>"+ EndOfLine
		  
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
