#tag Class
Class OBJCClassDelegate
	#tag Method, Flags = &h0
		Function getClass() As RBClass
		  dim cls as new RBClass(clsName,True,False,"NSObject")
		  
		  'dim clsRef as new RBMethod("ClassRef","Ptr",RBConstantDefinitions.kPrivate)
		  'clsRef.IsShared = True
		  'clsRef.sourceLine = "static ref as ptr = NSClassFromString(""" + clsName + """)"
		  'clsRef.sourceLine = "return ref"
		  'cls.addMethod clsRef
		  
		  dim targetClass as new RBMethod("TargetClass","Ptr",RBConstantDefinitions.kPrivate)
		  targetClass.IsShared = True
		  targetClass.sourceLine = "static targetID as ptr"
		  targetClass.sourceLine = "if targetID = Nil then"
		  targetClass.sourceLine = "using UIKit"
		  targetClass.sourceLine = "dim methods() as TargetClassMethodHelper"
		  
		  for i as Integer = 0 to sels.Ubound
		    targetClass.sourceLine = sels(i).getTargetLine
		  Next
		  
		  targetClass.sourceLine = "targetID = BuildTargetClass(""NSObject"",""" + DelegateClassName + """,methods)"
		  targetClass.sourceLine = "end if"
		  targetClass.sourceLine = "Return targetID"
		  cls.addMethod targetClass
		  
		  for i as Integer = 0 to sels.Ubound
		    cls.addEventDefinition(sels(i).getEventDefinition)
		    cls.addMethod(sels(i).getFunction(clsName))
		    cls.addMethod(sels(i).getHandlingMethod)
		  Next
		  
		  dim dispatch as new RBSharedProperty("dispatch","xojo.Core.Dictionary", RBConstantDefinitions.kPrivate)
		  cls.addProperty(dispatch)
		  
		  dim mconstructor as new RBMethod("Constructor","")
		  mconstructor.sourceLine = "dim selfRef as Ptr = Initialize(Allocate(TargetClass))"
		  mconstructor.sourceLine = "Super.Constructor(selfRef)"
		  mconstructor.sourceLine = "if dispatch = nil then dispatch = new xojo.Core.Dictionary"
		  mconstructor.sourceLine = "dispatch.Value(selfRef) = xojo.Core.WeakRef.Create(self)"
		  cls.addMethod(mconstructor)
		  
		  Return cls
		End Function
	#tag EndMethod


	#tag Property, Flags = &h0
		clsName As String
	#tag EndProperty

	#tag Property, Flags = &h0
		DelegateClassName As String
	#tag EndProperty

	#tag Property, Flags = &h0
		sels() As DeclareMakerDelegate.OBJCSelectorDelegate
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
