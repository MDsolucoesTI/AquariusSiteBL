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

partial class Cliente : System.Web.UI.Page
{
  DataSet dsAqua;
  SqlDataAdapter sdaClient;
  static string strCnx = "Data Source=200.234.197.30;Initial Catalog=aquariusmaritime;Persist Security Info=True;User ID=aquariusmaritime;Password=aquaweb2812";
  static int iPos;
  static bool lAlt = false;

  void BindDataSet()
  {
    BuildDataSet();

    if (btnNovo.Enabled)
    {
      try
      {
        txtCodigo.Text    = System.Convert.ToString(dsAqua.Tables["Client"].Rows[iPos]["CodClient"]);
        txtNome.Text      = (string)dsAqua.Tables["Client"].Rows[iPos]["Company"];
        txtContato.Text   = (string)dsAqua.Tables["Client"].Rows[iPos]["Contact"];
        txtTel.Text       = (string)dsAqua.Tables["Client"].Rows[iPos]["Telephone"];
        txtCel.Text       = (string)dsAqua.Tables["Client"].Rows[iPos]["CelularPhone"];
        txtFax.Text       = (string)dsAqua.Tables["Client"].Rows[iPos]["Fax"];
        txtEMail.Text     = (string)dsAqua.Tables["Client"].Rows[iPos]["EMail"];
        txtAtividade.Text = (string)dsAqua.Tables["Client"].Rows[iPos]["Activity"];
        txtMotivo.Text    = (string)dsAqua.Tables["Client"].Rows[iPos]["Cause"];
      }
      catch (Exception)
      {
        txtCodigo.Text    = "";
        txtNome.Text      = "";
        txtContato.Text   = "";
        txtTel.Text       = "";
        txtCel.Text       = "";
        txtFax.Text       = "";
        txtEMail.Text     = "";
        txtAtividade.Text = "";
        txtMotivo.Text    = "";
      }

    }
  }

