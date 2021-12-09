<!--
//////////////////////////////////////////////////////////////////////////
// Criacao...........: 04/2006
// Sistema...........: Site da Aquarius Maritime
// Analistas.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Desenvolvedores...: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Copyright.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////
-->

<%@ Page Language="VB" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.SqlClient" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<script runat="server">
  Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs)

  End Sub

  Protected Sub btnNovo_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs)
    ID.Text = ""
    Name.Text = ""
    Contato.Text = ""
    Tel.Text = ""
    Cel.Text = ""
    Fax.Text = ""
    EMail.Text = ""
    Atividade.Text = ""
    Motivo.Text = ""
    Val1.Enabled = True
    Val2.Enabled = True
    Val3.Enabled = True
    Name.Focus()
  End Sub

  Protected Sub btnGravar_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs)
    Dim strCnx As String = "Data Source=200.234.197.30;Initial Catalog=aquariusmaritime;Persist Security Info=True;User ID=aquariusmaritime;Password=aquaweb2812"
    Dim strSql As String = "INSERT INTO Client (Conpany, Contact, Telephone, CelularPhone, FAX, EMail, Activity, Cause) VALUES (@Name, @Contato,@Tel, @Cel, @FAX, @EMail, @Atividade, @Motivo)"
    Dim prm As SqlParameter
    Dim cnx As SqlConnection = New SqlConnection(strCnx)
    
    cnx.Open()
    
    Dim scdScalar As SqlCommand = New SqlCommand(strSql, cnx)
        
    prm = New SqlParameter("@Name", SqlDbType.VarChar)
    prm.Direction = ParameterDirection.Input
    prm.Value = Name.Text
    scdScalar.Parameters.Add(prm)
    prm = New SqlParameter("@Contato", SqlDbType.VarChar)
    prm.Direction = ParameterDirection.Input
    prm.Value = Contato.Text
    scdScalar.Parameters.Add(prm)
    prm = New SqlParameter("@Tel", SqlDbType.VarChar)
    prm.Direction = ParameterDirection.Input
    prm.Value = Tel.Text
    scdScalar.Parameters.Add(prm)
    prm = New SqlParameter("@Cel", SqlDbType.VarChar)
    prm.Direction = ParameterDirection.Input
    prm.Value = Cel.Text
    scdScalar.Parameters.Add(prm)
    prm = New SqlParameter("@FAX", SqlDbType.VarChar)
    prm.Direction = ParameterDirection.Input
    prm.Value = Fax.Text
    scdScalar.Parameters.Add(prm)
    prm = New SqlParameter("@Email", SqlDbType.VarChar)
    prm.Direction = ParameterDirection.Input
    prm.Value = EMail.Text
    scdScalar.Parameters.Add(prm)
    prm = New SqlParameter("@Atividade", SqlDbType.VarChar)
    prm.Direction = ParameterDirection.Input
    prm.Value = Atividade.Text
    scdScalar.Parameters.Add(prm)
    prm = New SqlParameter("@Motivo", SqlDbType.VarChar)
    prm.Direction = ParameterDirection.Input
    prm.Value = Motivo.Text
    scdScalar.Parameters.Add(prm)
    
    scdScalar.ExecuteScalar()
    
    cnx.Close()
  End Sub

  Protected Sub btnVoltar_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs)
    Val1.Enabled = False
    Val2.Enabled = False
    Val3.Enabled = False
    ID.Text = ""
    Name.Text = ""
    Contato.Text = ""
    Tel.Text = ""
    Cel.Text = ""
    Fax.Text = ""
    EMail.Text = ""
    Atividade.Text = ""
    Motivo.Text = ""
  End Sub
</script>

<html xmlns="http://www.w3.org/1999/xhtml" lang="pt-br">
<head id="Head1" runat="server">
    <title>Aquarius Maritime</title>
