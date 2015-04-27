#tag Class
Protected Class OBJCSelector
	#tag Method, Flags = &h0
		Sub Constructor(libName as string, methodType as string, returnType as string, selSubparts() as string, selSubpartTypes() as string, selParamNames() as String)
		  self.libConstantName = libName
		  self.methodType = methodType
		  self.returnType = returnType
		  self.selectorParameterNames = selParamNames
		  self.selectorSubparts = selSubparts
		  self.selectorSubpartTypes = selSubpartTypes
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function constructorMethod() As RBMethod
		  dim result as new RBMethod("Constructor","")
		  
		  for i as Integer = 0 to selectorSubpartTypes.Ubound
		    result.addParameter selectorParameterNames(i) + " as " + if(isPrimitiveType(selectorSubpartTypes(i)), declareStringForType(selectorSubpartTypes(i)),selectorSubpartTypes(i))
		  next
		  
		  result.sourceLine = getDeclare
		  dim functionLine as String = "Super.Constructor( " + selectorSubparts(0).ReplaceAll(":","")
		  functionLine = functionLine + "_(Allocate(ClassRef)"
		  
		  for i as Integer = 0 to selectorParameterNames.Ubound
		    functionLine = functionLine + ", " + selectorParameterNames(i)
		  next
		  
		  functionLine = functionLine + ") )"
		  
		  result.sourceLine = functionLine
		  Return result
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function getDeclare() As String
		  dim type as string
		  if returnType = "void" then
		    type = "sub "
		  else
		    type = "function "
		  end if
		  
		  dim result as String = "declare " + type + selectorSubparts(0).ReplaceAll(":","") + "_ lib " + libConstantName + " selector """
		  dim sel as String = Join(selectorSubparts,"")
		  result = result + sel + """ ("
		  
		  if methodType = "+" then
		    result = result + "clsRef as ptr"
		  else
		    result = result + "obj_id as ptr"
		  end if
		  
		  if selectorSubpartTypes.Ubound > -1 then
		    for i as Integer = 0 to min(selectorSubpartTypes.Ubound,selectorParameterNames.Ubound)
		      result = result + ", " + selectorParameterNames(i) + " as " + declareStringForType(selectorSubpartTypes(i))
		    next
		  end if
		  
		  
		  result = result + ")"
		  
		  if returnType <> "void" then
		    result = result + " as " + declareStringForType(returnType)
		  end if
		  
		  Return result
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function getMethod() As RBMethod
		  if attemptConvertConstructors and InStr(selectorSubparts(0),"init")<>0 then
		    return constructorMethod
		  else
		    Return standardMethod
		  end if
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function standardMethod() As RBMethod
		  
		  
		  dim result as RBMethod
		  
		  dim name as String
		  for i as Integer = 0 to selectorSubparts.Ubound
		    name = name + capFirstLetter(selectorSubparts(i).ReplaceAll(":",""))
		  next
		  result = new RBMethod(name,if(isPrimitiveType(returnType),declareStringForType(returnType),returnType))
		  for i as Integer = 0 to  min(selectorSubpartTypes.Ubound,selectorParameterNames.Ubound)
		    result.addParameter selectorParameterNames(i) + " as " + if(isPrimitiveType(selectorSubpartTypes(i)), declareStringForType(selectorSubpartTypes(i)),selectorSubpartTypes(i))
		  next
		  
		  result.sourceLine = self.getDeclare
		  dim functionLine as String
		  if returnType<>"void" then
		    if isPrimitiveType(returnType) then
		      functionLine = "Return " + selectorSubparts(0).ReplaceAll(":","") + "_(self"
		    else
		      functionLine = "Return new " + returnType + "(" + selectorSubparts(0).ReplaceAll(":","") + "_(self"
		    end if
		  else
		    functionLine = selectorSubparts(0).ReplaceAll(":","") + "_(self"
		  end if
		  
		  for i as Integer = 0 to selectorParameterNames.Ubound
		    functionLine = functionLine + ", " + selectorParameterNames(i)
		  next
		  
		  functionLine = functionLine + ")"
		  if returnType<>"void" and (not isPrimitiveType(returnType)) then
		    functionLine = functionLine + ")" //match parenthesis for when creating a new object
		  end if
		  
		  if methodType = "+" then
		    result.IsShared = True
		    functionLine = functionLine.Replace("(self","(ClassRef")
		  end if
		  result.sourceLine = functionLine
		  
		  Return result
		  
		End Function
	#tag EndMethod


	#tag Property, Flags = &h0
		libConstantName As String
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
