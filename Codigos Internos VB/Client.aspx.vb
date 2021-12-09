'//////////////////////////////////////////////////////////////////////////
'// Criacao...........: 04/2006
'// Sistema...........: Site da Aquarius Maritime
'// Analistas.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
'// Desenvolvedores...: Marilene Esquiavoni & Denny Paulista Azevedo Filho
'// Copyright.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
'//////////////////////////////////////////////////////////////////////////

Imports System.Data
Imports System.Data.SqlClient
Partial Class Client
  Inherits System.Web.UI.Page
	
  Protected Sub btnGravar_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnGravar.Click
    'Dim strCnx As String = "Data Source=COMPDEN\SQLEXPRESS;Initial Catalog=aquariusmaritime;Integrated Security=True"
    Dim strCnx As String = "Data Source=200.234.197.30;Initial Catalog=aquariusmaritime;Persist Security Info=True;User ID=aquariusmaritime;Password=aquaweb2812"
    Dim strSql As String = "INSERT INTO Client (Company, Contact, Telephone, CelularPhone, Fax, EMail, Activity, Cause) VALUES (@Nome, @Contato, @Tel, @Cel, @Fax, @EMail, @Ativi, @Raz)"
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
    prm.Value = edtContato.Text
    scdScalar.Parameters.Add(prm)
    prm = New SqlParameter("@Tel", SqlDbType.VarChar)
    prm.Direction = ParameterDirection.Input
    prm.Value = edtTel.Text
    scdScalar.Parameters.Add(prm)
    prm = New SqlParameter("@Cel", SqlDbType.VarChar)
    prm.Direction = ParameterDirection.Input
    prm.Value = edtCel.Text
    scdScalar.Parameters.Add(prm)
    prm = New SqlParameter("@Fax", SqlDbType.VarChar)
    prm.Direction = ParameterDirection.Input
    prm.Value = edtFax.Text
    scdScalar.Parameters.Add(prm)
    prm = New SqlParameter("@EMail", SqlDbType.VarChar)
    prm.Direction = ParameterDirection.Input
    prm.Value = edtEmail.Text
    scdScalar.Parameters.Add(prm)
    prm = New SqlParameter("@Ativi", SqlDbType.VarChar)
    prm.Direction = ParameterDirection.Input
    prm.Value = edtAtivi.Text
    scdScalar.Parameters.Add(prm)
    prm = New SqlParameter("@Raz", SqlDbType.VarChar)
    prm.Direction = ParameterDirection.Input
    prm.Value = edtRaza.Text
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
    edtCel.Enabled = False
    edtFax.Enabled = False
    edtEmail.Enabled = False
    edtAtivi.Enabled = False
    edtRaza.Enabled = False
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
    edtCel.Enabled = True
    edtFax.Enabled = True
    edtEmail.Enabled = True
    edtAtivi.Enabled = True
    edtRaza.Enabled = True
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
    edtCel.Text = ""
    edtFax.Text = ""
    edtEmail.Text = ""
    edtAtivi.Text = ""
    edtRaza.Text = ""
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
    edtCel.Enabled = False
    edtFax.Enabled = False
    edtEmail.Enabled = False
    edtAtivi.Enabled = False
    edtRaza.Enabled = False
    btnGravar.Enabled = False
    btnCancelar.Enabled = False
    btnVoltar.Enabled = True
    btnNovo.Enabled = True
  End Sub

End Class
