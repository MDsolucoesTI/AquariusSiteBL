<!--
//////////////////////////////////////////////////////////////////////////
// Criacao...........: 04/2006
// Sistema...........: Site da Aquarius Maritime
// Analistas.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Desenvolvedores...: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Copyright.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////
-->

<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Viagem.aspx.cs" Inherits="Viagem" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Ata de Viagem</title>
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
                          DisplayAfter="100" OnInit="UpdateProgress1_Init">
                          <ProgressTemplate>
                            &nbsp;<asp:Image ID="Image11" runat="server" ImageUrl="~/Imgsr/loading_animation_liferay.gif" />
                            <br />
                            <asp:Label ID="lblProgress" runat="server" Font-Bold="True" Style="left: 294px; top: 88px"
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
                  &nbsp;<asp:UpdatePanel ID="UpdatePanel1" runat="server">
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
                        Cadastro de Ata de Viagem</td>
                        <td height="50px">&nbsp;</td>
                       </tr>
                      </table>
                      </td>
                      <td style="height: 55px"></td>
                    </tr>
                    <tr>
                      <td width="10px" height="50px"></td>
                      <td width="565px" height="50px" align=left>
		                    <asp:table id="TableLists" runat="server" CssClass="Grid_General" Width="564px">
			                    <asp:TableRow ID="TableRow1" runat="server">
				                    <asp:TableCell ID="TableCell1" width="50px" HorizontalAlign="Center" runat="server"><B>Cliente:</B></asp:TableCell>
				                    <asp:TableCell ID="TableCell2" width="350px" runat="server">
					                    <asp:DropDownList runat="server" ID="drpCliente" OnSelectedIndexChanged="drpCliente_IndexChanged"
						                   Width="350px" CssClass="TextBox" AutoPostBack="True" />
				                    </asp:TableCell>
			                    </asp:TableRow>
		                    </asp:table>
                        <br>
			                  <asp:table id="TableNewSubscriber" runat="server" CssClass="Grid_General" Width="564px">
			                    <asp:TableRow ID="TableRow2" CssClass="Grid_Header" runat="server">
				                    <asp:TableCell ID="TableCell4" Width="90px" runat="server">Novo</asp:TableCell>
				                    <asp:TableCell ID="TableCell5" runat="server">Titulo</asp:TableCell>
			                    </asp:TableRow>
			                    <asp:TableRow ID="CreateNewRow" runat="server">
				                    <asp:TableCell ID="TableCell6" runat="server">
					                    <asp:Button runat="server" Text="Criar"
						                   ID="Create" CssClass="Button"
						                   OnClick="Create_Click" Width="80px" />
				                    </asp:TableCell>
				                    <asp:TableCell ID="AddNewResultCell" ColumnSpan="2" runat="server">
					                    <asp:Label runat="server" CssClass="Error" ID="AddNewError"
						                   Text="Ata j� est� presente" Visible="False" />
				                    </asp:TableCell>
			                    </asp:TableRow>
                          <asp:TableRow ID="AddNewControlsRow" Visible="False" runat="server">
				                    <asp:TableCell ID="TableCell7" runat="server">
					                    <asp:Image ID="Image12" ImageURL="./Imgsr/imgSpacer.gif" Width="15px" Height="1px" runat="server" />
					                    <asp:LinkButton ID="AddNew" runat="server"
						                   Text="&lt;img border=0 src=./Imgsr/imgOK.gif Alt='Confirma cadastro'&gt;" 
						                   OnClick="AddNew_Click"	/>
					                    <asp:Image ID="Image2" ImageURL="./Imgsr/imgSpacer.gif" Width="15px" Height="1px" runat="server" />
					                    <asp:LinkButton ID="CancelAddNew" runat="server" CausesValidation="False"
						                   Text="&lt;img border=0 src=./Imgsr/imgCancel.gif Alt='Cancela cadastro'&gt;" 
						                   OnClick="CancelAddNew_Click" />
				                    </asp:TableCell>
				                    <asp:TableCell ID="TableCell8" VerticalAlign="Top" runat="server">
                              <asp:TextBox runat="server" Width="450px" ID="txtTitulo" CssClass="TextBox" />
				                    </asp:TableCell>
				                  </asp:TableRow>
				                  <asp:TableRow ID="AddNewCon" Visible="False" runat="server">
				                  	<asp:TableCell ID="TableCell3" VerticalAlign="Top" runat="server">
				                  	  Ata:
				                    </asp:TableCell>
				                    <asp:TableCell ID="TableCell9" VerticalAlign="Top" runat="server">
                              <asp:TextBox runat="server" Rows="15" TextMode="MultiLine"
					                      Width="450px" ID="txtAta" CssClass="TextBox" />
				                    </asp:TableCell>
				                  </asp:TableRow>
		                    </asp:table>
		                    <br>
                        <asp:DataGrid id="ViaGrid" runat="server"
			                   CssClass="Grid_General"
			                   HeaderStyle-CssClass="Grid_Header"
			                   ItemStyle-CssClass="Grid_Item"
			                   AlternatingItemStyle-CssClass="Grid_AlternatingItem"
			                   AllowSorting="True"
			                   PageSize="5"
			                   AllowPaging="True"
			                   PagerStyle-HorizontalAlign="Right"
			                   PagerStyle-PageButtonCount="5"
			                   PagerStyle-Mode="NumericPages"
			                   AutoGenerateColumns ="False"
			                   DataKeyField="CodVia"
			                   OnSelectedIndexChanged="ViaGrid_Selection"
			                   OnPageIndexChanged="ViaGrid_PageChanged"
			                   OnDeleteCommand="ViaGrid_Delete"
			                   OnEditCommand="ViaGrid_Edit"
			                   OnUpdateCommand="ViaGrid_Update"
			                   OnCancelCommand="ViaGrid_Cancel"
			                   OnSortCommand="ViaGrid_Sort" Width="566px" >
			                    <Columns>
			                    
				                    <asp:EditCommandColumn 
					                   EditText="&lt;img border=0 Alt='Edita Grupo' src=./Imgsr/imgEdit.gif&gt;"
					                   CancelText="&lt;img border=0 Alt='Cancela Edi&ccedil;&atilde;o' src=./Imgsr/imgCancel.gif&gt;"
					                   UpdateText="&lt;img border=0 Alt='Confirma Edi&ccedil;&atilde;o' src=./Imgsr/imgOK.gif&gt;">
                              <ItemStyle Width="25px" />
                            </asp:EditCommandColumn>
                            			                    
				                    <asp:ButtonColumn
					                   Text="&lt;img border=0 Alt='Apaga Ata' src=./Imgsr/imgDelete.gif&gt;"
					                   CommandName="delete"  >
					                   <ItemStyle Width="25px" />
                            </asp:ButtonColumn>
                            
				                    <asp:BoundColumn HeaderText="N�" ReadOnly="true" DataField="CodVia" SortExpression="CodVia">
					                    <ItemStyle Width="30px" />
			                      </asp:BoundColumn>
				                    <asp:BoundColumn HeaderText="Data" DataField="Data" SortExpression="Data">
					                    <ItemStyle Width="50px" />
			                      </asp:BoundColumn>
				                    <asp:BoundColumn HeaderText="Titulo" DataField="Titulo" SortExpression="Titulo">
                              <ItemStyle Width="200px" />
                            </asp:BoundColumn>
				                    <asp:ButtonColumn CommandName="Select" ItemStyle-Width="25px"
					                    Text="<img border=0 Alt='Show message' src=./Imgsr/imgMessage.gif>" />	
								          </Columns>
                          <PagerStyle 
                           HorizontalAlign="Right" 
                           Mode="NumericPages" 
                           PageButtonCount="20" />
                          <AlternatingItemStyle CssClass="Grid_AlternatingItem" />
                          <ItemStyle CssClass="Grid_Item" />
                          <HeaderStyle CssClass="Grid_Header" />
		                    </asp:DataGrid>
                      </td>
                      <td height="50px"></td>
                    </tr>
                    <tr>
                      <td width="10px" style="height: 50px">&nbsp;</td>
                      <td style="width: 565px; height: 50px;">
                      </td>
                      <td style="height: 50px">&nbsp;</td>
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
