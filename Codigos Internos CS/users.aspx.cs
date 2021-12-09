//////////////////////////////////////////////////////////////////////////
// Criacao...........: 04/2006
// Sistema...........: Site da Aquarius Maritime
// Analistas.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Desenvolvedores...: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Copyright.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

using System;
using System.Collections;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Web;
using System.Web.SessionState;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;

partial class users : System.Web.UI.Page
{
  static DataSet dsAqua; 
  static SqlDataAdapter sdaUsers;
  static SqlDataAdapter sdaClient;
  static string strCnx = "Data Source=200.234.197.30;Initial Catalog=aquariusmaritime;Persist Security Info=True;User ID=aquariusmaritime;Password=aquaweb2812";
  static int iPos;
  static bool lAlt = false;

  void BindDataSet()
  {
    if (!dsAqua.IsInitialized)
      BuildDataSet();

    if (btnNovo.Visible)
    {
      txtNomeUser.Text = (string)dsAqua.Tables["Users"].Rows[iPos]["UserView"];
      txtNomeLog.Text  = (string)dsAqua.Tables["Users"].Rows[iPos]["UserName"];
      txtSenha.Text    = (string)dsAqua.Tables["Users"].Rows[iPos]["Password"];
      txtDtReg.Text    = System.Convert.ToString(dsAqua.Tables["Users"].Rows[iPos]["DataRegister"]);
      txtDtExp.Text    = System.Convert.ToString(dsAqua.Tables["Users"].Rows[iPos]["Expire"]);
      string IDClient  = System.Convert.ToString(dsAqua.Tables["Users"].Rows[iPos]["CodClient"]);
      string sTipo     = (string)dsAqua.Tables["Users"].Rows[iPos]["Class"];
      if (IDClient != null)
        foreach (ListItem item in drpCliente.Items)
          if (item.Value == IDClient)
            drpCliente.SelectedIndex = drpCliente.Items.IndexOf(item);
      if (sTipo != null)
        foreach (ListItem item in drpTipo.Items)
          if (item.Value == sTipo)
            drpTipo.SelectedIndex = drpTipo.Items.IndexOf(item);
    }
  }

  void BuildDataSet()
  {
    string strSQLUsers = "SELECT * FROM Users";
    string strSQLClient = "SELECT CodClient, Company FROM Client ORDER BY Company";

    drpTipo.Items.Add(new ListItem("Administrador", "adm"));
    drpTipo.Items.Add(new ListItem("Operador", "ope"));
    drpTipo.Items.Add(new ListItem("Cliente", "cli"));
    drpTipo.Items.Add(new ListItem("Visitante", "vis"));
    
    SqlConnection cnx = new SqlConnection(strCnx);

    sdaUsers = new SqlDataAdapter(strSQLUsers, cnx);
    sdaClient = new SqlDataAdapter(strSQLClient, cnx);

    dsAqua = new DataSet();
    sdaUsers.Fill(dsAqua, "Users");
    sdaClient.Fill(dsAqua, "Client");

    int iReg = 0;
    drpCliente.Items.Add(new ListItem("Nenhum"," "));
    for(iReg=0; iReg < dsAqua.Tables["Client"].Rows.Count; iReg++)
      drpCliente.Items.Add(new ListItem((string)dsAqua.Tables["Client"].Rows[iReg]["Company"],System.Convert.ToString(dsAqua.Tables["Client"].Rows[iReg]["CodClient"])));

    cnx.Close();
  }

  protected void Page_Load(object sender, EventArgs e)
  {
    string sName;
    string sType;
    string sLib;
    int iHour = DateTime.Now.Hour;

    sName = "Anonimo";
    sType = "vis";
    sLib = "loc";
    try
    {
      sName = (string)Session["Name"];
      sType = (string)Session["Type"];
      sLib = (string)Session["Status"];
    }
    catch (Exception)
    {
      Response.Redirect("Erro.aspx");
    }
    if (sLib != "free")
      Response.Redirect("Erro.aspx");
    if ((sType != "adm") && (sType != "ope"))
      Response.Redirect("Erro.aspx");
    if (iHour < 12)
      lblSaudacao.Text = "Bom Dia";
    else if ((iHour >= 12) && (iHour < 18))
      lblSaudacao.Text = "Boa Tarde";
    else
      lblSaudacao.Text = "Boa Noite";
    lblNome.Text = sName;
    if (!IsPostBack)
    {
      BuildDataSet();
      iPos = 0;
    }
    BindDataSet();
  }


