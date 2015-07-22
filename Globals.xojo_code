#tag Module
Protected Module Globals
	#tag Method, Flags = &h0
		Function Clean(s as String) As String
		  //fixes problems associated with the introduction of nullable, nonnull, and specified types in NSDictionary
		  dim t as Text = s.ToText
		  t = t.ReplaceAll("_Nullable","").ReplaceAll("_Nonnull","").ReplaceAll("nonnull","").ReplaceAll("nullable","")
		  t = t.RemoveBetween("<",">").RemoveBetween("&lt;","&gt;")
		  
		  
		  Return t
		  
		  
		  '&lt; escaped version of <
		  '&gt; escaped version of >
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function RemoveBetween(extends t as text, start as Text, finish as Text) As Text
		  if t.IndexOf(start) <> -1 and t.IndexOf(finish) <> -1 then
		    dim i1 as Integer = t.IndexOf(start)
		    dim i2 as Integer = t.IndexOf(finish)
		    t = t.Left(i1) + t.Right(t.Length-i2-finish.Length)
		  end if
		  Return t
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
