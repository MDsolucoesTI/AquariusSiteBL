<!--
//////////////////////////////////////////////////////////////////////////
// Criacao...........: 04/2006
// Sistema...........: Site da Aquarius Maritime
// Analistas.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Desenvolvedores...: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Copyright.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////
-->

<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Grupo.aspx.cs" Inherits="Grupo" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>Cadastro Grupos de Not&iacute;cias</title>
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
<body runat="server" alink="white" vlink="white" link="white" id="WebGruResPt" style="background-color: #4079b8" >
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
                          <img src="Imgsr/Usuarios.jpg" width="48px" height="48px" />
                        </td>
                        <td width="441px" height="50px" style="font-family: Arial; font-size: 24px; font-weight: bold; color: #0066CC;" valign="middle" align="left">
                        Cadastro de Grupos de Not&iacute;cias</td>
                        <td height="50px">&nbsp;</td>
                       </tr>
                      </table>
                      </td>
                      <td height="55px"></td>
                    </tr>
                    <tr>
                      <td width="10px" height="50px"></td>
                      <td width="565px" height="50px" align=left>
                      <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                        <ContentTemplate>
                        <asp:table id="TableNewList" runat="server" CssClass="Grid_General" Width="564px">
			                    <asp:TableRow CssClass="Grid_Header" runat="server">
				                    <asp:TableCell Width="80px" runat="server">Novo</asp:TableCell>
				                    <asp:TableCell Width="150px" runat="server">Nome</asp:TableCell>
				                    <asp:TableCell Width="300px" runat="server">Descri&ccedil;&atilde;o</asp:TableCell>
			                    </asp:TableRow>
			                    <asp:TableRow ID="CreateNewRow" runat="server">
				                    <asp:TableCell ColumnSpan="3" runat="server">
					                    <asp:Button runat="server" Text="Criar"
						                   ID="Create" CssClass="Button"
						                   OnClick="Create_Click" Width="80px" />
				                    </asp:TableCell>
			                    </asp:TableRow>
			                    <asp:TableRow ID="AddNewControlsRow" Visible="False" runat="server">
				                    <asp:TableCell runat="server">
					                    <asp:Image ID="Image1" ImageURL="~/Imgsr/imgSpacer.gif" Width="15px" Height="1px" runat="server" />
					                    <asp:LinkButton ID="AddNew" runat="server"
						                   Text="&lt;img border=0 src=./Imgsr/imgOK.gif Alt='Confirma cadastro'&gt;" 
						                   OnClick="AddNew_Click" />
					                    <asp:Image ID="Image2" ImageURL="~/Imgsr/imgSpacer.gif" Width="15px" Height="1px" runat="server" />
					                    <asp:LinkButton ID="CancelAddNew" runat="server" CausesValidation="False"
						                   Text="&lt;img border=0 src=./Imgsr/imgCancel.gif Alt='Cancela cadastro'&gt;" 
						                   OnClick="CancelAddNew_Click" />
				                    </asp:TableCell>
				                    <asp:TableCell VerticalAlign="Top" runat="server">
					                    <asp:TextBox runat="server" CssClass="TextBox" ID="NewListName" Width="155px" />
					                    <asp:RequiredFieldValidator Id="ValidateNewName" runat="server"
						                   ControlToValidate="NewListName"
						                   Display="Dynamic"><br>* &Eacute; necess&aacute;rio o Nome
					                    </asp:RequiredFieldValidator>
				                    </asp:TableCell>
				                    <asp:TableCell VerticalAlign="Top" runat="server">
					                    <asp:TextBox runat="server" CssClass="TextBox" ID="NewListDescr" Width="260px" />
				                    </asp:TableCell>
			                    </asp:TableRow>
		                    </asp:table>
                        
                        <br>
		                    <asp:DataGrid id="GridGrupo" runat="server"
			                   CssClass="Grid_General"
			                   HeaderStyle-CssClass="Grid_Header"
			                   ItemStyle-CssClass="Grid_Item"
			                   AlternatingItemStyle-CssClass="Grid_AlternatingItem"
			                   AllowSorting="True"
			                   AutoGenerateColumns ="False"
			                   DataKeyField="ID"
			                   OnEditCommand="ListsGrid_Edit"
			                   OnCancelCommand="ListsGrid_CancelEdit"
			                   OnUpdateCommand="ListsGrid_Update" 
			                   OnDeleteCommand="ListsGrid_Delete"
			                   OnSortCommand="ListsGrid_Sort" Width="566px" >
			                    <Columns>
				                    <asp:EditCommandColumn 
					                   EditText="&lt;img border=0 Alt='Edita Grupo' src=./Imgsr/imgEdit.gif&gt;"
					                   CancelText="&lt;img border=0 src=./Imgsr/imgCancel.gif&gt;"
					                   UpdateText="&lt;img border=0 src=./Imgsr/imgOK.gif&gt;">
                              <ItemStyle Width="25px" />
                            </asp:EditCommandColumn>
				                    
				                    <asp:ButtonColumn 
					                   Text="&lt;img border=0 Alt='Apaga Grupo' src=./Imgsr/imgDelete.gif&gt;"
					                   CommandName="delete">
                              <ItemStyle Width="25px" />
                            </asp:ButtonColumn>
				                    
				                    <asp:BoundColumn 
				                     HeaderText="ID"
				                     DataField="ID" 
				                     ReadOnly="True" 
				                     SortExpression="ID" >
                              <ItemStyle Width="30px" />
                            </asp:BoundColumn>
				                    
				                    <asp:TemplateColumn HeaderText="Nome" SortExpression="Name">
					                    <ItemTemplate>
						                    <asp:Label ID="Label1" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "Name") %>' />
					                    </ItemTemplate>
					                    <EditItemTemplate>
						                    <asp:TextBox ID="EditListName" runat="server"
							                   Text='<%# DataBinder.Eval(Container.DataItem, "Name") %>' 
							                   CssClass="TextBox"
							                   Width="155px"/>
						                    <asp:RequiredFieldValidator Id="ValidateEditName" runat="server"
						                     ControlToValidate="EditListName"
						                     Display="dynamic">
						                     *`&Eacute; necess&aacute;rio o Nome
						                    </asp:RequiredFieldValidator>
					                    </EditItemTemplate>
                              <ItemStyle Width="150px" />
				                    </asp:TemplateColumn>
				                    
				                    <asp:TemplateColumn HeaderText="Descri&ccedil;&atilde;o" SortExpression="Description">
					                    <ItemTemplate>
						                    <asp:Label ID="Label2" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "Description") %>' />
					                    </ItemTemplate>
					                    <EditItemTemplate>
						                    <asp:TextBox ID="EditListDescr" runat="server"
							                   Text='<%# DataBinder.Eval(Container.DataItem, "Description") %>' 
							                   CssClass="TextBox"
							                   Width="260px"/>
					                    </EditItemTemplate>
				                    </asp:TemplateColumn>
				                    
				                    <asp:HyperLinkColumn
					                   DataNavigateUrlField="ID"
					                   DataNavigateUrlFormatString="Membros.aspx?ListID={0}"
					                   DataTextFormatString="<img border=0 Alt='Mostrar Membros' src=Imgsr/imgAddresses.gif>"
					                   DataTextField="ID"
				                    />					
				
				                    <asp:HyperLinkColumn
					                   DataNavigateUrlField="ID"
					                   DataNavigateUrlFormatString="Historico.aspx?ListID={0}"
					                   DataTextFormatString="<img border=0 Alt='Hist�rico de mensagens do Grupo' src=Imgsr/imgMessage.gif>"
					                   DataTextField="ID"
				                    />					
				
				                    <asp:HyperLinkColumn
					                   DataNavigateUrlField="ID"
					                   DataNavigateUrlFormatString="EnviarEmail.aspx?ListID={0}"
					                   DataTextFormatString="<img border=0 Alt='Enviar E-Mail para o Grupo' src=Imgsr/imgMail.gif>"
					                   DataTextField="ID"
				                     />					
				                    
					                </Columns>
                          <AlternatingItemStyle CssClass="Grid_AlternatingItem" />
                          <ItemStyle CssClass="Grid_Item" />
                          <HeaderStyle CssClass="Grid_Header" />
		                    </asp:DataGrid>
		                    </ContentTemplate>
		                    </asp:UpdatePanel>
                      </td>
                      <td height="50px"></td>
                    </tr>
                    <tr>
                      <td width="10px" height="50px">&nbsp;</td>
                      <td width="565px" height="50px">
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
