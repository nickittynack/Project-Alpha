<!--#INCLUDE FILE="clsUpload.asp"-->
<%
Dim objUpload
Dim strFileName
Dim strPath

' Instantiate Upload Class
Set objUpload = New clsUpload

' Grab the file name
'strFileName = objUpload.Fields("File1").FilePath

strFileName = Request.Cookies("policeeditcrimid") & ".jpg"

' Compile path to save file to
strPath = Server.MapPath("Uploads") & "\" & strFileName

' Save the binary data to the file system
objUpload("File1").SaveAs strPath

' Release upload object from memory
Set objUpload = Nothing

Response.redirect("policeeditcriminal.asp")
%>

