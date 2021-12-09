<!--
//////////////////////////////////////////////////////////////////////////
// Criacao...........: 04/2006
// Sistema...........: Site da Aquarius Maritime
// Analistas.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Desenvolvedores...: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Copyright.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////
-->

<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Vessel.aspx.vb" Inherits="Vessel" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Cadastro de Navios</title>
</head>
<body id="WebVessel" style="background-color: #4079b8">
  <form id="frmPrincipal" runat="server">
      <div id="Princ" style="font-family: Arial; font-size: 12px; color: #000080; vertical-align: top; text-align: center">
        <asp:Table ID="TabPri" runat="server">
          <asp:TableRow ID="LinPri" >
            <asp:TableCell ID="ColDir" >
              <asp:Table runat="server" ID="TabMenu"  Height="760px" Width="241px" BackImageUrl="/Imgs/Novo_Estilo_Menu.jpg">
                <asp:TableRow ID="LinMenu1" Height="660px">
                  <asp:TableCell ID="ColMenu" ColumnSpan="3">
                    <asp:Table ID="MenuPrinc" runat="server" >
                      <asp:TableRow ID="MenuLin1" Height="40px" HorizontalAlign="Center" VerticalAlign="Bottom">
                        <asp:TableCell ID="MenuL1C1" Width="60px" ></asp:TableCell>
                        <asp:TableCell ID="MenuL1C2" Width="180px" >
                          <asp:Button ID="btnNovo" Height="30px" 
                            Width="100" BackColor="white" BorderColor="#3399ff" 
                            BorderStyle="Outset" BorderWidth="1" runat="server" Text="Novo"
                            ForeColor="navy" Font-Bold="true" Enabled="true" />
                        </asp:TableCell>
                      </asp:TableRow>
                      <asp:TableRow ID="MenuLin2" Height="40px" HorizontalAlign="Center" VerticalAlign="Bottom">
                        <asp:TableCell ID="MenuL2C1" Width="60px" ></asp:TableCell>
                        <asp:TableCell ID="MenuL2C2" Width="180px" >
                          <asp:Button ID="btnGravar" Height="30px" 
                            Width="100" BackColor="white" BorderColor="#3399ff" 
                            BorderStyle="Outset" BorderWidth="1" runat="server" Text="Gravar"
                            ForeColor="navy" Font-Bold="true" Enabled="false" />
                        </asp:TableCell>
                      </asp:TableRow>                        
                      <asp:TableRow ID="MenuLin3" Height="40px" HorizontalAlign="Center" VerticalAlign="Bottom">
                        <asp:TableCell ID="MenuL3C1" Width="60px" ></asp:TableCell>
                        <asp:TableCell ID="MenuL3C2" Width="180px" >
                          <asp:Button ID="btnCancelar" Height="30px" 
                            Width="100" BackColor="white" BorderColor="#3399ff" 
                            BorderStyle="Outset" BorderWidth="1" runat="server" Text="Cancelar"
                            ForeColor="navy" Font-Bold="true" Enabled="false" />
                        </asp:TableCell>
                      </asp:TableRow>
                      <asp:TableRow ID="MenuLin4" Height="40px" HorizontalAlign="Center" VerticalAlign="Bottom">
                        <asp:TableCell ID="MenuL4C1" Width="60px" ></asp:TableCell>
                        <asp:TableCell ID="MenuL4C2" Width="180px" >
                          <asp:Button ID="btnVoltar" Height="30px" 
                            Width="100" BackColor="white" BorderColor="#3399ff" 
                            BorderStyle="Outset" BorderWidth="1" runat="server" Text="Voltar"
                            ForeColor="navy" Font-Bold="true" PostBackUrl="Restrito.aspx" />
                        </asp:TableCell>
                      </asp:TableRow>
                      <asp:TableRow Height="500px">
                        <asp:TableCell Width="60px" ></asp:TableCell>
                        <asp:TableCell Width="180px" ></asp:TableCell>
                      </asp:TableRow>
                    </asp:Table>
                  </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow ID="LinMenu2" Height="40px">
                  <asp:TableCell ID="LogGen" Width="60px">
                    <asp:ImageButton runat="server" ID="btnMD" ImageUrl="~/Imgs/LogoMD.png" PostBackUrl="https://md.dev.br" />
                  </asp:TableCell>
                  <asp:TableCell ID="LogEspaco" Width="70px"></asp:TableCell>
                  <asp:TableCell ID="AspNet" Width="90px">
                    <asp:ImageButton runat="server" ID="btnAsp" ImageUrl="~/Imgs/pow_by_aspnet2.0a.gif" PostBackUrl="http://www.asp.net/" />
                  </asp:TableCell> 
                </asp:TableRow>
                <asp:TableRow ID="CopyW" Height="15px">
                  <asp:TableCell ID="Direitos" ColumnSpan="3">
                    <asp:HyperLink runat="server" ID="lblDireito" ForeColor="CornflowerBlue" Font-Size="12px" NavigateUrl="mailto:comercial@MD.eti.br">MD - Solu��es em TI</asp:HyperLink>
                  </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow ID="LinEspa" Height="10px" >
                  <asp:TableCell ></asp:TableCell>
                </asp:TableRow>
              </asp:Table>
            </asp:TableCell>
            <asp:TableCell ID="ColEsq" >
              <asp:Table runat="server" ID="TabCorpo" Height="760px" Width="531px" BackImageUrl="/Imgs/Novo_Estilo_Corpo.jpg">
                <asp:TableRow Height="20px" VerticalAlign="Middle" ID="LinCorpo1" >
                  <asp:TableCell ID="ColCorpo1" Font-Size="14px" Font-Bold="true" >
                    Cadastro de Navios 
                  </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow ID="LinCorpo2" Height="730px" Width="530px">
                  <asp:TableCell ID="TableCell1" runat="server" VerticalAlign="Top">
                    <asp:Table ID="Table1" runat="server" HorizontalAlign="left" Font-Size="11px" CellSpacing="0">
                      
                      <asp:TableRow ID="TableRow1" runat="server">
                        <asp:TableCell ID="TableCell2" runat="server" HorizontalAlign="left" 
                          Width="100px" Height="28px" VerticalAlign="middle">
                        <asp:Label ID="Label2" runat="server" Text="C�digo:"></asp:Label>
                        </asp:TableCell>
                        <asp:TableCell ID="TableCell3" runat="server" HorizontalAlign="left"
                          Width="300px" Height="28px" VerticalAlign="middle">
                          <asp:TextBox ID="edtCodCli" runat="server" Columns="10" Enabled="false" CssClass="entrada">
                          </asp:TextBox><span style="color: #ff0000">*</span>
                        </asp:TableCell>
                      </asp:TableRow>
                      
                      <asp:TableRow ID="TableRow2" runat="server">
                        <asp:TableCell ID="TableCell4" runat="server" HorizontalAlign="left"
                          Width="100px" Height="15px" VerticalAlign="middle">
                        </asp:TableCell>                      
                        <asp:TableCell ID="TableCell5" runat="server" HorizontalAlign="left"
                          Width="300px" Height="15px" VerticalAlign="middle">
                          <asp:RequiredFieldValidator ID="Validator1" Enabled="false" runat="server"
                          Font-Size="10px" ForeColor="red" Font-Names="Arial"
                          ErrorMessage="Deve ser digitado o Nome" ControlToValidate="edtCodCli" CssClass="alerta">
                          </asp:RequiredFieldValidator>
                        </asp:TableCell>
                      </asp:TableRow>
                      
                      <asp:TableRow ID="TableRow3" runat="server">
                        <asp:TableCell ID="TableCell6" runat="server" HorizontalAlign="left" 
                          Width="100px" Height="28px" VerticalAlign="middle">
                          <asp:Label ID="Label3" runat="server" Text="Nome:"></asp:Label>
                        </asp:TableCell>
                        <asp:TableCell ID="TableCell7" runat="server" HorizontalAlign="left"
                          Width="300px" Height="28px" VerticalAlign="middle">
                          <asp:TextBox ID="edtNomeCli" runat="server" Enabled="false" Columns="30" CssClass="entrada">
                          </asp:TextBox><span style="color: #ff0000">*</span>
                        </asp:TableCell>
                      </asp:TableRow>
                      
                      <asp:TableRow ID="TableRow4" runat="server">
                        <asp:TableCell ID="TableCell8" runat="server" HorizontalAlign="left"
                          Width="100px" Height="15px" VerticalAlign="middle">
                        </asp:TableCell>                      
                        <asp:TableCell ID="TableCell9" runat="server" HorizontalAlign="left"
                          Width="300px" Height="15px" VerticalAlign="middle">
                          <asp:RequiredFieldValidator ID="Validator2" Enabled="false" runat="server"
                          Font-Size="10px" ForeColor="red" Font-Names="Arial"
                          ErrorMessage="Deve ser digitado a Senha" ControlToValidate="edtNomeCli" CssClass="alerta">
                          </asp:RequiredFieldValidator>
                        </asp:TableCell>
                      </asp:TableRow>
                      
                      <asp:TableRow ID="TableRow5" runat="server">
                        <asp:TableCell ID="TableCell10" runat="server" HorizontalAlign="left"
                          Width="100px" Height="28px" VerticalAlign="middle">
                          <asp:Label ID="Label11" runat="server" Text="Nome Antigo:"></asp:Label>
                        </asp:TableCell>
                        <asp:TableCell ID="TableCell11" runat="server" HorizontalAlign="left"
                          Width="300px" Height="28px" VerticalAlign="middle">
                          <asp:TextBox ID="edtContato" runat="server" Enabled="false" Columns="30" CssClass="entrada"></asp:TextBox>
                        </asp:TableCell>
                      </asp:TableRow>
                      
                      <asp:TableRow ID="TableRow6" runat="server">
                        <asp:TableCell ID="TableCell12" runat="server" HorizontalAlign="left"
                          Width="100px" Height="15px" VerticalAlign="middle">
                        </asp:TableCell>                      
                        <asp:TableCell ID="TableCell13" runat="server" HorizontalAlign="left"
                          Width="300px" Height="15px" VerticalAlign="middle">
                        </asp:TableCell>
                      </asp:TableRow>
                                            
                      <asp:TableRow ID="TableRow9" runat="server">
                        <asp:TableCell ID="TableCell18" runat="server" HorizontalAlign="left"
                          Width="100px" Height="28px" VerticalAlign="middle">
                          <asp:Label ID="Label1" runat="server" Text="DWT:"></asp:Label>
                        </asp:TableCell>
                        <asp:TableCell ID="TableCell19" runat="server" HorizontalAlign="left"
                          Width="300px" Height="28px" VerticalAlign="middle">
                          <asp:TextBox ID="edtDWT" runat="server" Enabled="false" Columns="20" CssClass="entrada"></asp:TextBox>
                        </asp:TableCell>
                      </asp:TableRow>
 
                       <asp:TableRow ID="TableRow17" runat="server">
                        <asp:TableCell ID="TableCell34" runat="server" HorizontalAlign="left"
                          Width="100px" Height="15px" VerticalAlign="middle">
                        </asp:TableCell>                      
                        <asp:TableCell ID="TableCell35" runat="server" HorizontalAlign="left"
                          Width="300px" Height="15px" VerticalAlign="middle">
                        </asp:TableCell>
                      </asp:TableRow>
                      
                     <asp:TableRow ID="TableRow14" runat="server">
                        <asp:TableCell ID="TableCell28" runat="server" HorizontalAlign="left"
                          Width="100px" Height="28px" VerticalAlign="middle">
                          <asp:Label ID="Label6" runat="server" Text="GRT:"></asp:Label>
                        </asp:TableCell>
                        <asp:TableCell ID="TableCell29" runat="server" HorizontalAlign="left"
                          Width="300px" Height="28px" VerticalAlign="middle">
                          <asp:TextBox ID="edtGRT" runat="server" Enabled="false" Columns="20" CssClass="entrada"></asp:TextBox>
                        </asp:TableCell>
                      </asp:TableRow>

                      <asp:TableRow ID="TableRow10" runat="server">
                        <asp:TableCell ID="TableCell20" runat="server" HorizontalAlign="left"
                          Width="100px" Height="15px" VerticalAlign="middle">
                        </asp:TableCell>                      
                        <asp:TableCell ID="TableCell21" runat="server" HorizontalAlign="left"
                          Width="300px" Height="15px" VerticalAlign="middle">
                        </asp:TableCell>
                      </asp:TableRow>

                     <asp:TableRow ID="TableRow16" runat="server">
                        <asp:TableCell ID="TableCell32" runat="server" HorizontalAlign="left"
                          Width="100px" Height="28px" VerticalAlign="middle">
                          <asp:Label ID="Label7" runat="server" Text="LOA:"></asp:Label>
                        </asp:TableCell>
                        <asp:TableCell ID="TableCell33" runat="server" HorizontalAlign="left"
                          Width="300px" Height="28px" VerticalAlign="middle">
                          <asp:TextBox ID="edtLOA" runat="server" Enabled="false" Columns="20" CssClass="entrada"></asp:TextBox>
                        </asp:TableCell>
                      </asp:TableRow>

                      <asp:TableRow ID="TableRow15" runat="server">
                        <asp:TableCell ID="TableCell30" runat="server" HorizontalAlign="left"
                          Width="100px" Height="15px" VerticalAlign="middle">
                        </asp:TableCell>                      
                        <asp:TableCell ID="TableCell31" runat="server" HorizontalAlign="left"
                          Width="300px" Height="15px" VerticalAlign="middle">
                        </asp:TableCell>
                      </asp:TableRow>

                     <asp:TableRow ID="TableRow19" runat="server">
                        <asp:TableCell ID="TableCell38" runat="server" HorizontalAlign="left"
                          Width="100px" Height="28px" VerticalAlign="middle">
                          <asp:Label ID="Label9" runat="server" Text="Beam:"></asp:Label>
                        </asp:TableCell>
                        <asp:TableCell ID="TableCell39" runat="server" HorizontalAlign="left"
                          Width="300px" Height="28px" VerticalAlign="middle">
                          <asp:TextBox ID="edtBeam" runat="server" Enabled="false" Columns="20" CssClass="entrada"></asp:TextBox>
                        </asp:TableCell>
                      </asp:TableRow>
                      
                      <asp:TableRow ID="TableRow20" runat="server">
                        <asp:TableCell ID="TableCell40" runat="server" HorizontalAlign="left"
                          Width="100px" Height="15px" VerticalAlign="middle">
                        </asp:TableCell>                      
                        <asp:TableCell ID="TableCell41" runat="server" HorizontalAlign="left"
                          Width="300px" Height="15px" VerticalAlign="middle">
                        </asp:TableCell>
                      </asp:TableRow> 
 
                      <asp:TableRow ID="TableRow21" runat="server">
                        <asp:TableCell ID="TableCell42" runat="server" HorizontalAlign="left"
                          Width="100px" Height="28px" VerticalAlign="middle">
                          <asp:Label ID="Label10" runat="server" Text="TLX:"></asp:Label>
                        </asp:TableCell>
                        <asp:TableCell ID="TableCell43" runat="server" HorizontalAlign="left"
                          Width="300px" Height="28px" VerticalAlign="middle">
                          <asp:TextBox ID="edtTLX" runat="server" Enabled="false" Columns="20" CssClass="entrada"></asp:TextBox>
                        </asp:TableCell>
                      </asp:TableRow>
                      
                      <asp:TableRow ID="TableRow22" runat="server">
                        <asp:TableCell ID="TableCell44" runat="server" HorizontalAlign="left"
                          Width="100px" Height="15px" VerticalAlign="middle">
                        </asp:TableCell>                      
                        <asp:TableCell ID="TableCell45" runat="server" HorizontalAlign="left"
                          Width="300px" Height="15px" VerticalAlign="middle">
                        </asp:TableCell>
                      </asp:TableRow> 
                      
                      <asp:TableRow ID="TableRow7" runat="server">
                        <asp:TableCell ID="TableCell14" runat="server" HorizontalAlign="left"
                          Width="100px" Height="28px" VerticalAlign="middle">
                          <asp:Label ID="Label8" runat="server" Text="Telefone:"></asp:Label>
                        </asp:TableCell>
                        <asp:TableCell ID="TableCell15" runat="server" HorizontalAlign="left"
                          Width="300px" Height="28px" VerticalAlign="middle">
                          <asp:TextBox ID="edtTel" runat="server" Enabled="false" Columns="13" CssClass="entrada"></asp:TextBox>
                        </asp:TableCell>
                      </asp:TableRow>

                      <asp:TableRow ID="TableRow8" runat="server">
                        <asp:TableCell ID="TableCell16" runat="server" HorizontalAlign="left"
                          Width="100px" Height="15px" VerticalAlign="middle">
                        </asp:TableCell>                      
                        <asp:TableCell ID="TableCell17" runat="server" HorizontalAlign="left"
                          Width="300px" Height="15px" VerticalAlign="middle">
                        </asp:TableCell>
                      </asp:TableRow>

                      <asp:TableRow ID="TableRow11" runat="server">
                        <asp:TableCell ID="TableCell22" runat="server" HorizontalAlign="left"
                          Width="100px" Height="28px" VerticalAlign="middle">
                          <asp:Label ID="Label4" runat="server" Text="FAX:"></asp:Label>
                        </asp:TableCell>
                        <asp:TableCell ID="TableCell23" runat="server" HorizontalAlign="left"
                          Width="300px" Height="28px" VerticalAlign="middle">
                          <asp:TextBox ID="edtFax" runat="server" Enabled="false" Columns="13" CssClass="entrada"></asp:TextBox>
                        </asp:TableCell>
                      </asp:TableRow>
                      
                      <asp:TableRow ID="TableRow18" runat="server">
                        <asp:TableCell ID="TableCell36" runat="server" HorizontalAlign="left"
                          Width="100px" Height="15px" VerticalAlign="middle">
                        </asp:TableCell>                      
                        <asp:TableCell ID="TableCell37" runat="server" HorizontalAlign="left"
                          Width="300px" Height="15px" VerticalAlign="middle">
                        </asp:TableCell>
                      </asp:TableRow>                      
                      
                      <asp:TableRow ID="TableRow12" runat="server">
                        <asp:TableCell ID="TableCell24" runat="server" HorizontalAlign="left"
                          Width="100px" Height="28px" VerticalAlign="middle">
                          <asp:Label ID="Label5" runat="server" Text="E-Mail:"></asp:Label>
                        </asp:TableCell>
                        <asp:TableCell ID="TableCell25" runat="server" HorizontalAlign="left"
                          Width="300px" Height="28px" VerticalAlign="middle">
                          <asp:TextBox ID="edtEmail" runat="server" Enabled="false" Columns="50" CssClass="entrada"></asp:TextBox>
                        </asp:TableCell>
                      </asp:TableRow>
                      
                      <asp:TableRow ID="TableRow13" runat="server">
                        <asp:TableCell ID="TableCell26" runat="server" HorizontalAlign="left"
                          Width="100px" Height="15px" VerticalAlign="middle">
                        </asp:TableCell>                      
                        <asp:TableCell ID="TableCell27" runat="server" HorizontalAlign="left"
                          Width="300px" Height="15px" VerticalAlign="middle">
                        </asp:TableCell>
                      </asp:TableRow>
                       
                    </asp:Table>
                  </asp:TableCell>
                </asp:TableRow>
              </asp:Table>
            </asp:TableCell>
          </asp:TableRow>
        </asp:Table>
      </div>
  </form>
</body>
</html>
