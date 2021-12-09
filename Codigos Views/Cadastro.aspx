<!--
//////////////////////////////////////////////////////////////////////////
// Criacao...........: 04/2006
// Sistema...........: Site da Aquarius Maritime
// Analistas.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Desenvolvedores...: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Copyright.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////
-->

<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Cadastro.aspx.vb" Inherits="Cadastro" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Cadastros</title>
    <link rel="stylesheet" HREF="Styles.css" TYPE="text/css">
<script language="javascript" type="text/javascript">
//<!--

function btnUsuario_onmousedown() {
  document.all.btnUsuario.src = "Imgsr/btnUsuarioDown.jpg"
}

function btnUsuario_onmouseup() {
  document.all.btnUsuario.src = "Imgsr/btnUsuarioUp.jpg"
}

function btnCliente_onmousedown() {
  document.all.btnCliente.src = "Imgsr/btnClienteDown.jpg" 
}

function btnCliente_onmouseup() {
  document.all.btnCliente.src = "Imgsr/btnClienteUp.jpg" 
}

function btnNavio_onmousedown() {
  document.all.btnNavio.src = "Imgsr/btnNavioDown.jpg" 
}

function btnNavio_onmouseup() {
  document.all.btnNavio.src = "Imgsr/btnNavioUp.jpg" 
}

function btnPorto_onmousedown() {
  document.all.btnPorto.src = "Imgsr/btnPortoDown.jpg"  
}

function btnPorto_onmouseup() {
  document.all.btnPorto.src = "Imgsr/btnPortoUp.jpg"
}

function btnGrupo_onmousedown() {
  document.all.btnGrupo.src = "Imgsr/btnGruposDown.jpg"
}

function btnGrupo_onmouseup() {
  document.all.btnGrupo.src = "Imgsr/btnGruposUp.jpg"
}

function btnMenbros_onmousedown() {
  document.all.btnMenbros.src = "Imgsr/btnMembrosDown.jpg"
}

function btnMenbros_onmouseup() {
  document.all.btnMenbros.src = "Imgsr/btnMembrosUp.jpg"
}

function btnRetorno_onmousedown() {
  document.all.btnRetorno.src = "Imgsr/btnRetornoDown.jpg" 
}

function btnRetorno_onmouseup() {
  document.all.btnRetorno.src = "Imgsr/btnRetornoUP.jpg" 
}

// -->
</script>
</head>
<body runat="server" alink="white" vlink="white" link="white" id="WebCadResPt" style="background-color: #4079b8" >
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
                              <asp:HyperLink ID="linUsuario" NavigateUrl="users.aspx" runat="server">
                                <img id="btnUsuario" src="Imgsr/btnUsuarioUp.jpg"
                                 language="javascript"
                                 onmousedown="btnUsuario_onmousedown()"
                                 onmouseup="btnUsuario_onmouseup()" />
                              </asp:HyperLink> 
                            </td>
                          </tr>
                          <tr>
                            <td width="137px" height="34px" valign="middle">
                              <asp:HyperLink ID="linCliente" NavigateUrl="Cliente.aspx" runat="server">
                                <img id="btnCliente" src="Imgsr/btnClienteUp.jpg" 
                                 language="javascript"
                                 onmousedown="btnCliente_onmousedown()"
                                 onmouseup="btnCliente_onmouseup()" />
                              </asp:HyperLink>
                            </td>
                          </tr>
                          <tr>
                            <td width="137px" height="34px" valign="middle">
                              <asp:HyperLink ID="linNavio" NavigateUrl="Navio.aspx" runat="server">
                                <img id="btnNavio" src="Imgsr/btnNavioUp.jpg"
                                 language="javascript" 
                                 onmousedown="btnNavio_onmousedown()" 
                                 onmouseup="btnNavio_onmouseup()" />
                              </asp:HyperLink>
                            </td>
                          </tr>
                          <tr>
                            <td width="137px" height="34px" valign="middle">
                              <asp:HyperLink ID="linPorto" NavigateUrl="Portos.aspx" runat="server">
                                <img id="btnPorto" src="Imgsr/btnPortoUp.jpg"
                                 language="javascript" 
                                 onmousedown="btnPorto_onmousedown()" 
                                 onmouseup="btnPorto_onmouseup()" />
                              </asp:HyperLink>
                            </td>
                          </tr>
                          <tr>
                            <td width="137px" height="34px" valign="middle">
                              <asp:HyperLink ID="linGrupo" NavigateUrl="Grupo.aspx" runat="server">
                                <img id="btnGrupo" src="Imgsr/btnGruposUp.jpg"
                                 language="javascript" 
                                 onmousedown="btnGrupo_onmousedown()" 
                                 onmouseup="btnGrupo_onmouseup()" />
                              </asp:HyperLink>
                            </td>
                          </tr>
                          <tr>
                            <td width="137px" height="34px" valign="middle">
                              <asp:HyperLink ID="linMenbros" NavigateUrl="Membros.aspx" runat="server">
                                <img id="btnMenbros" src="Imgsr/btnMembrosUp.jpg"
                                 language="javascript" 
                                 onmousedown="btnMenbros_onmousedown()" 
                                 onmouseup="btnMenbros_onmouseup()" />
                              </asp:HyperLink>
                            </td>
                          </tr>
                          <tr>
                            <td width="137px" height="34px" valign="middle">
                              <asp:HyperLink ID="linRetorno" NavigateUrl="Restrito.aspx" runat="server">
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
                  <table width="586px" height="200px" cellpadding="0" cellspacing="0">
                    <tr>
                      <td width="10px" height="44px"></td>
                      <td width="565px" height="44px"></td>
                      <td height="44px"></td>
                    </tr>
                    <tr>
                      <td width="10px" height="55px"></td>
                      <td width="565px" height="55px">
                      <table width="565px" height="55px" class="Cabe" cellspacing="0" cellpadding="0">
                       <tr>
                        <td width="50px" height="50px" align="center" valign="middle">
                          <img src="Imgsr/filecabinet.gif" width="48px" height="48px" />
                        </td>
                        <td width="441px" height="50px" style="font-family: Arial; font-size: 24px; font-weight: bold; color: #0066CC;" valign="middle" align="left">
                        �rea de Cadastros</td>
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
