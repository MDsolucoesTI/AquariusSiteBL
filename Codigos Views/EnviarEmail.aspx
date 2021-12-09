<!--
//////////////////////////////////////////////////////////////////////////
// Criacao...........: 04/2006
// Sistema...........: Site da Aquarius Maritime
// Analistas.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Desenvolvedores...: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Copyright.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////
-->

<%@ Page Language="C#" AutoEventWireup="true" CodeFile="EnviarEmail.aspx.cs" Inherits="EnviarEmail" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Envio de Mensagens</title>
    <link rel="stylesheet" HREF="Styles.css" TYPE="text/css">
<script language="javascript" type="text/javascript">
//<!--
function btnRetorno_onmousedown() {
  document.all.btnRetorno.src = "Imgsr/btnRetornoDown.jpg" 
}

function btnRetorno_onmouseup() {
  document.all.btnRetorno.src = "Imgsr/btnRetornoUP.jpg" 
}

// -->
</script>
</head>
<body runat="server" alink="white" vlink="white" link="white" id="WebMemResPt" style="background-color: #4079b8" >
  <form id="FormLists" runat="server">
    <div id="Div1" style="font-family: Arial; font-size: 12px; color: #000080; vertical-align: top; text-align: center" align="center">
      <asp:ScriptManager ID="ScriptManager1" runat="server">
      </asp:ScriptManager>
      <table cellpadding="0" cellspacing="0">
			  <tr>
          <td width="870px" height="763px">
            <table width="866px" height="763px" cellpadding="0" cellspacing="3">
              <tr>
                <td  background="Imgsr/Novo_Estilo_Menu.jpg" width="263px" height="763px" valign="top">
                  <table width="251px" height="481px" align="left" cellspacing="0" cellpadding="0">
                    <tr>
                      <td width="92px" height="44px"></td>
                      <td height="44px">
                        <asp:UpdateProgress ID="UpdateProgress1" runat="server" AssociatedUpdatePanelID="UpdatePanel1"
                          DisplayAfter="100">
                          <ProgressTemplate>
                            &nbsp;<asp:Image ID="ImageProg" runat="server" ImageUrl="Imgsr/loading_animation_liferay.gif" />
                            <br />
                            <asp:Label ID="lblProg" runat="server" Font-Bold="True" Style="left: 294px; top: 88px"
                              Text="Aguarde...." Width="69px"></asp:Label>
                          </ProgressTemplate>
                        </asp:UpdateProgress>
                      </td>
                    </tr>
                    <tr>
                      <td width="92px" height="379px"></td>
                      <td height="379px" align="center" valign="top">
                        <table>
                          <tr>
                            <td width="137px" height="34px" valign="middle">
                              <asp:HyperLink ID="linRetorno" runat="server">
                                <img id="btnRetorno" src="Imgsr/btnRetornoUP.jpg"
                                 language="javascript" 
                                 onmousedown="btnRetorno_onmousedown()" 
                                 onmouseup="btnRetorno_onmouseup()" />
                              </asp:HyperLink>
                            </td>
                          </tr>
                        </table>
                      </td>
                    </tr>
                    <tr>
                      <td width="92px" height="58px"></td>
                      <td height="58px" align="left" valign="top">
                        <p style="font-family: Arial; font-size: 14px; font-style: italic; color: #0099FF; font-weight: bold;">
                        <asp:Label runat="server" Text="Label" id="lblSaudacao"></asp:Label>
                        <br>
                        <br>
                        <asp:Label runat="server" Text="Label" id="lblNome"></asp:Label>
                        </p>
                      </td>
                    </tr>
                  </table>
                </td>
                <td width="600px" height="763px" valign="top" background="Imgsr/Novo_Estilo_Corpo.jpg">
                  <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>
                  <table width="586px" height="200px" cellpadding="0" cellspacing="0">
                    <tr>
                      <td width="10px" height="44px"></td>
                      <td width="565px" height="44px"></td>
                      <td height="44px"></td>
                    </tr>
                    <tr>
                      <td width="10px" style="height: 55px"></td>
                      <td width="565px" style="height: 55px" >
                      <table width="565px" height="55px" class="Cabe" cellspacing="0" cellpadding="0">
                       <tr>
                        <td width="50px" height="50px" align="center" valign="middle">
                          <img src="Imgsr/Usuarios.jpg" width="48px" height="48px" />
                        </td>
                        <td height="50px" style="font-family: Arial; font-size: 24px; font-weight: bold; color: #0066CC; width: 441px;" valign="middle" align="left">
                        Envio de Mensagens</td>
                        <td height="50px">&nbsp;</td>
                       </tr>
                      </table>
                      </td>
                      <td style="height: 55px"></td>
                    </tr>
                    <tr>
                      <td width="10px" height="50px"></td>
                      <td width="565px" height="50px" align=left>
	                      <asp:Table ID="TableMailSettings" runat="server" CssClass="Grid_General">
		                      <asp:TableRow>
			                      <asp:TableCell Width="80px" Text="Grupo:" />
			                      <asp:TableCell Width="485px">
				                      <asp:DropDownList runat="server" ID="drpGrupo" CssClass="TextBox" Width="350px" />
			                      </asp:TableCell>
                          </asp:TableRow>
		                      <asp:TableRow>
			                      <asp:TableCell Text="CC:" />
			                      <asp:TableCell>
				                      <asp:TextBox runat="server" Width="345px" ID="CC" CssClass="TextBox" />
			                      </asp:TableCell>
		                      </asp:TableRow>
		                      <asp:TableRow>
			                      <asp:TableCell Text="Formato:" />
			                      <asp:TableCell>
				                      <asp:DropDownList runat="server" ID="FormatDropDown" CssClass="TextBox" Width="350px" >
					                      <asp:ListItem Text="Texto" />
					                      <asp:ListItem Text="HTML" />
				                      </asp:DropDownList>
			                      </asp:TableCell>
		                      </asp:TableRow>
		                      <asp:TableRow>
			                      <asp:TableCell Text="Prioridade:" />
			                      <asp:TableCell>
				                      <asp:DropDownList runat="server" ID="PriorityDropDown" CssClass="TextBox" Width="350px" >
					                      <asp:ListItem Text="Normal" Selected="true" />
					                      <asp:ListItem Text="Baixa" />
					                      <asp:ListItem Text="Alta" />
				                      </asp:DropDownList>
			                      </asp:TableCell>
		                      </asp:TableRow>
		                      <asp:TableRow VerticalAlign="Top" Height="50px">
			                      <asp:TableCell Text="Assunto:" />
			                      <asp:TableCell>
				                      <asp:TextBox runat="server" Width="345px" ID="Subject" CssClass="TextBox" 
					                      Text='<%# Subject_Value %>'  />
				                      <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
						                    ControlToValidate="Subject"
						                    Display="dynamic"><br />* &eacute; requerido o assunto
				                      </asp:RequiredFieldValidator>
			                      </asp:TableCell>
		                      </asp:TableRow>
	                      </asp:Table>
		
	                      <asp:Table ID="TableMailBody" Width="565px" runat="server" CssClass="Grid_General">
		                      <asp:TableRow>
			                      <asp:TableCell Text="<br>" />
		                      </asp:TableRow>
		                      <asp:TableRow>
			                      <asp:TableCell Text="Body:" />
		                      </asp:TableRow>
		                      <asp:TableRow>
			                      <asp:TableCell HorizontalAlign="Center">
				                      <asp:TextBox runat="server" Rows="15" TextMode="MultiLine"
					                      Width="550px" ID="Body" CssClass="TextBox" Text='<%# Signature_Value %>' />
			                      </asp:TableCell>
		                      </asp:TableRow>
		                      <asp:TableRow>
			                      <asp:TableCell HorizontalAlign="Right">
				                      <asp:Button runat="server" Text="Enviar"
					                      ID="Send" CssClass="Button"
					                      OnClick="Send_Click" Width="100px" />
			                      </asp:TableCell>
		                      </asp:TableRow>
	                      </asp:Table>
	                      <asp:Label ID="MsgPreview" runat="Server" CssClass="Preview" Visible="false" />
	                    </td>
	                    <td height="50px"></td>
                    </tr>
                    <tr>
                      <td width="10px" height="50px">&nbsp;</td>
                      <td height="50px" style="width: 565px">
                      </td>
                      <td>&nbsp;</td>
                    </tr>
                  </table>
                    </ContentTemplate>
                  </asp:UpdatePanel>
                </td>
              </tr>
            </table>
          </td>
        </tr>
        <tr>
          <td width="880px">
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
      &nbsp; &nbsp;&nbsp;
    </div>
  </form>
</body>
</html>
