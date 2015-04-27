#tag Class
Protected Class RBWindow
	#tag Method, Flags = &h0
		Sub Constructor(name as string)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function operator_convert() As string
		  '<?xml version="1.0"?>
		  '<RBProject version="5.5.2">
		  '<block type="Window" ID="-1113465159">
		  '<ObjName>Window1</ObjName>
		  '<ObjContainerID>0</ObjContainerID>
		  '<EditBounds><Rect left="95" top="75" width="545" height="405"/></EditBounds>
		  '<EditSplit>-1000</EditSplit>
		  '<BrowserPositionGroup>
		  '<BrowserPositionElement>
		  '<ScreenKey>207001442</ScreenKey>
		  '<EditBounds><Rect left="95" top="75" width="545" height="405"/></EditBounds>
		  '<EditSplit>-1000</EditSplit>
		  '</BrowserPositionElement>
		  '</BrowserPositionGroup>
		  '<LastPositionH>151</LastPositionH>
		  '<LastPositionV>134</LastPositionV>
		  '<PropertyVal Name="Name">Window1</PropertyVal>
		  '<PropertyVal Name="Frame">0</PropertyVal>
		  '<PropertyVal Name="Composite">False</PropertyVal>
		  '<PropertyVal Name="HasBackColor">False</PropertyVal>
		  '<PropertyVal Name="BackColor">16777215</PropertyVal>
		  '<PropertyVal Name="Backdrop">0</PropertyVal>
		  '<PropertyVal Name="Title">Untitled</PropertyVal>
		  '<PropertyVal Name="Visible">True</PropertyVal>
		  '<PropertyVal Name="FullScreen">False</PropertyVal>
		  '<PropertyVal Name="MenuBarVisible">True</PropertyVal>
		  '<PropertyVal Name="CloseBox">True</PropertyVal>
		  '<PropertyVal Name="GrowIcon">False</PropertyVal>
		  '<PropertyVal Name="LiveResize">False</PropertyVal>
		  '<PropertyVal Name="ZoomIcon">False</PropertyVal>
		  '<PropertyVal Name="BalloonHelp"></PropertyVal>
		  '<PropertyVal Name="MacProcID">0</PropertyVal>
		  '<PropertyVal Name="MenuBar">-1113465160</PropertyVal>
		  '<PropertyVal Name="Placement">0</PropertyVal>
		  '<PropertyVal Name="Width">300</PropertyVal>
		  '<PropertyVal Name="Height">300</PropertyVal>
		  '<PropertyVal Name="MinWidth">64</PropertyVal>
		  '<PropertyVal Name="MinHeight">64</PropertyVal>
		  '<PropertyVal Name="MaxWidth">32000</PropertyVal>
		  '<PropertyVal Name="MaxHeight">32000</PropertyVal>
		  '<FormDefn>
		  '<ObjName>Window1</ObjName>
		  '<ObjSize>24</ObjSize>
		  '<Superclass>Window</Superclass>
		  '<IsInterface>0</IsInterface>
		  '</FormDefn>
		  '</block>
		  '</RBProject>
		  
		End Function
	#tag EndMethod


	#tag Property, Flags = &h1
		Protected myName As string
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
