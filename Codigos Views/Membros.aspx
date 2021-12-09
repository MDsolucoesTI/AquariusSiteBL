<!--
//////////////////////////////////////////////////////////////////////////
// Criacao...........: 04/2006
// Sistema...........: Site da Aquarius Maritime
// Analistas.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Desenvolvedores...: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Copyright.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////
-->

<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Membros.aspx.cs" Inherits="Membros" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Cadastro de Membros - Not&iacute;cias</title>
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
                        Cadastro de Membros - Not&iacute;cias</td>
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
			                    <asp:TableRow runat="server">
				                    <asp:TableCell width="50px" HorizontalAlign="Center" runat="server"><B>Grupo:</B></asp:TableCell>
				                    <asp:TableCell width="280px" runat="server">
					                    <asp:DropDownList runat="server" ID="drpGrupo"
						                   Width="280px" CssClass="TextBox" AutoPostBack="True"
						                   OnSelectedIndexChanged="drpGrupo_IndexChanged" />
				                    </asp:TableCell>
				                    <asp:TableCell runat="server">
					                    <asp:Button runat="server" Text="Send Email"
						                   ID="SendEmail" CssClass="Button"
						                    OnClick="SendEmail_Click" Width="100px" />
				                    </asp:TableCell>
			                    </asp:TableRow>
		                    </asp:table>
                        <br>
			                  <asp:table id="TableNewSubscriber" runat="server" CssClass="Grid_General" Width="564px">
			                    <asp:TableRow CssClass="Grid_Header" runat="server">
				                    <asp:TableCell Width="90px" runat="server">Novo</asp:TableCell>
				                    <asp:TableCell Width="200px" runat="server">Nome</asp:TableCell>
				                    <asp:TableCell runat="server">E-Mail</asp:TableCell>
			                    </asp:TableRow>
			                    <asp:TableRow ID="CreateNewRow" runat="server">
				                    <asp:TableCell runat="server">
					                    <asp:Button runat="server" Text="Criar"
						                   ID="Create" CssClass="Button"
						                   OnClick="Create_Click" Width="80px" />
				                    </asp:TableCell>
				                    <asp:TableCell ID="AddNewResultCell" ColumnSpan="2" runat="server">
					                    <asp:Label runat="server" CssClass="Error" ID="AddNewError"
						                   Text="Cliente j� est� presente no Grupo" Visible="False" />
				                    </asp:TableCell>
			                    </asp:TableRow>
			                    
                          <asp:TableRow ID="AddNewControlsRow" Visible="False" runat="server">
				                    <asp:TableCell runat="server">
					                    <asp:Image ID="Image1" ImageURL="./Imgsr/imgSpacer.gif" Width="15px" Height="1px" runat="server" />
					                    <asp:LinkButton ID="AddNew" runat="server"
						                   Text="&lt;img border=0 src=./Imgsr/imgOK.gif Alt='Confirma cadastro'&gt;" 
						                   OnClick="AddNew_Click"	/>
					                    <asp:Image ID="Image2" ImageURL="./Imgsr/imgSpacer.gif" Width="15px" Height="1px" runat="server" />
					                    <asp:LinkButton ID="CancelAddNew" runat="server" CausesValidation="False"
						                   Text="&lt;img border=0 src=./Imgsr/imgCancel.gif Alt='Cancela cadastro'&gt;" 
						                   OnClick="CancelAddNew_Click" />
				                    </asp:TableCell>
				                    <asp:TableCell VerticalAlign="Top">
					                    <asp:TextBox runat="server" CssClass="TextBox" ID="NewName" Width="170px" />
				                    </asp:TableCell>
				                    <asp:TableCell VerticalAlign="Top">
					                    <asp:TextBox runat="server" CssClass="TextBox" ID="NewEmail" Width="240px" />
					                    <asp:RequiredFieldValidator Id="ValidateNewEmail" runat="server"
						                   ControlToValidate="NewEmail"
						                   Display="dynamic"><br>* &eacute; requerido o Email
						                  </asp:RequiredFieldValidator>
					                    <asp:RegularExpressionValidator id="ValidateEmailChars" runat="server"
    					                 validationExpression=".*@.*\..*"
    					                 ControlToValidate="NewEmail"
    					                 Display="dynamic"><br>* Este Email n&atilde;o &eacute; v&aacute;lido
    				                  </asp:RegularExpressionValidator>
				                    </asp:TableCell>
				                  </asp:TableRow>
				                  
		                    </asp:table>
		                    <br>
                        <asp:DataGrid id="SubscrGrid" runat="server"
			                   CssClass="Grid_General"
			                   HeaderStyle-CssClass="Grid_Header"
			                   ItemStyle-CssClass="Grid_Item"
			                   AlternatingItemStyle-CssClass="Grid_AlternatingItem"
			                   AllowSorting="True"
			                   PageSize="20"
			                   AllowPaging="True"
			                   PagerStyle-HorizontalAlign="Right"
			                   PagerStyle-PageButtonCount="20"
			                   PagerStyle-Mode="NumericPages"
			                   AutoGenerateColumns ="False"
			                   DataKeyField="ID"
			                   OnPageIndexChanged="SubscrGrid_PageChanged"
			                   OnDeleteCommand="SubscrGrid_Delete"
			                   OnSortCommand="SubscrGrid_Sort" Width="564px" >
			                    <Columns>
				                    <asp:ButtonColumn
					                   Text="&lt;img border=0 Alt='Apaga Membro' src=./Imgsr/imgDelete.gif&gt;"
					                   CommandName="delete"  >
                              <ItemStyle Width="25px" />
                            </asp:ButtonColumn>
				                    <asp:BoundColumn 
				                     HeaderText="ID" 
				                     DataField="ID" 
				                     ReadOnly="True" 
				                     SortExpression="ID" >
                              <ItemStyle Width="30px" />
                            </asp:BoundColumn>
				                    <asp:TemplateColumn
				                     HeaderText="Cliente" 
				                     SortExpression="Name">
					                    <ItemTemplate>
						                    <asp:Label ID="Label1" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "Nome") %>' />
					                    </ItemTemplate>
                              <ItemStyle Width="150px" />
                            </asp:TemplateColumn>
                            <asp:TemplateColumn 
                             HeaderText="Email" 
                             SortExpression="Email">
					                    <ItemTemplate>
						                    <asp:HyperLink ID="HyperLink1" runat="server"
							                   NavigateUrl='<%# "mailto:" + DataBinder.Eval(Container.DataItem, "Email") %>'
							                   Text='<%# DataBinder.Eval(Container.DataItem, "Email") %>' CssClass="GridLink" />
					                    </ItemTemplate>
                              <ItemStyle Width="200px" />
				                    </asp:TemplateColumn>
				                    <asp:TemplateColumn HeaderText="Date" SortExpression="CreatedDate">
					                    <ItemTemplate>
						                    <asp:Label ID="Label3" runat="server"
							                   Text='<%# String.Format("{0:MM/dd/yy}",
								                 DateTime.Parse(DataBinder.Eval(Container.DataItem, "CreatedDate").ToString()) ) %>' />
					                    </ItemTemplate>
				                    </asp:TemplateColumn>
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
    </div>
  </form>
</body>
</html>