#tag Class
Protected Class RBMethod
	#tag Method, Flags = &h0
		Sub addParameter(param As String)
		  mparams.append param
		End Sub
	#tag EndMethod

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
		  mname = name
		  mresultType = returnType
		  mScope = scope
		  mEncoding = enc
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function LineCount() As integer
		  return UBound(msourceLines)+1
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function operator_convert() As string
		  dim s as string
		  dim i as integer
		  dim paramStr as string
		  dim sharedName as string 
		  dim sharedIndicator as string = "0"
		  
		  if IsShared then
		    sharedName = "Shared "
		    sharedIndicator = "1"
		  end if
		  
		  s = ""
		  s = s + " <Method>" + EndOfLine
		  
		  s = s + "  <ItemName>" + mname + "</ItemName>"+ EndOfLine
		  s = s + "<Compatibility></Compatibility>"+ EndOfLine
		  s = s + "  <ItemSource>"+ EndOfLine
		  s = s + "   <TextEncoding>" + format(mEncoding.code,"#") + "</TextEncoding>"+ EndOfLine
		  
		  if mresultType = "" then
		    s = s + "   <SourceLine>" + sharedName + "Sub " + mname + "(" + paramStr + ")</SourceLine>"+ EndOfLine
		  else
		    s = s + "   <SourceLine>" + sharedName + "Function " + mname + "(" + paramStr + ") as " + mresultType + "</SourceLine>"+ EndOfLine
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
		  s = s + "  <IsShared>" + sharedIndicator + "</IsShared>"
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

	#tag Method, Flags = &h0
		Sub sourceLine(assigns s as string)
		  
		  mSourceLines.append s
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function sourceLine(i as integer) As string
		  if i <= uBound(msourceLines) + 1 then 
		    return msourceLines(i-1)
		  else 
		    raise new OutOfBoundsException
		  end if
		End Function
	#tag EndMethod


	#tag Property, Flags = &h0
		IsShared As boolean
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected mEncoding As TextEncoding
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected mname As string
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected mparams(-1) As String
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected mresultType As string
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected mScope As integer
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected msourceLines(-1) As string
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
