#tag Class
Class OBJCClassManual
	#tag Method, Flags = &h0
		Function getClass() As RBClass
		  dim cls as new RBClass(clsName)',True,False,superCls)
		  for i as Integer = 0 to sels.Ubound
		    cls.addMethod sels(i).getMethod
		  next
		  for i as Integer = 0 to props.Ubound
		    cls.addProperty props(i).getComputedProperty
		  next
		  'dim nameConst as new RBConstant("ClassName",RBConstantDefinitions.kString, clsName, RBConstantDefinitions.kPrivate, Encodings.UTF8)
		  'cls.addConstant nameConst
		  
		  dim clsRef as new RBMethod("ClassRef","Ptr",RBConstantDefinitions.kPrivate)
		  clsRef.IsShared = True
		  clsRef.sourceLine = "static ref as ptr = NSClassFromString(""" + clsName + """)"
		  clsRef.sourceLine = "return ref"
		  cls.addMethod clsRef
		  
		  Return cls
		End Function
	#tag EndMethod


	#tag Property, Flags = &h0
		clsName As String
	#tag EndProperty

	#tag Property, Flags = &h0
		props() As OBJCPropertyManual
	#tag EndProperty

	#tag Property, Flags = &h0
		sels() As OBJCSelectorManual
	#tag EndProperty

	#tag Property, Flags = &h0
		superCls As String
	#tag EndProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="clsName"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
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
			Name="superCls"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
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
