'//////////////////////////////////////////////////////////////////////////
'// Criacao...........: 04/2006
'// Sistema...........: Site da Aquarius Maritime
'// Analistas.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
'// Desenvolvedores...: Marilene Esquiavoni & Denny Paulista Azevedo Filho
'// Copyright.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
'//////////////////////////////////////////////////////////////////////////

Partial Class ErroDados
  Inherits System.Web.UI.Page

  Public strPage As String

  Protected Sub WebErroDadoPt_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles WebErroDadoPt.Load
    Dim strName As String
    Dim intHour As Integer = Now.Hour
    Dim sRetorno As String

    Try
      strName = Session("Name")
    Catch objEx As Exception
      strName = "Anonimo"
    End Try

    strPage = Session("Page")
    linRetorno.NavigateUrl = strPage

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
