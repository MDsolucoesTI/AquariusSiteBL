'//////////////////////////////////////////////////////////////////////////
'// Criacao...........: 04/2006
'// Sistema...........: Site da Aquarius Maritime
'// Analistas.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
'// Desenvolvedores...: Marilene Esquiavoni & Denny Paulista Azevedo Filho
'// Copyright.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
'//////////////////////////////////////////////////////////////////////////

Imports System.Data
Imports System.Data.SqlClient
Partial Class Vessel
    Inherits System.Web.UI.Page
  Protected Sub btnGravar_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnGravar.Click
    'Dim strCnx As String = "Data Source=COMPDEN\SQLEXPRESS;Initial Catalog=aquariusmaritime;Integrated Security=True"
    Dim strCnx As String = "Data Source=200.234.197.30;Initial Catalog=aquariusmaritime;Persist Security Info=True;User ID=aquariusmaritime;Password=aquaweb2812"
    Dim strSql As String = "INSERT INTO Vessel (VesselID, Name, exName, DWT, GRT, LOA, Beam, TLX, TEL, FAX, EMail) VALUES (@Vess, @Nome, @exNome, @DWT, @GRT, @LOA, @Beam, @TLX, @Tel, @Fax, @EMail)"
    Dim prm As SqlParameter
    Dim cnx As SqlConnection = New SqlConnection(strCnx)

    cnx.Open()

    Dim scdScalar As SqlCommand = New SqlCommand(strSql, cnx)

    prm = New SqlParameter("@Vess", SqlDbType.Int)
    prm.Direction = ParameterDirection.Input
    prm.Value = AscW(edtCodCli.Text)
    scdScalar.Parameters.Add(prm)
    prm = New SqlParameter("@Nome", SqlDbType.VarChar)
    prm.Direction = ParameterDirection.Input
    prm.Value = edtNomeCli.Text
    scdScalar.Parameters.Add(prm)
    prm = New SqlParameter("@exNome", SqlDbType.VarChar)
    prm.Direction = ParameterDirection.Input
    prm.Value = edtContato.Text
    scdScalar.Parameters.Add(prm)
    prm = New SqlParameter("@Tel", SqlDbType.VarChar)
    prm.Direction = ParameterDirection.Input
    prm.Value = edtTel.Text
    scdScalar.Parameters.Add(prm)
    prm = New SqlParameter("@Fax", SqlDbType.VarChar)
    prm.Direction = ParameterDirection.Input
    prm.Value = edtFax.Text
    scdScalar.Parameters.Add(prm)
    prm = New SqlParameter("@EMail", SqlDbType.VarChar)
    prm.Direction = ParameterDirection.Input
    prm.Value = edtEmail.Text
    scdScalar.Parameters.Add(prm)
    prm = New SqlParameter("@DWT", SqlDbType.VarChar)
    prm.Direction = ParameterDirection.Input
    prm.Value = edtDWT.Text
    scdScalar.Parameters.Add(prm)
    prm = New SqlParameter("@GRT", SqlDbType.VarChar)
    prm.Direction = ParameterDirection.Input
    prm.Value = edtGRT.Text
    scdScalar.Parameters.Add(prm)
    prm = New SqlParameter("@LOA", SqlDbType.VarChar)
    prm.Direction = ParameterDirection.Input
    prm.Value = edtLOA.Text
    scdScalar.Parameters.Add(prm)
    prm = New SqlParameter("@Beam", SqlDbType.VarChar)
    prm.Direction = ParameterDirection.Input
    prm.Value = edtBeam.Text
    scdScalar.Parameters.Add(prm)
    prm = New SqlParameter("@TLX", SqlDbType.VarChar)
    prm.Direction = ParameterDirection.Input
    prm.Value = edtTLX.Text
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
    edtFax.Enabled = False
    edtEmail.Enabled = False
    edtDWT.Enabled = False
    edtGRT.Enabled = False
    edtLOA.Enabled = False
    edtBeam.Enabled = False
    edtTLX.Enabled = False
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
    edtFax.Enabled = True
    edtEmail.Enabled = True
    edtDWT.Enabled = True
    edtGRT.Enabled = True
    edtLOA.Enabled = True
    edtBeam.Enabled = True
    edtTLX.Enabled = True
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
    edtFax.Text = ""
    edtEmail.Text = ""
    edtDWT.Text = ""
    edtGRT.Text = ""
    edtLOA.Text = ""
    edtBeam.Text = ""
    edtTLX.Text = ""
    edtCodCli.Focus()

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
    edtFax.Enabled = False
    edtEmail.Enabled = False
    edtDWT.Enabled = False
    edtGRT.Enabled = False
    edtLOA.Enabled = False
    edtBeam.Enabled = False
    edtTLX.Enabled = False
    btnGravar.Enabled = False
    btnCancelar.Enabled = False
    btnVoltar.Enabled = True
    btnNovo.Enabled = True
  End Sub

End Class
