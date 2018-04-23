Imports Microsoft.VisualBasic
Imports System
Imports System.Data
Imports System.Configuration
Imports System.Web
Imports System.Web.Security
Imports System.Web.UI
Imports System.Web.UI.WebControls
Imports System.Web.UI.WebControls.WebParts
Imports System.Web.UI.HtmlControls

Public Partial Class _Default
	Inherits System.Web.UI.Page
	Protected Function GetPreviewText(ByVal fieldText As Object, ByVal previewLength As Integer) As String
		Dim text As String = fieldText.ToString()
		If previewLength > text.Length Then
		previewLength = text.Length
		End If
		Return text.Substring(0, previewLength) & "..."
	End Function

	Public Function GetClientInstanceName(ByVal index As Integer) As String
		Return "pc" & index.ToString()
	End Function
	Public Function GetClickHandler(ByVal index As Integer) As String
		Return "function(s, e){ pc" & index.ToString() & ".ShowAtElement(e.htmlElement); }"
	End Function

	Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs)

	End Sub
End Class
