#tag Class
Protected Class RBClass
Inherits RBModule
	#tag Event
		Function RenderExtraBits() As string
		  // here we render all the extra bits for the XML
		  // in this case the event defs and instances
		  
		  dim t as string 
		  
		  t = t + RenderHooks
		  t = t + RenderHookImpls
		  
		  return t
		  
		End Function
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub addEventDefinition(def as RBEventDefinition)
		  mEventDefs.Append def
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub addEventImplementation(def as RBEventImplementation)
		  mEventImpl.Append def
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub addInterface(anInterface As string)
		  if minterfacesImplemented.IndexOf(anInterface) < 0 then
		    minterfacesImplemented.Append anInterface
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub addMethod(m as RBMethod)
		  mmethods.append m
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub addProperty(aproperty As RBProperty)
		  mproperties.Append aproperty
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(nm as String)
		  me.Constructor(nm, false)
		  mIsClass = true
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(nm as string, isClass as boolean)
		  me.Constructor(nm, isClass, false)
		  mIsClass = true
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(nm as string, isClass as boolean, isInterface as boolean)
		  me.Constructor(nm,isClass,isinterface,"")
		  mIsClass = true
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(nm as string, superClass as string)
		  me.constructor(nm, false, false, superClass)
		  mIsClass = true
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(nm as string, superClass as string, isClass as boolean, isInterface as boolean)
		  super.constructor(nm, isClass, isInterface, superClass)
		  
		  mIsClass = true
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function RenderHookImpls() As string
		  
		  dim t as string
		  
		  for i as integer = 0 to ubound(mEventImpl)
		    dim s as string
		    s = mEventImpl(i)
		    t = t + s
		  next
		  
		  return t
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function RenderHooks() As string
		  
		  dim t as string
		  
		  for i as integer = 0 to ubound(mEventDefs)
		    dim s as string
		    s = mEventDefs(i)
		    t = t + s
		  next
		  
		  return t
		End Function
	#tag EndMethod


	#tag Property, Flags = &h21
		Private mEventDefs(-1) As RBEventDefinition
	#tag EndProperty

	#tag Property, Flags = &h0
		mEventImpl(-1) As RBEventImplementation
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
