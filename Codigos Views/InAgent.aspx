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
<%@ Import Namespace = "System.Data" %>
<%@ Import Namespace = "System.Data.SqlClient"   %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<script runat="server">

  Function DoCont()
    Dim strCnx As String = "Server=COMPDEN\SQLEXPRESS;uid=user;pwd=abrir;DataBase=aquarius;"
    Dim strSQL As String = "SELECT COUNT(*) FROM Person WHERE ID = "
    Dim iCount As Integer
    Dim cnx As SqlConnection = New SqlConnection(strCnx)
    
    cnx.Open()
    
    Dim scdScalar As SqlCommand = New SqlCommand(strSQL, cnx)
    
    iCount = scdScalar.ExecuteScalar()
    
    cnx.Close()
    
    Return (iCount)
        
  End Function
  
  Protected Sub Procura_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs)
    Dim iVer As Integer
    
    'iVer = DoCont()
    If IDPessoa.Text = "1" Then
      iVer = 1
    Else
      iVer = 0
    End If
    
    If iVer <> 1 Then
      Msg.Text = "ID informada n�o Encontrada"
    Else
      Response.Redirect("AgeManu.aspx")
    End If
    
  End Sub

  Protected Sub btnNovo_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs)
    Response.Redirect("Agent.aspx")
  End Sub
</script>

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Untitled Page</title>
  <link href="StyleSheet.css" rel="stylesheet" type="text/css" />
</head>
<body bgcolor="#ffffff" class="body">
    <form id="form1" runat="server">
    <div>
      <asp:Label ID="Label2" runat="server" CssClass="header" Text="Localizar Agentes" Width="800px"></asp:Label>
      <br />
      <table>
        <tr>
          <td style="width: 245px; vertical-align: top; height: 89px; text-align: left;">
      <table style="border-right: #000000 thin solid; border-top: #000000 thin solid; margin: 10px; border-left: #000000 thin solid; border-bottom: #000000 thin solid;">
        <tr>
          <td style="width: 32px">
            <asp:Label ID="Label1" runat="server" CssClass="normal" Text="ID:"></asp:Label></td>
          <td style="width: 171px">
      <asp:TextBox ID="IDPessoa" runat="server" Columns="10" CssClass="entrada" Font-Bold="False"></asp:TextBox></td>
        </tr>
      </table>
          </td>
          <td style="width: 12px; height: 89px;">
          </td>
          <td style="width: 77px; height: 89px;">
            <table cellpadding="3" style="border-right: black thin solid; padding-right: 0px;
              border-top: black thin solid; padding-left: 0px; padding-bottom: 0px; margin: 5px;
              border-left: black thin solid; padding-top: 0px; border-bottom: black thin solid">
              <tr>
                <td style="width: 52px; height: 53px">
            <asp:ImageButton ID="btnNovo" runat="server" AlternateText="New" BorderColor="Black"
              BorderStyle="Solid" BorderWidth="1px" ImageUrl="Imgs/Novo.png" OnClick="btnNovo_Click" /></td>
              </tr>
              <tr>
                <td style="width: 52px; height: 3px">
                </td>
              </tr>
              <tr>
                <td style="width: 52px">
      <asp:ImageButton ID="btnProcura" runat="server" AlternateText="Search" BackColor="LightSlateGray"
        ForeColor="White" ImageUrl="Imgs/Lupa48.png" style="left: 487px; top: 52px" BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" OnClick="Procura_Click" /></td>
              </tr>
            </table>
          </td>
        </tr>
      </table>
    </div>
      <asp:Label ID="Msg" runat="server" Font-Bold="True" ForeColor="Red" CssClass="alerta"></asp:Label>
    </form>
</body>
</html>
