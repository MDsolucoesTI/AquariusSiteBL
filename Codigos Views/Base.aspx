<!--
//////////////////////////////////////////////////////////////////////////
// Criacao...........: 04/2006
// Sistema...........: Site da Aquarius Maritime
// Analistas.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Desenvolvedores...: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Copyright.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////
-->

<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Base.aspx.vb" Inherits="Base" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>Area Restrita</title>
<script language="javascript" type="text/javascript">
//<!--

function btnLineUp_onmousedown() {
  document.all.btnLineUp.src = "Imgsr/btnLineUpDown.jpg"
}

function btnLineUp_onmouseup() {
  document.all.btnLineUp.src = "Imgsr/btnLineUpUp.jpg"
}

function btnDocumento_onmousedown() {
  document.all.btnDocumento.src = "Imgsr/btnDocumentoDown.jpg"
}

function btnDocumento_onmouseup() {
  document.all.btnDocumento.src = "Imgsr/btnDocumentoUp.jpg"
}

function btnMensagem_onmousedown() {
  document.all.btnMensagem.src = "Imgsr/btnMensagemDown.jpg" 
}

function btnMensagem_onmouseup() {
  document.all.btnMensagem.src = "Imgsr/btnMensagemUp.jpg" 
}

function btnCadastro_onmousedown() {
  document.all.btnCadastro.src = "Imgsr/btnCadastroDown.jpg"  
}

function btnCadastro_onmouseup() {
  document.all.btnCadastro.src = "Imgsr/btnCadastroUp.jpg"
}

function btnViagem_onmousedown() {
  document.all.btnViagem.src = "Imgsr/btnViagemDown.jpg"
}

function btnViagem_onmouseup() {
  document.all.btnViagem.src = "Imgsr/btnViagemUp.jpg"
}

// -->
</script>
</head>
<body runat="server" alink="white" vlink="white" link="white" id="WebPriResPt" style="background-color: #4079b8" >
  <form id="frmPrincipal" runat="server">
    <div id="Princ" style="font-family: Arial; font-size: 12px; color: #000080; vertical-align: top; text-align: center" align="center">
      <table cellpadding="0" cellspacing="0">
			  <tr>
          <td width="870px" height="763px">
            <table width="866px" height="763px" cellpadding="0" cellspacing="3">
              <tr>
                <td  background="Imgsr/Novo_Estilo_Menu.jpg" width="263px" height="763px" valign="top">
                  <table width="251px" height="481px" align="left" cellspacing="0" cellpadding="0">
                    <tr>
                      <td width="92px" height="44px"></td>
                      <td height="44px"></td>
                    </tr>
                    <tr>
                      <td width="92px" height="379px"></td>
                      <td height="379px" align="center" valign="top">
                        <table>
                          <tr>
                            <td width="137px" height="34px" valign="middle">
                              <asp:HyperLink ID="linLineUp" NavigateUrl="Restrito.aspx" runat="server" EnableViewState="False">
                                <img id="btnLineUp" src="Imgsr/btnLineUpUp.jpg"
                                 language="javascript"
                                 onmousedown="btnLineUp_onmousedown()"
                                 onmouseup="btnLineUp_onmouseup()" />
                              </asp:HyperLink> 
                            </td>
                          </tr>
                          <tr>
                            <td width="137px" height="34px" valign="middle">
                              <asp:HyperLink ID="linDocumento" NavigateUrl="Restrito.aspx" runat="server" Enabled="false">
                                <img id="btnDocumento" src="Imgsr/btnDocumentoUp.jpg" 
                                 language="javascript"
                                 onmousedown="btnDocumento_onmousedown()"
                                 onmouseup="btnDocumento_onmouseup()" />
                              </asp:HyperLink>
                            </td>
                          </tr>
                          <tr>
                            <td width="137px" height="34px" valign="middle">
                              <asp:HyperLink ID="linMensagem" NavigateUrl="Restrito.aspx" runat="server" Enabled="false">
                                <img id="btnMensagem" src="Imgsr/btnmensagemUp.jpg"
                                 language="javascript" 
                                 onmousedown="btnMensagem_onmousedown()" 
                                 onmouseup="btnMensagem_onmouseup()" />
                              </asp:HyperLink>
                            </td>
                          </tr>
                          <tr>
                            <td width="137px" height="34px" valign="middle">
                              <asp:HyperLink ID="linCadastro" NavigateUrl="Restrito.aspx" runat="server" Enabled="false">
                                <img id="btnCadastro" src="Imgsr/btnCadastroUp.jpg"
                                 language="javascript" 
                                 onmousedown="btnCadastro_onmousedown()" 
                                 onmouseup="btnCadastro_onmouseup()" />
                              </asp:HyperLink>
                            </td>
                          </tr>
                          <tr>
                            <td width="137px" height="34px" valign="middle">
                              <asp:HyperLink ID="linViagem" NavigateUrl="Restrito.aspx" runat="server" Enabled="false">
                                <img id="btnViagem" src="Imgsr/btnViagemUp.jpg"
                                 language="javascript" 
                                 onmousedown="btnViagem_onmousedown()" 
                                 onmouseup="btnViagem_onmouseup()" />
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
                  <table width="586px" height="200px" cellpadding="0" cellspacing="0">
                    <tr>
                      <td width="10px" height="44px"></td>
                      <td width="565px" height="44px"></td>
                      <td height="44px"></td>
                    </tr>
                    <tr>
                      <td width="10px" height="55px"></td>
                      <td width="565px" height="55px" style="border-width: medium; border-style: solid none solid none; border-color: #333399">
                      <table width="565px" height="55px" cellspacing="0" cellpadding="0">
                       <tr>
                        <td width="50px" height="50px" align="center" valign="middle">
                          <img src="Imgsr/padlock.gif" width="48px" height="48px" />
                        </td>
                        <td width="441px" height="50px" style="font-family: Arial; font-size: 24px; font-weight: bold; color: #0066CC;" valign="middle" align="left">
                        rea Restrita</td>
                        <td height="50px">&nbsp;</td>
                       </tr>
                      </table>
                      </td>
                      <td height="55px"></td>
                    </tr>
                    <tr>
                      <td width="10px" height="50px"></td>
                      <td width="565px" height="50px"></td>
                      <td height="50px"></td>
                    </tr>
                    <tr>
                      <td width="10px" height="50px">&nbsp;</td>
                      <td width="565px" height="50px">&nbsp;</td>
                      <td>&nbsp;</td>
                    </tr>
                  </table>
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

