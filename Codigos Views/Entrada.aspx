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

</script>

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Untitled Page</title>
</head>
<body bgcolor="#0099cc">
    <form id="form1" runat="server">
    <div>
      <asp:LoginView ID="LoginView1" runat="server">
        <AnonymousTemplate>
          You are not log In
        </AnonymousTemplate>
      </asp:LoginView>
    
    </div>
      <asp:LoginStatus ID="LoginStatus1" runat="server" LoginText="login" LogoutText="logout" />
    </form>
</body>
</html>
