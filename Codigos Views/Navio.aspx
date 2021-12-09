<!--
//////////////////////////////////////////////////////////////////////////
// Criacao...........: 04/2006
// Sistema...........: Site da Aquarius Maritime
// Analistas.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Desenvolvedores...: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Copyright.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////
-->

<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Navio.aspx.cs" Inherits="Navio" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Cadastro de Navios</title>
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
  document.all.vldCodigo.IsValid = true;
  document.all.vldNome.IsValid = true;
  document.all.vldCliente.IsValid = true;
  documente.al.vldTipo.IsValid = true;
}

// -->
</script>
</head>
<body id="WebCliResPt" alink="white" vlink="white" link="white" style="background-color: #4079b8">
  <form id="frmClients" runat="server">
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
                        <p style="font-family: Arial; font-size: 12px; font-style: italic; color: #0099FF">
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
                  <table width="586px" cellpadding="0" cellspacing="0">
                    <tr>
                      <td width="10px" height="44px"></td>
                      <td width="565px" height="44px"></td>
                      <td height="44px"></td>
                    </tr>
                    <tr>
                      <td width="10px" height="55px"></td>
                      <td width="565px" height="55px">
                      <table width="565px" height="55px" cellspacing="0" cellpadding="0" class="Cabe">
                       <tr>
                        <td width="50px" height="50px" align="center" valign="middle">
                          <img src="Imgsr/Clientes.gif" width="48px" height="48px" />
                        </td>
                        <td width="441px" height="50px" style="font-family: Arial; font-size: 24px; font-weight: bold; color: #0066CC;" valign="middle" align="left">
                        Ficha de Navios - Manuten&ccedil;&atilde;o</td>
                        <td height="50px">&nbsp;</td>
                       </tr>
                      </table>
                      </td>
                      <td height="55px"></td>
                    </tr>
                    <tr>
                      <td width="10px" style="height: 450px"></td>
                      <td width="565px" valign="top" align="left" style="height: 450px" >
                      	<table id="Table1" runat="server" Align="left" style="font-size:11px" CellSpacing="0">
                        <tr>
                          <td Align="left" Width="100px" Height="28px" valign="middle">
                            <asp:Label ID="Label41" runat="server" Font-Names="Arial" Font-Size="11px"
                              Text="C&oacute;digo:"></asp:Label></td>
                          <td Align="left" colspan=3 Height="28px" valign="middle">
                            <asp:TextBox ID="txtCodigo" runat="server" Columns="10" Font-Names="Arial" Font-Size="11px"
                              Enabled="false"></asp:TextBox><span style="color: #ff0000">*</span></td>
                        </tr>
                        <tr>
                          <td Align="left" Width="100px" Height="15px" VAlign="middle">
                          </td>
                          <td Align="left" colspan=3 Height="15px" VAlign="middle">
                          <asp:RequiredFieldValidator ID="vldCodigo" Enabled="false" runat="server"
                           ErrorMessage="Deve ser digitado o C&oacute;digo" ControlToValidate="txtCodigo"
                           CssClass="alerta"></asp:RequiredFieldValidator>
                          </td>
                        </tr>
                        
                        <tr>
                          <td Align="left" Width="100px" Height="28px" valign="middle">
                            <asp:Label ID="Label2" runat="server" Font-Names="Arial" Font-Size="11px" Text="Nome:"></asp:Label></td>
                          <td Align="left" colspan=3 Height="28px" valign="middle">
                            <asp:TextBox ID="txtNome" runat="server" Columns="30" Font-Names="Arial" Font-Size="11px"
                            Enabled="false"></asp:TextBox><span style="color: #ff0000">*</span></td>
                        </tr>
                        <tr>
                          <td Align="left" Width="100px" Height="15px" VAlign="middle">
                          </td>
                          <td Align="left" colspan=3 Height="15px" VAlign="middle">
                          <asp:RequiredFieldValidator ID="vldNome" Enabled="false" runat="server"
                           ErrorMessage="Deve ser digitado o Nome" ControlToValidate="txtNome"
                           CssClass="alerta"></asp:RequiredFieldValidator>
                          </td>
                        </tr>
                        
                        <tr>
                          <td Align="left" Width="100px" Height="28px" valign="middle">
                            <asp:Label ID="Label3" runat="server" Font-Names="Arial" Font-Size="11px" Text="Nome Antigo:"></asp:Label></td>
                          <td Align="left" colspan=3 Height="28px" valign="middle">
                            <asp:TextBox ID="txtExNome" runat="server" Columns="50" Font-Names="Arial" Font-Size="11px"
                            Enabled="False"></asp:TextBox></td>
                        </tr>
                        <tr>
                          <td Align="left" Width="100px" Height="15px" valign="middle">
                          </td>
                          <td Align="left" colspan=3 Height="15px" valign="middle">
                          </td>
                        </tr>
                                                
                        <tr>
                          <td Align="left" Width="100px" Height="28px" valign="middle">
                          <asp:Label ID="Label8" runat="server" Text="Tipo:"></asp:Label>
                          </td>
                          <td Align="left" colspan=3 Height="28px" valign="middle">
                            <asp:DropDownList ID="drpTipo" runat="server" Enabled="False">
                            </asp:DropDownList>
                            <span style="color: #ff0000">*</span>
                          </td>
                        </tr>
                        <tr>
                          <td Align="left" Width="100px" VAlign="middle" style="height: 15px">
                          </td>
                          <td Align="left" colspan=3 VAlign="middle" style="height: 15px">
                          <asp:RequiredFieldValidator ID="vldTipo" Enabled="false" runat="server"
                           ErrorMessage="Deve ser fornecido o Tipo" ControlToValidate="drpTipo" 
                           CssClass="alerta"></asp:RequiredFieldValidator>
                          </td>
                        </tr>
                                                
                        <tr>
                          <td Align="left" Width="100px" Height="28px" valign="middle">
                          <asp:Label ID="Label7" runat="server" Text="Propriet&aacute;rio:"></asp:Label>
                          </td>
                          <td Align="left" colspan=3 Height="28px" valign="middle">
                            <asp:TextBox ID="txtProp" runat="server" Columns="50" Rows="4" TextMode="MultiLine" CssClass="entrada" Enabled="False"></asp:TextBox>
                            <span style="color: #ff0000">*</span>
                          </td>
                        </tr>
                        <tr>
                          <td Align="left" Width="100px" VAlign="middle" style="height: 15px">
                          </td>
                          <td Align="left" colspan=3 VAlign="middle" style="height: 15px">
                          <asp:RequiredFieldValidator ID="vldProp" Enabled="false" runat="server"
                           ErrorMessage="Deve ser fornecido o Propriet&aacute;rio" ControlToValidate="txtProp" 
                           CssClass="alerta"></asp:RequiredFieldValidator>
                          </td>
                        </tr>
                                                
                        <tr>
                          <td Align="left" Width="100px" Height="28px" valign="middle">
                          <asp:Label ID="Label4" runat="server" Text="DWT:"></asp:Label>
                          </td>
                          <td Align="left" Width="150px" Height="28px" valign="middle">
                          <asp:TextBox ID="txtDWT" runat="server" Columns="20" CssClass="entrada" Enabled="False"></asp:TextBox>
                          </td>
                          <td Align="left" Width="100px" Height="28px" valign="middle">
                          <asp:Label ID="Label12" runat="server" Text="GRT:"></asp:Label>
                          </td>
                          <td Align="left" Width="150px" Height="28px" valign="middle">
                          <asp:TextBox ID="txtGRT" runat="server" Columns="20" CssClass="entrada" Enabled="False"></asp:TextBox>
                          </td>                          
                        </tr>
                        <tr>
                          <td Align="left" Width="100px" Height="15px" VAlign="middle">
                          </td>
                          <td Align="left" Width="150px" Height="15px" VAlign="middle">
                          </td>
                          <td Align="left" Width="100px" Height="15px" VAlign="middle">
                          </td>
                          <td Align="left" Width="150px" Height="15px" VAlign="middle">
                          </td>                          
                        </tr>

                        <tr>
                          <td Align="left" Width="100px" Height="28px" valign="middle">
                          <asp:Label ID="Label10" runat="server" Text="LOA:"></asp:Label>
                          </td>
                          <td Align="left" Width="150px" Height="28px" valign="middle">
                          <asp:TextBox ID="txtLOA" runat="server" Columns="20" CssClass="entrada"
                           Enabled="False"></asp:TextBox>
                          </td>
                          <td Align="left" Width="100px" Height="28px" VAlign="middle">
                          <asp:Label ID="Label13" runat="server" Text="NRT:"></asp:Label>
                          </td>
                          <td Align="left" Width="150px" Height="28px" VAlign="middle"> 
                          <asp:TextBox ID="txtNRT" runat="server" Columns="20" CssClass="entrada" Enabled="False"></asp:TextBox>
                          </td>                         
                        </tr>
                        <tr>
                          <td Align="left" Width="100px" Height="15px" VAlign="middle">
                          </td>
                          <td Align="left" Width="150px" Height="15px" VAlign="middle">
                          </td>
                          <td Align="left" Width="100px" Height="15px" VAlign="middle">
                          </td>
                          <td Align="left" Width="150px" Height="15px" VAlign="middle">
                          </td>  
                        </tr>
                        <tr>
                          <td Align="left" Width="100px" Height="28px" valign="middle">
                            <asp:Label ID="Label14" runat="server" Text="Beam:"></asp:Label>
                          </td>
                          <td Align="left" Width="150px" Height="28px" valign="middle">
                            <asp:TextBox ID="txtBeam" runat="server" Columns="20" CssClass="entrada" Enabled="False"></asp:TextBox>
                          </td>
                          <td Align="left" Width="100px" Height="28px" VAlign="middle">
                            <asp:Label ID="Label5" runat="server" Text="TLX:"></asp:Label>
                          </td>
                          <td Align="left" Width="150px" Height="28px" VAlign="middle">
                            <asp:TextBox ID="txtTLX" runat="server" Columns="20" CssClass="entrada" Enabled="False"></asp:TextBox>
                          </td>
                        </tr>
                        <tr>
                          <td Align="left" Width="100px" Height="15px" VAlign="middle">
                          </td>
                          <td Align="left" Width="150px" Height="15px" VAlign="middle">
                          </td>
                          <td Align="left" Width="100px" Height="15px" VAlign="middle">
                          </td>
                          <td Align="left" Width="150px" Height="15px" VAlign="middle">
                          </td>  
                        </tr>
                        <tr>
                          <td Align="left" Width="100px" Height="28px" valign="middle">
                          <asp:Label ID="Label6" runat="server" Text="Telefone:"></asp:Label>
                          </td>
                          <td Align="left" Width="300px" Height="28px" valign="middle">
                            <asp:TextBox ID="txtTel" runat="server" Columns="20" CssClass="entrada" Enabled="False"></asp:TextBox>
                          </td>
                          <td Align="left" Width="100px" Height="28px" valign="middle">
                          <asp:Label ID="Label9" runat="server" Text="Fax:"></asp:Label>
                          </td>
                          <td Align="left" Width="300px" Height="28px" valign="middle">
                           <asp:TextBox ID="txtFax" runat="server" Columns="20" CssClass="entrada" Enabled="False"></asp:TextBox>
                          </td>
                        </tr>
                        <tr>
                          <td Align="left" Width="100px" Height="15px" VAlign="middle">
                          </td>
                          <td Align="left" Width="300px" Height="15px" VAlign="middle">
                          </td>
                          <td Align="left" Width="100px" Height="15px" VAlign="middle">
                          </td>
                          <td Align="left" Width="150px" Height="15px" VAlign="middle">
                          </td>  
                        </tr>
                        <tr>
                          <td Align="left" Width="100px" Height="28px" valign="middle">
                          <asp:Label ID="Label11" runat="server" Text="E-Mail:"></asp:Label>
                          </td>
                          <td Align="left" colspan=3 Height="28px" valign="middle">
                            <asp:TextBox ID="txtEMail" runat="server" Columns="45" CssClass="entrada" Enabled="False"></asp:TextBox>
                          </td>
                        </tr>
                        <tr>
                          <td Align="left" Width="100px" Height="15px" VAlign="middle">
                          </td>
                          <td Align="left" colspan=3 Height="15px" VAlign="middle">
                          </td>
                        </tr>                                                                        
                      </table>

                      </td>
                      <td style="height: 450px"></td>
                    </tr>
                    <tr>
                      <td width="10px" height="50px">&nbsp;</td>
                      <td width="565px" height="50px">
                        <asp:ImageButton ID="btnAnterior" Width="65px" runat="server" ImageUrl="~/Imgsr/btnAnterior.jpg" OnClick="btnAnterior_Click" />
                        <asp:ImageButton ID="btnProximo" Width="65px" runat="server" ImageUrl="~/Imgsr/btnProximo.jpg" OnClick="btnProximo_Click" />
                        <asp:ImageButton ID="btnNovo" Width="65px" runat="server" ImageUrl="~/Imgsr/btnNovo.jpg" OnClick="btnNovo_Click" />
                        <asp:ImageButton ID="btnAlterar" Width="65px" runat="server" ImageUrl="~/Imgsr/btnAlterar.jpg" OnClick="btnAlterar_Click" />
                        <asp:ImageButton ID="btnGravar" Width="65px" runat="server" ImageUrl="~/Imgsr/btnGravar.jpg" OnClick="btnGravar_Click" />
                        <asp:ImageButton ID="btnCancelar" Width="65px" runat="server" ImageUrl="~/Imgsr/btnCancelar.jpg"  OnClientClick="btnCanc_Click()" OnClick="btnCancelar_Click" />
                        <asp:ImageButton ID="btnApagar" Width="65px" runat="server" ImageUrl="~/Imgsr/btnApagar.jpg" OnClick="btnApagar_Click" />
                        <asp:ImageButton ID="btnLocal" Width="65px" runat="server" ImageUrl="~/Imgsr/btnLocalizar.jpg" />
                      </td>
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
