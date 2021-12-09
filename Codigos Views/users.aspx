<!--
//////////////////////////////////////////////////////////////////////////
// Criacao...........: 04/2006
// Sistema...........: Site da Aquarius Maritime
// Analistas.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Desenvolvedores...: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Copyright.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////
-->

<%@ Page Language="C#" AutoEventWireup="true" CodeFile="users.aspx.cs" Inherits="users" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Cadastro Usu&aacute;rios</title>
    <link rel="stylesheet" HREF="Styles.css" TYPE="text/css">
<script language="javascript" type="text/javascript">
//<!--

function btnRetorno_onmousedown() {
  document.all.btnRetorno.src = "Imgsr/btnRetornoDown.jpg" 
}

function btnRetorno_onmouseup() {
  document.all.btnRetorno.src = "Imgsr/btnRetornoUP.jpg" 
}

function btnCanc_click(){
  document.all.vldNomeUser.IsValid = true;
  document.all.vldNomeLog.IsValid = true;
  document.all.vldSenha.IsValid = true;
}

// -->
</script>
</head>
<body runat="server" alink="white" vlink="white" link="white" id="WebUserResPt" style="background-color: #4079b8" >
  <form id="Form1" runat="server">
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
                            &nbsp;<asp:Image ID="Image1" runat="server" ImageUrl="Imgsr/loading_animation_liferay.gif" />
                            <br />
                            <asp:Label ID="Label6" runat="server" Font-Bold="True" Style="left: 294px; top: 88px"
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
                            <td width="137px" valign="middle" style="height: 34px">
                              <asp:HyperLink ID="linRetorno" NavigateUrl="Cadastro.aspx" runat="server">
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
                  &nbsp;<asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>
                  <table width="586px" height="200px" cellpadding="0" cellspacing="0">
                    <tr>
                      <td width="10px" style="height: 44px"></td>
                      <td width="565px" style="height: 44px"></td>
                      <td style="height: 44px"></td>
                    </tr>
                    <tr>
                      <td width="10px" style="height: 55px"></td>
                      <td width="565px" style="border-width: medium; border-style:none; border-color: #333399; height: 55px;">
                      <table width="565px" height="55px" class="Cabe" cellspacing="0" cellpadding="0">
                       <tr>
                        <td width="50px" height="50px" align="center" valign="middle">
                          <img src="Imgsr/Usuarios.jpg" width="48px" height="48px" />
                        </td>
                        <td width="441px" height="50px" style="font-family: Arial; font-size: 24px; font-weight: bold; color: #0066CC;" valign="middle" align="left">
                        Cadastro de Usu&aacute;rio</td>
                        <td height="50px">&nbsp;</td>
                       </tr>
                      </table>
                      </td>
                      <td style="height: 55px"></td>
                    </tr>
                    <tr>
                      <td width="10px" height="50px"></td>
                      <td width="565px" height="50px">
                        <Table ID="Table1" runat="server" Align="left" style="font-size:11px" CellSpacing="0">
 
                      	  <tr>
                            <td Align="left" Width="100px" Height="28px" valign="middle">
                              <asp:Label ID="Label16" runat="server" Text="Nome Usu&aacute;rio:"></asp:Label>
                            </td>
                            <td Align="left" Width="300px" Height="28px" valign="middle">
                              <asp:TextBox ID="txtNomeUser" runat="server" Columns="40" Enabled="false" CssClass="entrada"></asp:TextBox><span style="color: #ff0000">*</span>
                            </td>
                          </tr>
                      
                          <tr>
                            <td Align="left" Width="100px" Height="15px" VAlign="middle">
                            </td>                      
                            <td Align="left" Width="300px" Height="15px" VAlign="middle">
                              <asp:RequiredFieldValidator ID="vldNomeUser"
                               Enabled="false" runat="server"
                               Font-Size="10px" ForeColor="red" Font-Names="Arial"
                               ErrorMessage="Deve ser digitado o Nome" ControlToValidate="txtNomeUser"
                               CssClass="alerta"></asp:RequiredFieldValidator>
                            </td>
                          </tr> 
                      	  
                      	  <tr>
                            <td Align="left" Width="100px" Height="28px" valign="middle">
                              <asp:Label ID="Label2" runat="server" Text="Nome LogOn:"></asp:Label>
                            </td>
                            <td Align="left" Width="300px" Height="28px" valign="middle">
                              <asp:TextBox ID="txtNomeLog" runat="server" Columns="20" Enabled="false" CssClass="entrada">
                              </asp:TextBox><span style="color: #ff0000">*</span>
                            </td>
                          </tr>
                      
                          <tr>
                            <td Align="left" Width="100px" Height="15px" VAlign="middle">
                            </td>                      
                            <td Align="left" Width="300px" Height="15px" VAlign="middle">
                              <asp:RequiredFieldValidator ID="vldNomeLog"
                               Enabled="false" runat="server"
                               Font-Size="10px" ForeColor="red" Font-Names="Arial"
                               ErrorMessage="Deve ser digitado o Nome de Log On" ControlToValidate="txtNomeLog"
                               CssClass="alerta"></asp:RequiredFieldValidator>
                            </td>
                          </tr>
                      
                          <tr>
                            <td Align="left" Width="100px" Height="28px" VAlign="middle">
                              <asp:Label ID="Label3" runat="server" Text="Senha:"></asp:Label>
                            </td>
                            <td Align="left" Width="300px" Height="28px" VAlign="middle">
                              <asp:TextBox ID="txtSenha" runat="server" Enabled="false" Columns="20"
                               TextMode="Password" CssClass="entrada"></asp:TextBox><span style="color: #ff0000">*</span>
                            </td>
                          </tr>
                      
                          <tr>
                            <td Align="left" Width="100px" Height="15px" VAlign="middle">
                            </td>                      
                            <td Align="left" Width="300px" Height="15px" VAlign="middle">
                              <asp:RequiredFieldValidator ID="vldSenha" Enabled="false"
                               runat="server" Font-Size="10px" ForeColor="red" Font-Names="Arial"
                               ErrorMessage="Deve ser digitado a Senha" ControlToValidate="txtSenha"
                               CssClass="alerta"></asp:RequiredFieldValidator>
                            </td>
                          </tr>
                      
                          <tr>
                            <td Align="left" Width="100px" Height="28px" VAlign="middle">
                              <asp:Label ID="Label11" runat="server" Text="Data Registro:"></asp:Label>
                            </td>
                            <td Align="left" Width="300px" Height="28px" VAlign="middle">
                              <asp:TextBox ID="txtDtReg" runat="server" Enabled="false" Columns="10" CssClass="entrada"></asp:TextBox>
                            </td>
                          </tr>
                      
                          <tr>
                            <td Align="left" Width="100px" Height="15px" VAlign="middle">
                            </td>                      
                            <td Align="left" Width="300px" Height="15px" VAlign="middle">
                            </td>
                          </tr>
                      
                          <tr>
                            <td Align="left" Width="100px" Height="28px" VAlign="middle">
                              <asp:Label ID="Label8" runat="server" Text="Data Expirao:"></asp:Label>
                            </td>
                            <td Align="left" Width="300px" Height="28px" VAlign="middle">
                              <asp:TextBox ID="txtDtExp" runat="server" Enabled="false" Columns="10" CssClass="entrada"></asp:TextBox>
                            </td>
                          </tr>

                          <tr>
                            <td Align="left" Width="100px" Height="15px" VAlign="middle">
                            </td>
                            <td Align="left" Width="300px" Height="15px" VAlign="middle">
                            </td>
                          </tr>
                                            
                          <tr>
                            <td Align="left" Width="100px" Height="28px" VAlign="middle">
                              <asp:Label ID="Label1" runat="server" Text="Cliente:"></asp:Label>
                            </td>
                            <td Align="left" Width="300px" Height="28px" VAlign="middle">
                              <asp:DropDownList ID="drpCliente" runat="server" Enabled="false" ></asp:DropDownList>
                            </td>
                          </tr>
                      
                          <tr>
                            <td Align="left" Width="100px" Height="15px" VAlign="middle">
                            </td>
                            <td Align="left" Width="300px" Height="15px" VAlign="middle">
                            </td>
                          </tr>

                          <tr>
                            <td Align="left" Width="100px" Height="28px" VAlign="middle">
                              <asp:Label ID="Label4" runat="server" Text="Tipo:"></asp:Label>
                            </td>
                            <td Align="left" Width="300px" Height="28px" VAlign="middle">
                              <asp:DropDownList ID="drpTipo" runat="server" Enabled="false" ></asp:DropDownList>
                            </td>
                          </tr>
						
                        </Table>
                      </td>
                      <td height="50px"></td>
                    </tr>
                    <tr>
                      <td width="10px" height="50px">&nbsp;</td>
                      <td width="565px" height="50px">
                        <asp:ImageButton ID="btnAnterior" runat="server" ImageUrl="~/Imgsr/btnAnterior.jpg" OnClick="btnAnterior_Click" />
                        <asp:ImageButton ID="btnProximo" runat="server" ImageUrl="~/Imgsr/btnProximo.jpg" OnClick="btnProximo_Click" />
                        <asp:ImageButton ID="btnNovo" runat="server" ImageUrl="~/Imgsr/btnNovo.jpg" OnClick="btnNovo_Click" />
                        <asp:ImageButton ID="btnAlterar" runat="server" ImageUrl="~/Imgsr/btnAlterar.jpg" OnClick="btnAlterar_Click" />
                        <asp:ImageButton ID="btnGravar" runat="server" ImageUrl="~/Imgsr/btnGravar.jpg" OnClick="btnGravar_Click" Visible="False" />
                        <asp:ImageButton ID="btnCancelar" runat="server" ImageUrl="~/Imgsr/btnCancelar.jpg" OnClientClick="btnCanc_Click()" OnClick="btnCancelar_Click" Visible="False" />
                        <asp:ImageButton ID="btnApagar" runat="server" ImageUrl="~/Imgsr/btnApagar.jpg" OnClick="btnApagar_Click" />
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
    </div>
  </form>
</body>
</html>



