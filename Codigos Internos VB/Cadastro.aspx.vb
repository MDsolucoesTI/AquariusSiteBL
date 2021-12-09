'//////////////////////////////////////////////////////////////////////////
'// Criacao...........: 04/2006
'// Sistema...........: Site da Aquarius Maritime
'// Analistas.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
'// Desenvolvedores...: Marilene Esquiavoni & Denny Paulista Azevedo Filho
'// Copyright.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
'//////////////////////////////////////////////////////////////////////////

Partial Class Cadastro
  Inherits System.Web.UI.Page

  Protected Sub WebCadResPt_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles WebCadResPt.Load
    Dim strName As String
    Dim strType As String
    Dim strLib As String
    Dim intHour As Integer = Now.Hour

    strName = "Anonimo"
    strType = "vis"
    strLib = "loc"

    Try
      strName = Session("Name")
      strType = Session("Type")
      strLib = Session("Status")
    Catch objEx As Exception
      Response.Redirect("Erro.aspx")
    End Try

    If (strLib <> "free") Then
      Response.Redirect("Erro.aspx")
    End If

    If (intHour < 12) Then
      lblSaudacao.Text = "Bom Dia"
    ElseIf ((intHour >= 12) And (intHour < 18)) Then
      lblSaudacao.Text = "Boa Tarde"
    Else
      lblSaudacao.Text = "Boa Noite"
    End If
    lblNome.Text = strName
    If (strType = "vis") Then
      linUsuario.Enabled = False
      linCliente.Enabled = False
      linNavio.Enabled = False
      linPorto.Enabled = False
      linGrupo.Enabled = False
      linMenbros.Enabled = False
    ElseIf (strType = "cli") Then
      linUsuario.Enabled = False
      linCliente.Enabled = False
      linNavio.Enabled = False
      linPorto.Enabled = False
      linGrupo.Enabled = False
      linMenbros.Enabled = False
    ElseIf (strType = "ope") Then
      linUsuario.Enabled = True
      linCliente.Enabled = True
      linNavio.Enabled = True
      linPorto.Enabled = True
      linGrupo.Enabled = True
      linMenbros.Enabled = True
    ElseIf (strType = "adm") Then
      linUsuario.Enabled = True
      linCliente.Enabled = True
      linNavio.Enabled = True
      linPorto.Enabled = True
      linGrupo.Enabled = True
      linMenbros.Enabled = True
    End If

    If (Not Page.IsPostBack) Then
      Session("Page") = "Cadastro.aspx"
    End If

  End Sub

  Protected Sub btnMD_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnMD.Click
    Response.Redirect("https://md.dev.br")
  End Sub

  Protected Sub btnASPnet_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnASPnet.Click
    Response.Redirect("http://www.asp.net/")
  End Sub
End Class
