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
      <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="Bill.aspx" Style="left: -2px;
        position: relative; top: -18px" Target="mainFrame">Bill of Landing</asp:HyperLink>
      &nbsp;
    </div>
    </form>
</body>
</html>
