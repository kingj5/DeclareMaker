#tag Class
Protected Class OBJCProperty
	#tag Method, Flags = &h0
		Sub Constructor(libName as String, propType as String, propName as String, readOnly as Boolean, specialGetter as String)
		  self.libConstantName = libName
		  self.propertyType = propType
		  self.propertyName = propName
		  self.readOnly = readOnly
		  self.specialGetter = specialGetter
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function getComputedProperty() As RBComputedProperty
		  dim result as RBComputedProperty
		  result = new RBComputedProperty(self.propertyName, if(isPrimitiveType(self.propertyType), declareStringForType(self.propertyType),self.propertyType))
		  
		  dim getMethod as RBMethod
		  getMethod = new RBMethod(self.propertyName, self.propertyType)
		  
		  getMethod.sourceLine = getGetter
		  if isPrimitiveType(self.propertyType) then
		    getMethod.sourceLine = "Return " + self.propertyName + "_(self)"
		  else
		    getMethod.sourceLine = "Return new " + propertyType + "(" + propertyName + "_(self))"
		  end if
		  result.getMethod = getMethod
		  
		  if not readOnly then
		    dim setMethod as RBMethod
		    setMethod = new RBMethod(self.propertyName, self.propertyType)
		    setMethod.sourceLine = getSetter
		    setMethod.sourceLine = propertyName + "_(self, value)"
		    
		    result.setMethod = setMethod
		  end if
		  
		  Return result
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function getGetter() As String
		  dim result as String = "declare function " + propertyName + "_ lib " + libConstantName + " selector "
		  result = result + """" 
		  
		  result = result + if(specialGetter <> "",specialGetter,propertyName)
		  
		  result = result + """" + " (obj_id as ptr) as "
		  result = result + declareStringForType(propertyType)
		  
		  Return result
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function getSetter() As String
		  if readOnly then Return ""
		  
		  dim result as String = "declare sub " + propertyName + "_ lib " + libConstantName + " selector "
		  result = result + """set" + capFirstLetter(propertyName) + ":""" + " (obj_id as ptr, "
		  result = result + propertyName + " as " + declareStringForType(propertyType) + ")"
		  
		  Return result
		End Function
	#tag EndMethod


	#tag Property, Flags = &h0
		libConstantName As String
	#tag EndProperty

	#tag Property, Flags = &h0
		propertyName As String
	#tag EndProperty

	#tag Property, Flags = &h0
		propertyType As String
	#tag EndProperty

	#tag Property, Flags = &h0
		readOnly As Boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		specialGetter As String
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
			Name="Name"
			Visible=true
			Group="ID"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="propertyName"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="propertyType"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="readOnly"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="specialGetter"
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
