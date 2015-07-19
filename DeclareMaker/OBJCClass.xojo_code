#tag Class
Protected Class OBJCClass
	#tag Method, Flags = &h0
		Sub Constructor(f as FolderItem)
		  dim tis as TextInputStream = TextInputStream.Open(f)
		  dim allText as String= tis.ReadAll.ToText
		  tis.Close
		  
		  allText = allText.ReplaceAll("&nbsp;","")
		  
		  dim tmp() as String = allText.Split("<title>")
		  tmp = tmp(1).Split(" ")
		  clsName = tmp(0)
		  
		  'superCls = getSuperclass(allText)
		  
		  tmp = allText.Split("<code class=""code-voice Objective-C"">")
		  tmp = tmp(1).Split("</code>")
		  tmp = tmp(0).Split("</span>")
		  tmp.Remove tmp.Ubound
		  tmp = tmp(tmp.Ubound).Split(">")
		  dim libName as String = tmp(1).Replace(";","") + "Lib"
		  
		  dim chunks() as String= allText.Split("<h4>Declaration</h4>")
		  chunks.Remove 0 //first chunk is unimportant data about the class itself
		  for i as Integer = 0 to chunks.Ubound
		    process(chunks(i), libName)
		  Next
		  
		  addRequiredConstant(libName)
		  
		  
		  
		  
		  
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub exportDeclares()
		  dim f as FolderItem = GetSaveFolderItem("public/text","untitled2.txt")
		  dim tos as TextOutputStream = TextOutputStream.Create(f)
		  for i as Integer = 0 to sels.Ubound
		    tos.WriteLine sels(i).getDeclare
		    tos.WriteLine
		  next
		  for i as Integer = 0 to props.Ubound
		    tos.WriteLine props(i).getSetter
		    tos.WriteLine props(i).getGetter
		    tos.WriteLine
		  next
		  tos.Close
		End Sub
	#tag EndMethod

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

	#tag Method, Flags = &h0
		Function getDelegateClass() As RBClass
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function getSuperclass(txt as String) As String
		  dim tmp() as String
		  dim inherit() as String = txt.Split("<div class=""inheritance"">")
		  inherit.Remove 0
		  
		  inherit = inherit(0).Split("<ul class=""Objective-C"">")
		  
		  inherit = inherit(0).Split("</div>")
		  
		  'dim temp as String =  ' + EndOfLine + clsName + EndOfLine + " </code></li>"
		  
		  tmp = inherit(0).Split("<code class=""code-voice"">")
		  dim idx as Integer
		  for i as Integer = 0 to tmp.Ubound
		    if InStr(tmp(i),clsName) <> 0 then
		      idx = i-1
		      exit
		    end if
		  next
		  
		  'Break
		  
		  tmp = tmp(idx).Split("</a>")
		  
		  tmp = tmp(0).Split(">")
		  
		  dim result as String = tmp(1)
		  
		  'tmp = Join(tmp,"").Split("<li class=""depth")
		  
		  'dim idx as Integer
		  'dim supclsfnd as String = SuperClassFinder
		  'supclsfnd = supclsfnd.Replace("FILLER",clsName)
		  'for i as Integer = 0 to tmp.Ubound
		  'if InStr(tmp(i), supclsfnd) <> 0 then
		  'idx = i - 1
		  'exit
		  'end if
		  'next
		  
		  'MsgBox tmp(idx)
		  
		  //only works if the class has a subclass
		  'dim num as String = tmp(1).Trim.Left(1)
		  '
		  'tmp = Join(inherit,"").Split("<li class=""depth" + str(num.Val-2) + """>")
		  '
		  'tmp.Remove 0
		  'tmp = tmp(0).Split("</code>")
		  '
		  'dim superURL as String = removeA(Join(tmp,""))
		  '
		  'tmp = txt.Split(superURL)
		  'tmp.Remove 0
		  '
		  'tmp = tmp(0).Split("<")
		  'dim result as String = tmp(0).Replace(">","")
		  
		  'Break
		  
		  Return result
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function isConstant(txt as string) As Boolean
		  Return InStr(txt,"<h4>Constants</h4>") <> 0
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function isDeprecated(txt as String) As Boolean
		  Return InStr(txt,"Deprecated in") <> 0
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function isEnum(txt as String) As Boolean
		  Return InStr(txt,"typedef") <> 0
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function isProperty(txt as String) As Boolean
		  Return InStr(txt,"<span class=""k"">@property</span>") <> 0
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub process(txt as String, libName as String)
		  '"<code class=""code voice"">
		  '
		  '
		  '"<span class=""kt"">" //return type span in html
		  '
		  '"nl" //selector sub part
		  '
		  '"n" //type of parameter in each sub part
		  '
		  '
		  dim lastStr as String
		  
		  dim chunks() as String= txt.Split( "<div class=""Objective-C"">" )
		  chunks.Remove 0 //text before objective c - ie hard to parse swift
		  
		  dim tmpStr as String = Join(chunks,"")
		  if isDeprecated(tmpStr) then Return
		  
		  if not isProperty(chunks(0)) then
		    if isEnum(chunks(0)) or isConstant(chunks(0)) then
		      'Break
		      Return
		    end if
		    //parse as a method
		    
		    //collect leading symbol (+/-) for class/intance method
		    dim tmp() as String = tmpStr.Split("<code class=""code-voice"">")
		    dim methodType as String = tmp(1).Left(1)
		    
		    //get return type
		    dim returnType as String
		    
		    tmp = tmpStr.Split("<span class=""kt"">")
		    tmp.Remove 0 //leading chars, not important info
		    tmp = Join(tmp,"").Split("</span>")
		    returnType = removeA(tmp(0).Trim).Replace(" *","")
		    
		    //get selector subparts
		    dim selSubparts() as string
		    
		    dim tmp2() as String
		    tmp = tmpStr.Split("<span class=""nl"">")
		    tmp.Remove 0 //leading chars, not important info
		    for i as Integer = 0 to tmp.Ubound
		      tmp2 = tmp(i).Split("</span>")
		      lastStr = removeA(tmp2(0).Trim)
		      if selSubparts.IndexOf(lastStr) = -1 then
		        selSubparts.Append lastStr
		      end
		    next
		    
		    //get selector parameter types
		    dim selSubpartTypes() as String
		    
		    tmp = tmpStr.Split("<span class=""n"">")
		    tmp.Remove 0 //leading chars, not important info
		    for i as Integer = 0 to tmp.Ubound
		      tmp2 = tmp(i).Split("</span>")
		      selSubpartTypes.Append Clean(removeA(tmp2(0).Trim)).Replace(" *","")
		    next
		    
		    //get selector parameter names
		    dim selSubpartNames() as String
		    tmp = tmpStr.Split("<em class=""parameter-name"">")
		    tmp.Remove 0 //leading chars not important info
		    for i as Integer = 0 to tmp.Ubound
		      tmp2 = tmp(i).Split("</em>")
		      lastStr = removeBR(removeA(tmp2(0).Trim))
		      if selSubpartNames.IndexOf(lastStr) = -1 then
		        selSubpartNames.Append lastStr
		      end if
		    next
		    
		    using DeclareMaker
		    sels.Append new OBJCSelector(libName, methodType, returnType, selSubparts, selSubpartTypes, selSubpartNames)
		    
		  else
		    //parse as a property
		    
		    //property type
		    dim propertyType as String
		    dim tmp() as String = tmpStr.Split("<span class=""p"">)</span>") 'tmpStr.Split("<span class=""kt"">")
		    tmp.Remove 0 //leading chars, not important info
		    tmp = Join(tmp,"").Split("</span>")
		    if tmp.Ubound = -1 then Break
		    propertyType = Clean(removeSpan(removeA(tmp(0).Trim)))
		    
		    //property name
		    dim propertyName as String
		    tmp = tmpStr.Split("<span class=""n"">")
		    dim tmp2() as String = tmp(tmp.Ubound).Split("</span>")
		    if tmp.Ubound = -1 then Break
		    propertyName = tmp2(0)
		    
		    using DeclareMaker
		    props.Append new OBJCProperty(libName, propertyType, propertyName, readOnly(tmpStr), specialGetter(tmpStr))
		    
		  end if
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function readOnly(txt as String) As Boolean
		  dim attribute(), tmp(), tmp2() as String
		  
		  tmp = txt.Split("<span class=""n"">")
		  tmp.Remove 0 //leading chars, not important info
		  for i as Integer = 0 to tmp.Ubound
		    tmp2 = tmp(i).Split("</span>")
		    attribute.Append removeA(tmp2(0).Trim)
		  next
		  
		  dim attributeString as String = Join(attribute,"")
		  Return instr(attributeString,"readonly") <> 0
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function removeA(txt as String) As String
		  if InStr(txt, "</a>") > 0 then
		    dim tmp2() as String = txt.Split("</a>")
		    dim tmp3() as String = tmp2(0).Split(">")
		    txt = tmp3(1)
		  elseif InStr(txt, "<!-- /a -->") > 0 then
		    dim tmp2() as String = txt.Split("<!-- /a -->")
		    dim tmp3() as String = tmp2(0).Split(">")
		    txt = tmp3(1)
		  end if
		  Return txt
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function removeBR(txt as string) As String
		  txt = txt.Replace("<br>","")
		  Return txt
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function removeSpan(txt as String) As String
		  if InStr(txt,"<span") <> 0 then
		    dim tmp() as String = txt.Split(">")
		    txt = tmp(tmp.Ubound)
		  end if
		  Return txt
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function specialGetter(txt as String) As String
		  dim attribute(), tmp(), tmp2() as String
		  
		  tmp = txt.Split("<span class=""n"">")
		  tmp.Remove 0 //leading chars, not important info
		  for i as Integer = 0 to tmp.Ubound
		    tmp2 = tmp(i).Split("</span>")
		    attribute.Append removeA(tmp2(0).Trim)
		  next
		  
		  dim attributeString as String = Join(attribute,"")
		  if InStr(attributeString,"getter") <> 0 then
		    dim idxGetter as Integer = attribute.IndexOf("getter")
		    Return attribute(idxGetter+1)
		  else
		    Return ""
		  end
		End Function
	#tag EndMethod


	#tag Property, Flags = &h0
		clsName As String
	#tag EndProperty

	#tag Property, Flags = &h0
		props() As DeclareMaker.OBJCProperty
	#tag EndProperty

	#tag Property, Flags = &h0
		sels() As DeclareMaker.OBJCSelector
	#tag EndProperty

	#tag Property, Flags = &h0
		superCls As String
	#tag EndProperty


	#tag Constant, Name = SuperClassFinder, Type = String, Dynamic = False, Default = \"<code class\x3D\"code-voice\">\n      FILLER\n  </code>", Scope = Public
	#tag EndConstant


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
