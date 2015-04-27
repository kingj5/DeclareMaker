#tag Class
Protected Class RBSharedComputedProperty
Inherits RBComputedProperty
	#tag Method, Flags = &h0
		Sub Constructor(Name as string, type As String)
		  me.Constructor(Name,type, RBConstantDefinitions.kPublic, Encodings.UTF8)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(Name as string, type As String, status As Integer)
		  me.Constructor(Name,type, status, Encodings.UTF8)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(Name as string, type as String, status as Integer, enc as TextEncoding)
		  Super.Constructor(name, type, Status, enc)
		  isShared = true
		End Sub
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
End Class
#tag EndClass
