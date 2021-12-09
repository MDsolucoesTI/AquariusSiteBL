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

Protected Sub TextBox1_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs)

End Sub
</script>

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Untitled Page</title>
</head>
<body bgcolor="#33ccff">
    <form id="form1" runat="server">
    <div>
      <div style="text-align: left">
        <table>
          <tr>
            <td align="left" style="width: 100px; height: 26px" valign="middle">
              Vessel�s ID</td>
            <td align="left" style="width: 306px; height: 26px" valign="middle">
              <asp:TextBox ID="VesselID" runat="server" Columns="10"></asp:TextBox><span style="color: #ff0000">*</span></td>
            <td align="left" style="width: 233px; height: 26px" valign="middle">
              <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ErrorMessage="You must enter a Vessel�s ID" ControlToValidate="VesselID"></asp:RequiredFieldValidator></td>
          </tr>
          <tr>
            <td align="left" style="width: 100px; height: 26px;" valign="middle">
              Vessel�s Name:</td>
            <td align="left" style="width: 306px; height: 26px;" valign="middle">
              <asp:TextBox ID="Name" runat="server" OnTextChanged="TextBox1_TextChanged" Wrap="False" Columns="30"></asp:TextBox><span
                style="color: #ff0000">*</span></td>
            <td align="left" style="width: 233px; height: 26px;" valign="middle">
              <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="Name"
                ErrorMessage="You must enter a Vessel Name"></asp:RequiredFieldValidator></td>
          </tr>
          <tr>
            <td align="left" style="width: 100px; height: 26px;" valign="middle">
              Ex-Name:</td>
            <td align="left" style="width: 306px; height: 26px;" valign="middle">
              <asp:TextBox ID="exName" runat="server" Wrap="False" Columns="30"></asp:TextBox></td>
            <td align="left" style="width: 233px; height: 26px;" valign="middle">
            </td>
          </tr>
          <tr>
            <td align="left" style="width: 100px; height: 26px;" valign="middle">
              Type of Vessel:</td>
            <td align="left" style="width: 306px; height: 26px;" valign="middle">
              <asp:DropDownList ID="Type" runat="server">
                <asp:ListItem Selected="True">M General Cargo</asp:ListItem>
                <asp:ListItem>M Container Ship</asp:ListItem>
              </asp:DropDownList></td>
            <td align="left" style="width: 233px; height: 26px;" valign="middle">
            </td>
          </tr>
          <tr>
            <td align="left" style="width: 100px; height: 26px;" valign="middle">
              Flag</td>
            <td align="left" style="width: 306px; height: 26px;" valign="middle">
              <asp:TextBox ID="Flag" runat="server" Wrap="False" Columns="25"></asp:TextBox><span
                style="color: #ff0000">*</span></td>
            <td align="left" style="width: 233px; height: 26px;" valign="middle">
              <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="You must enter a Flag" ControlToValidate="Flag"></asp:RequiredFieldValidator></td>
          </tr>
          <tr>
            <td align="left" style="width: 100px" valign="middle">
              DWT:</td>
            <td align="left" style="width: 306px" valign="middle">
              <asp:TextBox ID="DWT" runat="server" Wrap="False" Columns="20"></asp:TextBox></td>
            <td align="left" style="width: 233px" valign="middle">
            </td>
          </tr>
          <tr>
            <td align="left" style="width: 100px" valign="middle">
              GRT:</td>
            <td align="left" style="width: 306px" valign="middle">
              <asp:TextBox ID="GRT" runat="server" Wrap="False" Columns="20"></asp:TextBox></td>
            <td align="left" style="width: 233px" valign="middle">
            </td>
          </tr>
          <tr>
            <td align="left" style="width: 100px" valign="middle">
              NRT:</td>
            <td align="left" style="width: 306px" valign="middle">
              <asp:TextBox ID="NRT" runat="server" Wrap="False" Columns="20"></asp:TextBox></td>
            <td align="left" style="width: 233px" valign="middle">
            </td>
          </tr>
          <tr>
            <td align="left" style="width: 100px" valign="middle">
              LOA:</td>
            <td align="left" style="width: 306px" valign="middle">
              <asp:TextBox ID="LOA" runat="server" Wrap="False" Columns="20"></asp:TextBox></td>
            <td align="left" style="width: 233px" valign="middle">
            </td>
          </tr>
          <tr>
            <td align="left" style="width: 100px" valign="middle">
              BEAM:</td>
            <td align="left" style="width: 306px" valign="middle">
              <asp:TextBox ID="BEAM" runat="server" Wrap="False" Columns="20"></asp:TextBox></td>
            <td align="left" style="width: 233px" valign="middle">
            </td>
          </tr>
          <tr>
            <td align="left" style="width: 100px" valign="middle">
              TLX:</td>
            <td align="left" style="width: 306px" valign="middle">
              <asp:TextBox ID="TLX" runat="server" Wrap="False" Columns="20"></asp:TextBox><span
                style="color: #ff0000">*</span></td>
            <td align="left" style="width: 233px" valign="middle">
              <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="You must enter a telex number" ControlToValidate="TLX"></asp:RequiredFieldValidator></td>
          </tr>
          <tr>
            <td align="left" style="width: 100px" valign="middle">
              TEL:</td>
            <td align="left" style="width: 306px" valign="middle">
              <asp:TextBox ID="TEL" runat="server" Wrap="False" Columns="20"></asp:TextBox><span
                style="color: #ff0000">*</span></td>
            <td align="left" style="width: 233px" valign="middle">
              <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="You must enter a telephone number" ControlToValidate="TEL"></asp:RequiredFieldValidator></td>
          </tr>
          <tr>
            <td align="left" style="width: 100px; height: 26px;" valign="middle">
              FAX:</td>
            <td align="left" style="width: 306px; height: 26px;" valign="middle">
              <asp:TextBox ID="FAX" runat="server" Wrap="False" Columns="20"></asp:TextBox><span
                style="color: #ff0000">*</span></td>
            <td align="left" style="width: 233px; height: 26px;" valign="middle">
              <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="You must enter a fax number" ControlToValidate="FAX"></asp:RequiredFieldValidator></td>
          </tr>
          <tr>
            <td align="left" style="width: 100px" valign="middle">
              E-Mail:</td>
            <td align="left" style="width: 306px" valign="middle">
              <asp:TextBox ID="EMail" runat="server" Wrap="False" Columns="45"></asp:TextBox><span
                style="color: #ff0000">*</span></td>
            <td align="left" style="width: 233px" valign="middle">
              <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="You must enter a E-Mail" ControlToValidate="EMail"></asp:RequiredFieldValidator></td>
          </tr>
          <tr>
            <td align="left" style="width: 100px; height: 26px;" valign="middle">
              Owners:</td>
            <td align="left" style="width: 306px; height: 26px;" valign="middle">
              <asp:TextBox ID="Owners" runat="server" Wrap="False" Columns="30"></asp:TextBox><span
                style="color: #ff0000">*</span></td>
            <td align="left" style="width: 233px; height: 26px;" valign="middle">
              <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="You must enter a owners name" ControlToValidate="Owners"></asp:RequiredFieldValidator></td>
          </tr>
        </table>
      </div>
      &nbsp;<span style="color: #ff0000">* <span style="color: #000000">Campos obrigat�rios
        &nbsp;
      </span></span></div>
    </form>
</body>
</html>
