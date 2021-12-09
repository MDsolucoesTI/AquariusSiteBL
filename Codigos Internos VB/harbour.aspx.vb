'//////////////////////////////////////////////////////////////////////////
'// Criacao...........: 04/2006
'// Sistema...........: Site da Aquarius Maritime
'// Analistas.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
'// Desenvolvedores...: Marilene Esquiavoni & Denny Paulista Azevedo Filho
'// Copyright.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
'//////////////////////////////////////////////////////////////////////////

Imports System.Data
Imports System.Data.SqlClient
Partial Class harbour
  Inherits System.Web.UI.Page
  Protected Sub btnGravar_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnGravar.Click
    'Dim strCnx As String = "Data Source=COMPDEN\SQLEXPRESS;Initial Catalog=aquariusmaritime;Integrated Security=True"
    Dim strCnx As String = "Data Source=200.234.197.30;Initial Catalog=aquariusmaritime;Persist Security Info=True;User ID=aquariusmaritime;Password=aquaweb2812"
    Dim strSql As String = "INSERT INTO Harbour (Name, NumPier, City) VALUES (@Nome, @Contato, @Tel)"
    Dim prm As SqlParameter
    Dim cnx As SqlConnection = New SqlConnection(strCnx)

    cnx.Open()

    Dim scdScalar As SqlCommand = New SqlCommand(strSql, cnx)

    prm = New SqlParameter("@Nome", SqlDbType.VarChar)
    prm.Direction = ParameterDirection.Input
    prm.Value = edtNomeCli.Text
    scdScalar.Parameters.Add(prm)
    prm = New SqlParameter("@Contato", SqlDbType.VarChar)
    prm.Direction = ParameterDirection.Input
    prm.Value = AscW(edtContato.Text)
    scdScalar.Parameters.Add(prm)
    prm = New SqlParameter("@Tel", SqlDbType.VarChar)
    prm.Direction = ParameterDirection.Input
    prm.Value = edtTel.Text
    scdScalar.Parameters.Add(prm)

    scdScalar.ExecuteScalar()

    cnx.Close()

    Validator1.Enabled = False
    Validator2.Enabled = False
    Validator1.IsValid = True
    Validator2.IsValid = True
    edtCodCli.Enabled = False
    edtNomeCli.Enabled = False
    edtContato.Enabled = False
    edtTel.Enabled = False
    btnGravar.Enabled = False
    btnCancelar.Enabled = False
    btnVoltar.Enabled = True
    btnNovo.Enabled = True

  End Sub

  Protected Sub btnNovo_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnNovo.Click
    edtCodCli.Enabled = True
    edtNomeCli.Enabled = True
    edtContato.Enabled = True
    edtTel.Enabled = True
    btnGravar.Enabled = True
    btnCancelar.Enabled = True
    btnNovo.Enabled = False
    btnVoltar.Enabled = False
    'Validator1.Enabled = True
    'Validator2.Enabled = True
    edtCodCli.Text = ""
    edtNomeCli.Text = ""
    edtContato.Text = ""
    edtTel.Text = ""
    edtNomeCli.Focus()

  End Sub

  Protected Sub btnCancelar_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnCancelar.Click
    Validator1.Enabled = False
    Validator2.Enabled = False
    Validator1.IsValid = True
    Validator2.IsValid = True
    edtCodCli.Enabled = False
    edtNomeCli.Enabled = False
    edtContato.Enabled = False
    edtTel.Enabled = False
    btnGravar.Enabled = False
    btnCancelar.Enabled = False
    btnVoltar.Enabled = True
    btnNovo.Enabled = True
  End Sub

End Class
