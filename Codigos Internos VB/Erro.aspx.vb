'//////////////////////////////////////////////////////////////////////////
'// Criacao...........: 04/2006
'// Sistema...........: Site da Aquarius Maritime
'// Analistas.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
'// Desenvolvedores...: Marilene Esquiavoni & Denny Paulista Azevedo Filho
'// Copyright.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
'//////////////////////////////////////////////////////////////////////////

Partial Class Erro
  Inherits System.Web.UI.Page

  Protected Sub WebErroAcePt_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles WebErroAcePt.Load
    Dim strName As String
    Dim strType As String
    Dim strLib As String
    Dim sRetorno As String
    Dim intHour As Integer = Now.Hour

    Try
      strName = Session("Name")
      strType = Session("Type")
      strLib = Session("Status")
    Catch objEx As Exception
      strName = "Anonimo"
      strType = "vis"
      strLib = "loc"
    End Try

    If (intHour < 12) Then
      lblSaudacao.Text = "Bom Dia"
    ElseIf ((intHour >= 12) And (intHour < 18)) Then
      lblSaudacao.Text = "Boa Tarde"
    Else
      lblSaudacao.Text = "Boa Noite"
    End If
    lblNome.Text = strName
    If (Not Page.IsPostBack) Then
      sRetorno = Session("Page")
      linRetorno.NavigateUrl = sRetorno
    End If
  End Sub

  Protected Sub btnMD_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnMD.Click
    Response.Redirect("https://md.dev.br")
  End Sub

  Protected Sub btnASPnet_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnASPnet.Click
    Response.Redirect("http://www.asp.net/")
  End Sub
End Class