  protected void btnGravar_Click(object sender, EventArgs e)
  {
    string strCmd;
    string strPass;
    
    if(!lAlt)
    {
      strCmd = "INSERT INTO Users (UserName, UserView, Password, DataRegister, Expire, Class, CodClient)"+
               " VALUES (@Name, @View, @Pass, @DtReg, @Expire, @Class, @Cliente)";
    }
    else
    {
      if (drpCliente.SelectedItem.Text != "Nenhum")
      {
        strCmd = "UPDATE Users SET UserName = @Name, UserView = @View, Password = @Pass, DataRegister = @DtReg,"+
                 " Expire = @Expire, Class = @Class, CodClient = @Cliente WHERE UserName = @Name";
      }
      else
      {
        strCmd = "UPDATE Users SET UserName = @Name, UserView = @View, Password = @Pass, DataRegister = @DtReg," +
                 " Expire = @Expire, Class = @Class WHERE UserName = @Name";
      }      
    }    
    
    lAlt = false;
    strPass = txtSenha.Text;
    
    SqlConnection cnx = new SqlConnection(strCnx);

    SqlCommand Cmd = new SqlCommand(strCmd,cnx);
    Cmd.Parameters.Add(new SqlParameter("@Name", SqlDbType.VarChar,20));
    Cmd.Parameters["@Name"].Value = txtNomeLog.Text;
    Cmd.Parameters.Add(new SqlParameter("@View", SqlDbType.VarChar,40));
    Cmd.Parameters["@View"].Value = txtNomeUser.Text;
    Cmd.Parameters.Add(new SqlParameter("@Pass", SqlDbType.VarChar, 20));
    Cmd.Parameters["@Pass"].Value = strPass;
    Cmd.Parameters.Add(new SqlParameter("@DtReg", SqlDbType.DateTime));
    Cmd.Parameters["@DtReg"].Value = System.Convert.ToDateTime(txtDtReg.Text);
    Cmd.Parameters.Add(new SqlParameter("@Expire", SqlDbType.DateTime));
    Cmd.Parameters["@Expire"].Value = System.Convert.ToDateTime(txtDtExp.Text);
    Cmd.Parameters.Add(new SqlParameter("@Class", SqlDbType.VarChar, 3));
    Cmd.Parameters["@Class"].Value = drpTipo.SelectedItem.Value;
    
    if (drpCliente.SelectedItem.Text != "Nenhum")
    {
      Cmd.Parameters.Add(new SqlParameter("@Cliente", SqlDbType.Int));
      Cmd.Parameters["@Cliente"].Value = System.Convert.ToInt32(drpCliente.SelectedItem.Value);
    }
    
    Cmd.Connection.Open();
    try
    {
      Cmd.ExecuteNonQuery();
    }
    catch(Exception)
    {
      Response.Redirect("ErroDados.aspx");
    }
    finally
    {
      cnx.Close();
    }
  
    vldNomeUser.Enabled = false;
    vldNomeLog.Enabled  = false;
    vldSenha.Enabled    = false;
    vldNomeUser.IsValid = true;
    vldNomeLog.IsValid  = true;
    vldSenha.IsValid    = true;
    
    txtNomeLog.Enabled  = false;
    txtNomeUser.Enabled = false;
    txtSenha.Enabled    = false;
    txtDtReg.Enabled    = false;
    txtDtExp.Enabled    = false;
    drpCliente.Enabled  = false;
    drpTipo.Enabled     = false;
    
    btnGravar.Visible   = false;
    btnCancelar.Visible = false;
    linRetorno.Visible  = true;
    btnNovo.Visible     = true;
    btnAlterar.Visible  = true;
    btnApagar.Visible   = true;
    btnAnterior.Visible = true;
    btnProximo.Visible  = true;
  }

