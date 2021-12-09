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

  Protected Sub btnVessel_Click(ByVal sender As Object, ByVal e As System.EventArgs)

  End Sub
</script>

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Untitled Page</title>
</head>
<body bgcolor="darkgray">
    <form id="form1" runat="server">
    <div>
      &nbsp;<asp:Image ID="Image1" runat="server" ImageUrl="Imgs/Topo.jpg" style="left: -12px; position: relative; top: -16px" />&nbsp;<br />
      <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="Vessel.aspx" Style="left: -2px;
        position: relative; top: -18px" Target="mainFrame">Vessel</asp:HyperLink>
      <asp:HyperLink ID="HyperLink2" runat="server" Style="left: 18px; position: relative;
        top: -17px" Target="mainFrame" NavigateUrl="IniPerson.aspx">Person</asp:HyperLink>
      <asp:HyperLink ID="HyperLink3" runat="server" Style="left: 35px; position: relative;
        top: -17px" Target="mainFrame" NavigateUrl="InAgent.aspx">Agent</asp:HyperLink>
      <asp:HyperLink ID="HyperLink4" runat="server" Style="left: 51px; position: relative;
        top: -17px" Target="mainFrame">User</asp:HyperLink></div>
    </form>
</body>
</html>