</head>
<body style="background-color: #4079b8; position: static; padding-right: 0px; padding-left: 0px; padding-bottom: 0px; margin: 0px; overflow: auto; padding-top: 0px;">
  <form id="Empresa" runat="server">
  <div style="vertical-align: middle; text-align: center;">
  <table style="width: 823px" border="0" cellpadding="0" cellspacing="0">
      <tr>
        <td style="width: 34px; background-image: url(imgs/Barra_Lateral_E.jpg);"> <td>
        <td style="width: 755px">
          <table border="0" cellpadding="0" cellspacing="0">
            <tr>
              <td>
                <table border="0" cellpadding="0" cellspacing="0">
                  <tr>
                    <td><img src="imgs/Interno_Pan_1_1.jpg" /></td>
                    <td><img src="imgs/Interno_Pan_1_2.jpg" /></td>
                    <td><img src="imgs/Interno_Pan_1_3.jpg" /></td>
                    <td><img src="imgs/Interno_Pan_1_4.jpg" /></td>
                  </tr>
                  <tr>
                    <td><img src="imgs/Interno_Pan_2_1.jpg" /></td>
                    <td><img src="imgs/Interno_Pan_2_2.jpg" /></td>
                    <td><img src="imgs/Interno_Pan_2_3.jpg" /></td>
                    <td><img src="imgs/Interno_Pan_2_4.jpg" /></td>
                  </tr>
                </table>
              </td>
            </tr>
            <tr>
              <td>
                <table style="width: 755px; height: 34px; background-image: url(imgs/Barra_Branca_Int.jpg);" >
                  <tr>
                    <td width="50"> </td>
                    <td width="400" align="left"><B>�REA RESTRITA - Cadastro Clientes</B></td>
                    <td width="auto" align="right" >
                      <asp:Label ID="NomeLog" runat="server"></asp:Label>
                      <a href="Default.aspx" style="color: black">Sair</a>
                    </td>
                  </tr>
                </table>
              </td> 
            </tr>
            <tr>
              <td>
                <table border="0" cellpadding="0" cellspacing="0" style="width: 755px; background-color: #669999;">
                  <tr>
                    <td style="width: 35px"> <br /> </td>
                    <td>
                      <br />
                      <font style="font-size: 14px; color: white; font-family: Arial;" >
                      <table align="left" border="0" cellpadding="0" cellspacing="0">
                        <tr>
                          <td align="left" style="width: 62px; height: 28px" valign="middle">
                            <asp:Label ID="Label2" runat="server" Text="ID:"></asp:Label></td>
                          <td align="left" style="width: 124px; height: 28px" valign="middle">
                            <asp:TextBox ID="ID" ReadOnly="true" runat="server" Columns="10" CssClass="entrada"></asp:TextBox><span style="color: #ff0000">*</span></td>
                          <td align="left" style="width: 559px; height: 28px" valign="middle"> </td>
                        </tr>
                        <tr>
                          <td align="left" style="width: 62px; height: 28px;" valign="middle">
                            <asp:Label ID="Label3" runat="server" Text="Companhia:"></asp:Label></td>
                          <td align="left" style="width: 124px; height: 28px;" valign="middle">
                            <asp:TextBox ID="Name" runat="server" Columns="50" CssClass="entrada"></asp:TextBox><span style="color: #ff0000">*</span></td>
                          <td align="center" style="width: 559px; height: 28px;" valign="middle">
                            <asp:RequiredFieldValidator ID="Val1" Enabled="false" runat="server" ErrorMessage="Deve ser digitado o Nome" ControlToValidate="Name" CssClass="alerta"></asp:RequiredFieldValidator></td>
                        </tr>
                        <tr>
                          <td align="left" style="width: 62px; height: 28px;" valign="middle">
                            <asp:Label ID="Label11" runat="server" Text="Contact:"></asp:Label></td>
                          <td align="left" style="width: 124px; height: 28px;" valign="middle">
                            <asp:TextBox ID="Contato" runat="server" Columns="40" CssClass="entrada"></asp:TextBox></td>
                          <td align="left" style="width: 559px; height: 28px;" valign="middle"> </td>
                        </tr>
                        <tr>
                          <td align="left" style="width: 62px; height: 28px;" valign="middle">
                            <asp:Label ID="Label8" runat="server" Text="Telefone:"></asp:Label></td>
                          <td align="left" style="width: 124px; height: 28px;" valign="middle">
                            <asp:TextBox ID="Tel" runat="server" Columns="13" CssClass="entrada"></asp:TextBox><span style="color: #ff0000">*</span></td>
                          <td align="center" style="width: 559px; height: 28px;" valign="middle">
                            <asp:RequiredFieldValidator ID="Val2" Enabled="false" runat="server" ErrorMessage="Deve ser digitado o Telefone" ControlToValidate="Tel" CssClass="alerta"></asp:RequiredFieldValidator></td>
                        </tr>
                        <tr>
                          <td align="left" style="width: 62px; height: 28px" valign="middle">
                            <asp:Label ID="Label1" runat="server" Text="Celular:"></asp:Label></td>
                          <td align="left" style="width: 124px; height: 28px" valign="middle">
                            <asp:TextBox ID="Cel" runat="server" Columns="13" CssClass="entrada"></asp:TextBox></td>
                          <td align="left" style="width: 559px; height: 28px" valign="middle"> </td>
                        </tr>
                        <tr>
                          <td align="left" style="width: 62px; height: 28px" valign="middle">
                            <asp:Label ID="Label9" runat="server" Text="Fax:"></asp:Label></td>
                          <td align="left" style="width: 124px; height: 28px" valign="middle">
                            <asp:TextBox ID="Fax" runat="server" Columns="13" CssClass="entrada"></asp:TextBox></td>
                          <td align="left" style="width: 559px; height: 28px" valign="middle"> </td>
                        </tr>
                        <tr>
                          <td align="left" style="width: 62px; height: 28px" valign="middle">
                            <asp:Label ID="Label10" runat="server" Text="E-Mail:"></asp:Label></td>
                          <td align="left" style="width: 124px; height: 28px" valign="middle">
                            <asp:TextBox ID="EMail" runat="server" Columns="50" CssClass="entrada"></asp:TextBox><span style="color: #ff0000">*</span></td>
                          <td align="center" style="width: 559px; height: 28px" valign="middle">
                            <asp:RequiredFieldValidator ID="Val3" Enabled="false" runat="server" ErrorMessage="Deve ser digitado o E-mail" ControlToValidate="EMail" CssClass="alerta"></asp:RequiredFieldValidator></td>
                        </tr>
                        <tr>
                          <td align="left" style="width: 62px; height: 28px" valign="middle">
                            <asp:Label ID="Label14" runat="server" Text="Atividade:"></asp:Label></td>
                          <td align="left" style="width: 124px; height: 28px" valign="middle">
                            <asp:TextBox ID="Atividade" runat="server" Columns="30" CssClass="entrada"></asp:TextBox></td>
                          <td align="left" style="width: 559px; height: 28px" valign="middle"> </td>
                        </tr>
                        <tr>
                          <td align="left" style="width: 62px; height: 28px" valign="top">
                            <asp:Label ID="Label4" runat="server" Text="Motivo:"></asp:Label></td>
                          <td align="left" style="width: 124px; height: 52px" valign="top">
                            <asp:TextBox ID="Motivo" runat="server" Columns="50" TextMode="MultiLine" CssClass="entrada" Width="319px"></asp:TextBox></td>
                          <td align="left" style="width: 559px; height: 28px" valign="middle"> </td>
                        </tr>
                      </table>
                    </font>
                  </td>
                    <td style="width: 10%;"> 
                      <table cellpadding="0" style="padding-right: 0px; padding-left: 0px; padding-bottom: 0px; margin: 5px; padding-top: 0px; border-top-width: thin; border-left-width: thin; border-left-color: black; border-bottom-width: thin; border-bottom-color: black; border-top-color: black; border-right-width: thin; border-right-color: black;">
                        <tr>
                          <td style="width: 52px; height: 53px">
                            <asp:ImageButton ID="btnNovo" runat="server" AlternateText="Novo" BorderColor="Transparent" ImageUrl="~/imgs/Novo.gif" BackColor="Transparent" EnableTheming="True" ForeColor="Transparent" OnClick="btnNovo_Click" /></td>
                        </tr>
                        <tr>
                          <td style="width: 52px; height: 10px"></td>
                        </tr>
                        <tr>
                          <td style="width: 52px; height: 56px">
                            <asp:ImageButton ID="btnGravar" runat="server" AlternateText="Gravar" BackColor="Transparent"
                            BorderColor="Transparent" ForeColor="Transparent" ImageUrl="~/imgs/Gravar.gif"
                            Style="left: 487px; top: 52px" OnClick="btnGravar_Click" /></td>
                        </tr>
                        <tr>
                          <td style="width: 52px; height: 10px"></td>
                        </tr>
                        <tr>
                          <td style="width: 52px; height: 56px">
                            <asp:ImageButton ID="btnLimpa" runat="server" AlternateText="Limpa" ImageUrl="~/imgs/NaoGrava.gif" OnClick="btnVoltar_Click" BackColor="Transparent" BorderColor="Transparent" ForeColor="Transparent" /></td>
                        </tr>
                      </table>
                      <br />
                    </td>
                  </tr> 
                  <tr>
                    <td style="width: 35px; height: 19px"> </td>
                    <td style="height: 19px" align="left">
                      &nbsp;<span style="color: #ff0000">* <span style="color: #000000">Campos obrigat�rios</span></span>
                    </td>
                    <td style="height: 19px"> </td>
                  </tr>
                </table> 
              </td>
            </tr>
            <tr>
              <td style="width: 753px">
                <table style="background-image: url(imgs/Barra_Atalho.jpg); background-position: center center; width: 755px; height: 40px;">
                  <tr>
                    <td style="width: 90px; vertical-align: middle; text-align: center;">
                      <a href=Servico.aspx style="font-weight: bold; font-size: 13px; color: white; font-family: Arial; text-decoration: none">Usu�rios</a>
                    </td>                    
                    <td style="width: 90px; vertical-align: middle; text-align: center;">
                      <a href="Client.aspx" style="font-weight: bold; font-size: 13px; color: white; font-family: Arial; text-decoration: none">Clientes</a>
                    </td>                    
                    <td style="width: 90px; vertical-align: middle; text-align: center;">
                      <a href="Vessel.aspx" style="font-weight: bold; font-size: 13px; color: white; font-family: Arial; text-decoration: none">Navios</a>
                    </td>
                    <td style="width: 90px; vertical-align: middle; text-align: center;">
                    </td>
                    <td style="width: 90px; vertical-align: middle; text-align: center;">
                    </td>
                    <td style="width: 90px; vertical-align: middle; text-align: center;">
                    </td>
                    <td style="width:auto"> </td>
                  </tr>
                </table>
              </td>
            </tr>
            <tr>
              <td style="width: 755px; height: 40px;">
                <table width="100%" cellspacing="0" cellpadding="0">
                  <tr>
                    <td align="right" height="55px">
                      <asp:ImageButton runat="server" id="btnMD" ImageUrl="Imgsr/LogoMD.png" AlternateText="MD - Solu&ccedil;&otilde;es em TI" OnClick="btnMD_Click" />
                    </td>
                    <td style="width: 300px; font-size: 12px; color: white; font-family: Arial;text-align: left;" valign="middle">
                      <a href="mailto:contato@md.dev.br" style="color: white">
                        Marilene Esquiavoni & Denny Azevedo
                      </a>
                    </td>
                    <td width="392px">
                    <label id="Label1" style="font-family: Arial; font-size: 12px; color: #FFFFFF; font-weight: bold">Copywright ® - 2006</label></td>
                    <td align="left">
                      <asp:ImageButton runat="server" id="btnASPnet" AlternateText="Powered by ASP.net 2.0" ImageUrl="Imgsr/pow_by_aspnet2.0a.gif" OnClick="btnASPnet_Click" />
                    </td>
                  </tr>
                </table>
              </td>
            </tr>
          </table>
        </td>
        <td style="width: 34px; background-image: url(imgs/Barra_Lateral.jpg);"> </td>
      </tr>
    </table>
    </div>
  </form>
</body>
</html>