  protected void btnNovo_Click(object sender,EventArgs e)
  {
    txtNomeLog.Enabled  = true;
    txtNomeUser.Enabled = true;
    txtSenha.Enabled    = true;
    txtDtReg.Enabled    = true;
    txtDtExp.Enabled    = true;
    drpCliente.Enabled  = true;
    drpTipo.Enabled     = true;
    
    vldNomeLog.Enabled  = true;
    vldNomeUser.Enabled = true;
    vldSenha.Enabled    = true;
    linRetorno.Enabled  = false;   
    
    btnGravar.Visible   = true;
    btnCancelar.Visible = true;
    btnNovo.Visible     = false;
    btnProximo.Visible  = false;
    btnAnterior.Visible = false;
    btnApagar.Visible   = false;
    btnAlterar.Visible  = false;
    
    txtNomeUser.Text = "";
    txtNomeLog.Text  = "";
    txtSenha.Text    = "";
    txtDtReg.Text    = "";
    txtDtExp.Text    = "";
    
    txtNomeUser.Focus();
  }

  protected void btnCancelar_Click(object sender, EventArgs e)
  {
    txtNomeLog.Enabled  = false;
    txtNomeUser.Enabled = false;
    txtSenha.Enabled    = false;
    txtDtReg.Enabled    = false;
    txtDtExp.Enabled    = false;
    drpCliente.Enabled  = false;
    drpTipo.Enabled     = false;
    
    vldNomeLog.Enabled  = false;
    vldNomeUser.Enabled = false;
    vldSenha.Enabled    = false;
    vldNomeLog.IsValid  = true;
    vldNomeUser.IsValid = true;
    vldSenha.IsValid    = true;
    linRetorno.Enabled  = true;
    
    btnGravar.Visible   = false;
    btnCancelar.Visible = false;
    btnNovo.Visible     = true;
    btnProximo.Visible  = true;
    btnAnterior.Visible = true;
    btnApagar.Visible   = true;
    btnAlterar.Visible  = true;
  }

  protected void btnAnterior_Click(object sender, ImageClickEventArgs e)
  {
    if((--iPos) < 0)
      iPos = 0;
    BindDataSet();
  }

  protected void btnProximo_Click(object sender, ImageClickEventArgs e)
  {
    if ((++iPos) > (dsAqua.Tables["Users"].Rows.Count - 1))
      iPos = dsAqua.Tables["Users"].Rows.Count - 1;
    BindDataSet();
  }

  protected void btnAlterar_Click(object sender, ImageClickEventArgs e)
  {
    txtNomeLog.Enabled  = true;
    txtNomeUser.Enabled = true;
    txtSenha.Enabled    = true;
    txtDtReg.Enabled    = true;
    txtDtExp.Enabled    = true;
    drpCliente.Enabled  = true;
    drpTipo.Enabled     = true;
    
    vldNomeLog.Enabled  = true;
    vldNomeUser.Enabled = true;
    vldSenha.Enabled    = true;    
    linRetorno.Enabled  = false; 
       
    btnGravar.Visible   = true;
    btnCancelar.Visible = true;
    btnNovo.Visible     = false;
    btnProximo.Visible  = false;
    btnAnterior.Visible = false;
    btnApagar.Visible   = false;
    btnAlterar.Visible  = false;
    lAlt = true;
    txtNomeLog.Focus();
  }

  protected void btnApagar_Click(object sender, ImageClickEventArgs e)
  {
    SqlConnection cnx = new SqlConnection(strCnx);
    string sChave = txtNomeLog.Text;
    string strSQLUsers = "DELETE FROM Users WHERE UserName = " + sChave;
    SqlCommand cmd = new SqlCommand(strSQLUsers, cnx);
    cmd.Connection.Open();
    try
    {
      cmd.ExecuteNonQuery();
    }
    catch (Exception)
    {
      Response.Redirect("ErroDados.aspx");
    }
    finally
    {
      cmd.Connection.Close();
    }
  }
  
  protected void btnASPnet_Click(object sender, ImageClickEventArgs e)
  {
    Response.Redirect("http://www.asp.net/");
  }

  protected void btnMD_Click(object sender, ImageClickEventArgs e)
  {
    Response.Redirect("https://md.dev.br");
  }
}