  void BuildDataSet()
  {
    string strSQLClient = "SELECT * FROM Client ORDER BY Company";

    SqlConnection cnx = new SqlConnection(strCnx);

    sdaClient = new SqlDataAdapter(strSQLClient, cnx);

    dsAqua = new DataSet();
    sdaClient.Fill(dsAqua, "Client");

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
    sLib  = "loc";
    try
    {
      sName = (string)Session["Name"];
      sType = (string)Session["Type"];
      sLib  = (string)Session["Status"];
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

    if(!Page.IsPostBack)
    {
      Session["Page"] = "Cliente.aspx";
      iPos = 0;
    }
    BindDataSet();
  }


  protected void btnGravar_Click(object sender, EventArgs e)
  {
    string strCmd;  
    if(!lAlt)    
    {  
      strCmd = "INSERT INTO Client (Company, Contact, Telephone, CelularPhone, Fax, EMail, Activity, Cause)"+
               " VALUES (@Name, @Contact, @Tel, @Cel, @Fax, @Email, @Ativ, @Moti)";
    }
    else
    {
      strCmd = "UPDATE Client SET Company = @Name, Contact = @Contact, Telephone = @Tel, CelularPhone = @Cel,"+
               " Fax = @Fax, EMail = @Email, Activity = @Ativ, Cause = @Moti WHERE ID = @Codigo";
    }
    
    
    SqlConnection cnx = new SqlConnection(strCnx);
    
    SqlCommand Cmd = new SqlCommand(strCmd, cnx);
    if(lAlt)
    {
      Cmd.Parameters.Add(new SqlParameter("@Codigo", SqlDbType.Int));
      Cmd.Parameters["@Codigo"].Value = System.Convert.ToInt32(txtCodigo.Text);
    }
    Cmd.Parameters.Add(new SqlParameter("@Name", SqlDbType.VarChar, 50));
    Cmd.Parameters["@Name"].Value = txtNome.Text;
    Cmd.Parameters.Add(new SqlParameter("@Contact", SqlDbType.VarChar, 40));
    Cmd.Parameters["@Contact"].Value = txtContato.Text;
    Cmd.Parameters.Add(new SqlParameter("@Tel", SqlDbType.VarChar, 13));
    Cmd.Parameters["@Tel"].Value = txtTel.Text;
    Cmd.Parameters.Add(new SqlParameter("@Cel", SqlDbType.VarChar, 13));
    Cmd.Parameters["@Cel"].Value = txtCel.Text;
    Cmd.Parameters.Add(new SqlParameter("@Fax", SqlDbType.VarChar, 13));
    Cmd.Parameters["@Fax"].Value = txtFax.Text;
    Cmd.Parameters.Add(new SqlParameter("@Email", SqlDbType.VarChar, 50));
    Cmd.Parameters["@Email"].Value = txtEMail.Text;
    Cmd.Parameters.Add(new SqlParameter("@Ativ", SqlDbType.VarChar, 30));
    Cmd.Parameters["@Ativ"].Value = txtAtividade.Text;
    Cmd.Parameters.Add(new SqlParameter("@Moti", SqlDbType.VarChar, 100));
    Cmd.Parameters["@Moti"].Value = txtMotivo.Text;
    Cmd.Connection.Open();
    lAlt = false;
    try
    {
      Cmd.ExecuteNonQuery();
    }
    catch (Exception)
    {
      Response.Redirect("ErroDados.aspx");
    }
    finally
    {
      Cmd.Connection.Close();
    }

    vldNome.Enabled  = false;
    vldEMail.Enabled = false;
    vldTel.Enabled   = false;
    vldNome.IsValid  = true ;
    vldEMail.IsValid = true ;
    vldTel.IsValid   = true ;

    txtNome.Enabled      = false;
    txtContato.Enabled   = false;
    txtTel.Enabled       = false;
    txtCel.Enabled       = false;
    txtFax.Enabled       = false;
    txtEMail.Enabled     = false;
    txtAtividade.Enabled = false;
    txtMotivo.Enabled    = false;

    btnGravar.Visible   = false;
    btnCancelar.Visible = false;
    btnNovo.Visible     = true ;
    btnAlterar.Visible  = true ;
    btnApagar.Visible   = true ;
    btnAnterior.Visible = true ;
    btnProximo.Visible  = true ;

    BindDataSet();
  }

  protected void btnNovo_Click(object sender, EventArgs e)
  {
    txtNome.Enabled      = true;
    txtContato.Enabled   = true;
    txtTel.Enabled       = true;
    txtCel.Enabled       = true;
    txtFax.Enabled       = true;
    txtEMail.Enabled     = true;
    txtAtividade.Enabled = true;
    txtMotivo.Enabled    = true;

    vldNome.Enabled  = true;
    vldEMail.Enabled = true;
    vldTel.Enabled   = true;

    btnGravar.Visible   = true ;
    btnCancelar.Visible = true ;
    btnNovo.Visible     = false;
    btnProximo.Visible  = false;
    btnAnterior.Visible = false;
    btnApagar.Visible   = false;
    btnAlterar.Visible  = false;
    
    txtCodigo.Text    = "";
    txtNome.Text      = "";
    txtContato.Text   = "";
    txtTel.Text       = "";
    txtCel.Text       = "";
    txtFax.Text       = "";
    txtEMail.Text     = "";
    txtAtividade.Text = "";
    txtMotivo.Text    = "";
    txtNome.Focus();
  }

  protected void btnCancelar_Click(object sender, EventArgs e)
  {
    vldNome.Enabled  = false;
    vldEMail.Enabled = false;
    vldTel.Enabled   = false;
    vldNome.IsValid  = true ;
    vldEMail.IsValid = true ;
    vldTel.IsValid   = true ;

    txtNome.Enabled      = false;
    txtContato.Enabled   = false;
    txtTel.Enabled       = false;
    txtCel.Enabled       = false;
    txtFax.Enabled       = false;
    txtEMail.Enabled     = false;
    txtAtividade.Enabled = false;
    txtMotivo.Enabled    = false;

    btnGravar.Visible   = false;
    btnCancelar.Visible = false;
    btnNovo.Visible     = true ;
    btnAlterar.Visible  = true ;
    btnApagar.Visible   = true ;
    btnAnterior.Visible = true ;
    btnProximo.Visible  = true ;
  }

  protected void btnAnterior_Click(object sender, ImageClickEventArgs e)
  {
    if ((--iPos) < 0)
      iPos = 0;
    BindDataSet();
  }

  protected void btnProximo_Click(object sender, ImageClickEventArgs e)
  {
    if ((++iPos) > (dsAqua.Tables["Client"].Rows.Count - 1))
      iPos = dsAqua.Tables["Client"].Rows.Count - 1;
    BindDataSet();
  }

  protected void btnAlterar_Click(object sender, ImageClickEventArgs e)
  {
    txtNome.Enabled      = true;
    txtContato.Enabled   = true;
    txtTel.Enabled       = true;
    txtCel.Enabled       = true;
    txtFax.Enabled       = true;
    txtEMail.Enabled     = true;
    txtAtividade.Enabled = true;
    txtMotivo.Enabled    = true;

    vldNome.Enabled  = true;
    vldEMail.Enabled = true;
    vldTel.Enabled   = true;

    btnGravar.Visible   = true;
    btnCancelar.Visible = true;
    btnNovo.Visible     = false;
    btnProximo.Visible  = false;
    btnAnterior.Visible = false;
    btnApagar.Visible   = false;
    btnAlterar.Visible  = false;
    lAlt = true;
    txtNome.Focus();
  }

  protected void btnApagar_Click(object sender, ImageClickEventArgs e)
  {
    SqlConnection cnx = new SqlConnection(strCnx);
    string sChave = txtCodigo.Text;
    string strSQLUsers = "DELETE FROM Client WHERE CodClient = " + sChave;
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

    BindDataSet();
  }

  protected void btnASPnet_Click(object sender, ImageClickEventArgs e)
  {
    Response.Redirect("http://www.asp.net/");
  }

  protected void btnMD_Click(object sender, ImageClickEventArgs e)
  {
    Response.Redirect("https://md.dev.br");
  }
   
  protected void btnBusca_Click(object sender, ImageClickEventArgs e)
  {
    DataSet dsPesquisa;
    SqlDataAdapter sdaPCli;
    SqlConnection cnx = new SqlConnection(strCnx);
    
    string sChave = txtPesNome.Text+"%";
    string strSQLUsers = "SELECT * FROM Client WHERE Company LIKE UPPER('"+sChave+"')";
    
    sdaPCli = new SqlDataAdapter(strSQLUsers, cnx);

    dsPesquisa = new DataSet();
    sdaPCli.Fill(dsPesquisa, "Client");
    

//    SqlCommand cmd = new SqlCommand(strSQLUsers, cnx);
 //   cmd.Connection.Open();
//    try
//    {
 //     cmd.ExecuteReader();
      if (dsPesquisa.Tables["Client"].Rows.Count > 0)
      {
        txtCodigo.Text    = System.Convert.ToString(dsPesquisa.Tables["Client"].Rows[0]["CodClient"]);
        txtNome.Text      = (string)dsPesquisa.Tables["Client"].Rows[0]["Company"];
        txtContato.Text   = (string)dsPesquisa.Tables["Client"].Rows[0]["Contact"];
        txtTel.Text       = (string)dsPesquisa.Tables["Client"].Rows[0]["Telephone"];
        txtCel.Text       = (string)dsPesquisa.Tables["Client"].Rows[0]["CelularPhone"];
        txtFax.Text       = (string)dsPesquisa.Tables["Client"].Rows[0]["Fax"];
        txtEMail.Text     = (string)dsPesquisa.Tables["Client"].Rows[0]["EMail"];
        txtAtividade.Text = (string)dsPesquisa.Tables["Client"].Rows[0]["Activity"];
        txtMotivo.Text    = (string)dsPesquisa.Tables["Client"].Rows[0]["Cause"];
        pnlBusca.Visible  = false;
      }
  //  }
 //   catch (Exception)
 //   {
 //     Response.Redirect("ErroDados.aspx");
 //   }
//    finally
//    {
      cnx.Close();
 //   }
  }
  protected void btnLocal_Click(object sender, ImageClickEventArgs e)
  {
    pnlBusca.Visible = true;
    txtPesNome.Text = "";
    txtPesNome.Focus();
  }
}

