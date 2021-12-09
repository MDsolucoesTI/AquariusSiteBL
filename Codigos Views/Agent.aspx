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

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<script runat="server">

  Protected Sub btnVoltar_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs)
    Response.Redirect("InAgent.aspx")
  End Sub

</script>

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>AQUARIUS - Ag�ncia Mar�tima</title>
  <link href="StyleSheet.css" rel="stylesheet" type="text/css" />
</head>
<body bgcolor="#ffffff">
    <form id="form1" runat="server">
    <div>
      <asp:Label ID="Label1" runat="server" CssClass="header" Style="vertical-align: top;
        text-align: left" Text="Cadastro de Agentes" Width="800px"></asp:Label><br />
      <table>
        <tr>
          <td style="width: 666px">
            <table id="TABLE1" onclick="return TABLE1_onclick()" style="border-right: black thin solid;
              border-top: black thin solid; margin: 10px; border-left: black thin solid; border-bottom: black thin solid">
              <tr>
                <td align="left" style="width: 62px; height: 26px" valign="middle">
                  <asp:Label ID="Label2" runat="server" CssClass="normal" Text="ID:"></asp:Label></td>
                <td align="left" style="width: 124px; height: 26px" valign="middle">
                  <asp:TextBox ID="ID" runat="server" Columns="10" CssClass="entrada"></asp:TextBox><span
                    style="color: #ff0000">*</span></td>
                <td align="left" style="width: 482px; height: 26px" valign="middle">
                  <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="ID"
                    CssClass="alerta" ErrorMessage="You must enter a ID"></asp:RequiredFieldValidator></td>
              </tr>
              <tr>
                <td align="left" style="width: 62px; height: 26px" valign="middle">
                  <span style="color: #000000">
                    <asp:Label ID="Label3" runat="server" CssClass="normal" Text="Name:"></asp:Label></span></td>
                <td align="left" style="width: 124px; height: 26px" valign="middle">
                  <asp:TextBox ID="Name" runat="server" Columns="40" CssClass="entrada"></asp:TextBox><span
                    style="color: #ff0000">*</span></td>
                <td align="left" style="width: 482px; height: 26px" valign="middle">
                  <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="Name"
                    CssClass="alerta" ErrorMessage="You must enter a name"></asp:RequiredFieldValidator></td>
              </tr>
              <tr>
                <td align="left" style="width: 62px" valign="middle">
                  <asp:Label ID="Label5" runat="server" CssClass="normal" Text="Adress:"></asp:Label></td>
                <td align="left" style="width: 124px" valign="middle">
                  <asp:TextBox ID="Adress" runat="server" Columns="45" CssClass="entrada"></asp:TextBox><span
                    style="color: #ff0000">*</span></td>
                <td align="left" style="width: 482px" valign="middle">
                  <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ControlToValidate="Adress"
                    CssClass="alerta" ErrorMessage="You must enter a adress"></asp:RequiredFieldValidator></td>
              </tr>
              <tr>
                <td align="left" style="width: 62px" valign="middle">
                  <asp:Label ID="Label6" runat="server" CssClass="normal" Text="City:"></asp:Label></td>
                <td align="left" style="width: 124px" valign="middle">
                  <asp:TextBox ID="City" runat="server" Columns="30" CssClass="entrada"></asp:TextBox><span
                    style="color: #ff0000">*</span></td>
                <td align="left" style="width: 482px" valign="middle">
                  <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ControlToValidate="City"
                    CssClass="alerta" ErrorMessage="You must enter a city"></asp:RequiredFieldValidator></td>
              </tr>
              <tr>
                <td align="left" style="width: 62px" valign="middle">
                  <asp:Label ID="Label7" runat="server" CssClass="normal" Text="Country:"></asp:Label></td>
                <td align="left" style="width: 124px" valign="middle">
                  <asp:TextBox ID="Country" runat="server" Columns="30" CssClass="entrada"></asp:TextBox><span
                    style="color: #ff0000">*</span></td>
                <td align="left" style="width: 482px" valign="middle">
                  <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" ControlToValidate="Country"
                    CssClass="alerta" ErrorMessage="You must enter a country"></asp:RequiredFieldValidator></td>
              </tr>
              <tr>
                <td align="left" style="width: 62px" valign="middle">
                  <asp:Label ID="Label8" runat="server" CssClass="normal" Text="Tel:"></asp:Label></td>
                <td align="left" style="width: 124px" valign="middle">
                  <asp:TextBox ID="Tel" runat="server" Columns="20" CssClass="entrada"></asp:TextBox><span
                    style="color: #ff0000">*</span></td>
                <td align="left" style="width: 482px" valign="middle">
                  <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" ControlToValidate="Tel"
                    CssClass="alerta" ErrorMessage="You must enter a telephone"></asp:RequiredFieldValidator></td>
              </tr>
              <tr>
                <td align="left" style="width: 62px" valign="middle">
                  <asp:Label ID="Label9" runat="server" CssClass="normal" Text="Fax:"></asp:Label></td>
                <td align="left" style="width: 124px" valign="middle">
                  <asp:TextBox ID="Fax" runat="server" Columns="20" CssClass="entrada"></asp:TextBox></td>
                <td align="left" style="width: 482px" valign="middle">
                </td>
              </tr>
              <tr>
                <td align="left" style="width: 62px" valign="middle">
                  <asp:Label ID="Label10" runat="server" CssClass="normal" Text="E-Mail:"></asp:Label></td>
                <td align="left" style="width: 124px" valign="middle">
                  <asp:TextBox ID="EMail" runat="server" Columns="40" CssClass="entrada"></asp:TextBox><span
                    style="color: #ff0000">*</span></td>
                <td align="left" style="width: 482px" valign="middle">
                  <asp:RequiredFieldValidator ID="RequiredFieldValidator14" runat="server" ControlToValidate="EMail"
                    CssClass="alerta" ErrorMessage="You must enter a E-mail"></asp:RequiredFieldValidator></td>
              </tr>
              <tr>
                <td align="left" style="width: 62px" valign="middle">
                  <asp:Label ID="Label11" runat="server" CssClass="normal" Text="Contact:"></asp:Label></td>
                <td align="left" style="width: 124px" valign="middle">
                  <asp:TextBox ID="Contato" runat="server" Columns="30" CssClass="entrada"></asp:TextBox></td>
                <td align="left" style="width: 482px" valign="middle">
                </td>
              </tr>
              <tr>
                <td align="left" style="width: 62px" valign="middle">
                  <asp:Label ID="Label12" runat="server" CssClass="normal" Text="Tel:"></asp:Label></td>
                <td align="left" style="width: 124px" valign="middle">
                  <asp:TextBox ID="TelContato" runat="server" Columns="20" CssClass="entrada"></asp:TextBox></td>
                <td align="left" style="width: 482px" valign="middle">
                </td>
              </tr>
              <tr>
                <td align="left" style="width: 62px" valign="middle">
                  <asp:Label ID="Label13" runat="server" CssClass="normal" Text="Ramal:"></asp:Label></td>
                <td align="left" style="width: 124px" valign="middle">
                  <asp:TextBox ID="Ramal" runat="server" Columns="10" CssClass="entrada"></asp:TextBox></td>
                <td align="left" style="width: 482px" valign="middle">
                </td>
              </tr>
              <tr>
                <td align="left" style="width: 62px" valign="middle">
                  <asp:Label ID="Label14" runat="server" CssClass="normal" Text="E-Mail:"></asp:Label></td>
                <td align="left" style="width: 124px" valign="middle">
                  <asp:TextBox ID="EMailContato" runat="server" Columns="45" CssClass="entrada"></asp:TextBox></td>
                <td align="left" style="width: 482px" valign="middle">
                </td>
              </tr>
            </table>
            &nbsp;<span style="color: #ff0000">* <span style="color: #000000">Campos obrigat�rios</span></span>
          </td>
          <td style="width: 30px">
          </td>
          <td style="vertical-align: top; width: 51px; text-align: left">
            <table cellpadding="3" style="border-right: black thin solid; padding-right: 0px;
              border-top: black thin solid; padding-left: 0px; padding-bottom: 0px; margin: 5px;
              border-left: black thin solid; padding-top: 0px; border-bottom: black thin solid">
              <tr>
                <td style="width: 52px; height: 53px">
                  <asp:ImageButton ID="btnConfirma" runat="server" AlternateText="Gravar" BorderColor="Black"
                    BorderStyle="Solid" BorderWidth="1px" ImageUrl="Imgs/Gravar.png" /></td>
              </tr>
              <tr>
                <td style="width: 52px; height: 10px">
                </td>
              </tr>
              <tr>
                <td style="width: 52px; height: 56px">
                  <asp:ImageButton ID="btnLimpa" runat="server" AlternateText="N�o Gravar" BackColor="LightSlateGray"
                    BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" ForeColor="White" ImageUrl="Imgs/NaoGrava.png"
                    Style="left: 487px; top: 52px" /></td>
              </tr>
              <tr>
                <td style="width: 52px; height: 10px">
                </td>
              </tr>
              <tr>
                <td style="width: 52px; height: 56px">
                  <asp:ImageButton ID="btnVoltar" runat="server" AlternateText="Voltar" BorderStyle="Solid"
                    BorderWidth="1px" ImageUrl="Imgs/Voltar.png" OnClick="btnVoltar_Click" /></td>
              </tr>
            </table>
          </td>
        </tr>
      </table>
      <asp:Label ID="Msg" runat="server" CssClass="alerta"></asp:Label><br />
    
    </div>
    </form>
</body>
</html>
