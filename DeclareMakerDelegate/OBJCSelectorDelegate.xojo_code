#tag Class
Class OBJCSelectorDelegate
	#tag Method, Flags = &h0
		Sub Constructor(methodType as string, returnType as string, selSubparts() as string, selSubpartTypes() as string, selParamNames() as String, evtName as String)
		  
		  self.methodType = methodType
		  self.returnType = returnType
		  self.selectorParameterNames = selParamNames
		  self.selectorSubparts = selSubparts
		  self.selectorSubpartTypes = selSubpartTypes
		  self.eventName = evtName
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function getCharCode() As String
		  dim code as String
		  if returnType = "void" then
		    code = "v:"
		  else
		    code = charCodeForType(returnType) + ":"
		  end if
		  for i as Integer = 0 to selectorSubpartTypes.Ubound
		    code = code + charCodeForType(selectorSubpartTypes(i))
		  Next
		  
		  Return code
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function getEventDefinition() As RBEventDefinition
		  dim result as new RBEventDefinition(eventName,  if(returnType = "void", "", returnType) )
		  for i as Integer = 0 to selectorParameterNames.Ubound
		    result.addParameter selectorParameterNames(i) + " as " + if(declareStringForType(selectorSubpartTypes(i)) = "Ptr", selectorSubpartTypes(i), declareStringForType(selectorSubpartTypes(i)))
		  next
		  Return result
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function getFunction(className as String) As RBMethod
		  dim result as new RBMethod(getFunctionName, if(returnType = "void", "", returnType) )
		  result.IsShared = True
		  
		  result.addParameter "pid as ptr"
		  result.addParameter "sel as ptr"
		  
		  for i as Integer = 0 to selectorParameterNames.Ubound
		    result.addParameter selectorParameterNames(i) + " as " + declareStringForType(selectorSubpartTypes(i))
		  next
		  
		  result.sourceLine = "dim w as xojo.Core.WeakRef = xojo.core.WeakRef(dispatch.Value(pid))"
		  result.sourceLine = "if not(w.Value = nil) then"
		  //Return result
		  
		  dim tmp as String = className + "(w.value)." + getHandlingMethodName + "("
		  for i as Integer = 0 to selectorSubpartTypes.Ubound
		    tmp = tmp + if(declareStringForType(selectorSubpartTypes(i)) = "ptr", "new " + selectorSubpartTypes(i) + "(" + selectorParameterNames(i) + ")", selectorParameterNames(i))
		    if i <> selectorSubpartTypes.Ubound then
		      tmp = tmp + ", "
		    end if
		  next
		  tmp = tmp + ")"
		  if returnType = "void" then
		    result.sourceLine = tmp
		  else
		    result.sourceLine = "return " + tmp
		  end if
		  
		  result.sourceLine = "end if"
		  
		  
		  Return result
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function getFunctionName() As String
		  dim result as String
		  result = "impl_" + Join(selectorSubparts,"").ReplaceAll(":","")
		  Return result
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function getHandlingMethod() As RBMethod
		  dim result as new RBMethod(getHandlingMethodName,  if(returnType = "void", "", returnType) )
		  for i as Integer = 0 to selectorParameterNames.Ubound
		    result.addParameter selectorParameterNames(i) + " as " + if(declareStringForType(selectorSubpartTypes(i)) = "Ptr", selectorSubpartTypes(i), declareStringForType(selectorSubpartTypes(i)))
		  next
		  
		  dim tmp as String = "RaiseEvent " + eventName + "("
		  for i as Integer = 0 to selectorParameterNames.Ubound
		    tmp = tmp + selectorParameterNames(i)
		    if i <> selectorSubpartTypes.Ubound then
		      tmp = tmp + ", "
		    end if
		  Next
		  tmp = tmp + ")"
		  if returnType = "void" then
		    result.sourceLine = tmp
		  else
		    result.sourceLine = "return " + tmp
		  end if
		  
		  Return result
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function getHandlingMethodName() As String
		  dim result as String
		  result = "Handle" + Join(selectorSubparts,"").ReplaceAll(":","")
		  Return result
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function getTargetLine() As String
		  dim result as String
		  
		  result = "methods.Append new TargetClassMethodHelper("""
		  result = result + Join(selectorSubparts,"") + """, AddressOf "
		  result = result + getFunctionName + ", """ + getCharCode + """)"
		  
		  Return result
		End Function
	#tag EndMethod


	#tag Property, Flags = &h0
		eventName As String
	#tag EndProperty

	#tag Property, Flags = &h0
		methodType As String
	#tag EndProperty

	#tag Property, Flags = &h0
		returnType As String
	#tag EndProperty

	#tag Property, Flags = &h0
		selectorParameterNames() As String
	#tag EndProperty

	#tag Property, Flags = &h0
		selectorSubparts() As String
	#tag EndProperty

	#tag Property, Flags = &h0
		selectorSubpartTypes() As String
	#tag EndProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="eventName"
			Group="Behavior"
			Type="Boolean"
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
			Name="libConstantName"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="methodType"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="returnType"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
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
