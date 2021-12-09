//////////////////////////////////////////////////////////////////////////
// Criacao...........: 04/2006
// Sistema...........: Site da Aquarius Maritime
// Analistas.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Desenvolvedores...: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Copyright.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

using System;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.SessionState;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

public partial class Navio : System.Web.UI.Page
{
  static DataSet dsAqua;
  static SqlDataAdapter sdaVessel;
  static string strCnx = "Data Source=200.234.197.30;Initial Catalog=aquariusmaritime;Persist Security Info=True;User ID=aquariusmaritime;Password=aquaweb2812";
  static int iPos;
  static bool lAlt = false;

  void BindDataSet()
  {
    if (!dsAqua.IsInitialized)
      BuildDataSet();

    if (btnNovo.Enabled)
    {
      try
      {
        txtCodigo.Text  = (string)dsAqua.Tables["Vessel"].Rows[iPos]["VesselID"];
        txtNome.Text    = (string)dsAqua.Tables["Vessel"].Rows[iPos]["Name"];
        txtExNome.Text  = (string)dsAqua.Tables["Vessel"].Rows[iPos]["ExName"];
        txtDWT.Text     = (string)dsAqua.Tables["Vessel"].Rows[iPos]["DWT"];
        txtGRT.Text     = (string)dsAqua.Tables["Vessel"].Rows[iPos]["GRT"];
        txtNRT.Text     = (string)dsAqua.Tables["Vessel"].Rows[iPos]["NRT"];
        txtLOA.Text     = (string)dsAqua.Tables["Vessel"].Rows[iPos]["LOA"];
        txtBeam.Text    = (string)dsAqua.Tables["Vessel"].Rows[iPos]["Beam"];
        txtTLX.Text     = (string)dsAqua.Tables["Vessel"].Rows[iPos]["TLX"];
        txtTel.Text     = (string)dsAqua.Tables["Vessel"].Rows[iPos]["TEL"];
        txtFax.Text     = (string)dsAqua.Tables["Vessel"].Rows[iPos]["FAX"];
        txtEMail.Text   = (string)dsAqua.Tables["Vessel"].Rows[iPos]["EMail"];
        txtProp.Text    = (string)dsAqua.Tables["Vessel"].Rows[iPos]["Owners"];
      }
      catch (Exception)
      {
        txtCodigo.Text = "";
        txtNome.Text   = "";
        txtExNome.Text = "";
        txtDWT.Text    = "";
        txtGRT.Text    = "";
        txtNRT.Text    = "";
        txtLOA.Text    = "";
        txtBeam.Text   = "";
        txtTLX.Text    = "";
        txtTel.Text    = "";
        txtFax.Text    = "";
        txtEMail.Text  = "";
        txtProp.Text   = "";
      }
      
    }
  }

  void BuildDataSet()
  {
    string strSQLVessel = "SELECT * FROM Vessel";
    drpTipo.Items.Add(new ListItem("General Cargo"));
    drpTipo.Items.Add(new ListItem("Container Ship"));
    drpTipo.Items.Add(new ListItem("Tanker"));
    drpTipo.Items.Add(new ListItem("Tugboat"));
    drpTipo.Items.Add(new ListItem("PCC"));

    SqlConnection cnx = new SqlConnection(strCnx);
    sdaVessel = new SqlDataAdapter(strSQLVessel, cnx);
    dsAqua = new DataSet();
    sdaVessel.Fill(dsAqua, "Vessel");
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
      Session["Page"] = "Navio.aspx";
      BuildDataSet();
      iPos = 0;
    }
    BindDataSet();
  }


  protected void btnGravar_Click(object sender, EventArgs e)
  {
    string strCmd;
    
    if(!lAlt)
    {
      strCmd = "INSERT INTO Vessel (VesselID, Name, ExName, Type, DWT, GRT, NRT, LOA, Beam, TLX, TEL, FAX, EMail, Owners)"+
               " VALUES (@VesselID, @Name, @ExName, @Tipo, @DWT, @GRT, @NRT, @LOA, @Beam, @TLX, @TEL, @FAX, @EMail, @Cliente)";
    }
    else
    {
      strCmd = "UPDATE Vessel SET VesselID = @VesselID, Name = @Name , ExName = @ExName, Type = @Tipo, DWT = @DWT, GRT = @GRT,"+
               " NRT = @NRT, LOA = @LOA, Beam = @Beam, TLX = @TLX, TEL = @TEL, FAX = @FAX, EMail = @EMail, Owners = @Cliente"+
               " WHERE VesselID = @VesselID";
    }
     
    lAlt = false;     
    SqlConnection cnx = new SqlConnection(strCnx);

    SqlCommand Cmd = new SqlCommand(strCmd, cnx);
    Cmd.Parameters.Add(new SqlParameter("@VesselID", SqlDbType.VarChar, 10));
    Cmd.Parameters["@VesselID"].Value = txtCodigo.Text;
    Cmd.Parameters.Add(new SqlParameter("@Name", SqlDbType.VarChar, 30));
    Cmd.Parameters["@Name"].Value = txtNome.Text;
    Cmd.Parameters.Add(new SqlParameter("@ExName", SqlDbType.VarChar, 50));
    Cmd.Parameters["@ExName"].Value = txtExNome.Text;
    Cmd.Parameters.Add(new SqlParameter("@DWT", SqlDbType.VarChar, 20));
    Cmd.Parameters["@DWT"].Value = txtDWT.Text;
    Cmd.Parameters.Add(new SqlParameter("@GRT", SqlDbType.VarChar, 20));
    Cmd.Parameters["@GRT"].Value = txtGRT.Text;
    Cmd.Parameters.Add(new SqlParameter("@NRT", SqlDbType.VarChar, 20));
    Cmd.Parameters["@NRT"].Value = txtGRT.Text;
    Cmd.Parameters.Add(new SqlParameter("@LOA", SqlDbType.VarChar, 20));
    Cmd.Parameters["@LOA"].Value = txtLOA.Text;
    Cmd.Parameters.Add(new SqlParameter("@Beam", SqlDbType.VarChar, 20));
    Cmd.Parameters["@Beam"].Value = txtBeam.Text;
    Cmd.Parameters.Add(new SqlParameter("@TLX", SqlDbType.VarChar, 20));
    Cmd.Parameters["@TLX"].Value = txtTLX.Text;
    Cmd.Parameters.Add(new SqlParameter("@TEL", SqlDbType.VarChar, 20));
    Cmd.Parameters["@TEL"].Value = txtTel.Text;
    Cmd.Parameters.Add(new SqlParameter("@FAX", SqlDbType.VarChar, 20));
    Cmd.Parameters["@FAX"].Value = txtFax.Text;
    Cmd.Parameters.Add(new SqlParameter("@EMail", SqlDbType.VarChar, 20));
    Cmd.Parameters["@EMAil"].Value = txtEMail.Text;
    Cmd.Parameters.Add(new SqlParameter("@Tipo", SqlDbType.VarChar, 20));
    Cmd.Parameters["@Tipo"].Value = drpTipo.SelectedItem.Text;
    Cmd.Parameters.Add(new SqlParameter("@Cliente", SqlDbType.VarChar, 200));
    Cmd.Parameters["@Cliente"].Value = txtProp.Text;
    Cmd.Connection.Open();
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
      cnx.Close();
    }

    vldCodigo.Enabled  = false;
    vldNome.Enabled    = false;
    vldProp.Enabled    = false;
    vldTipo.Enabled    = false;
    
    vldCodigo.IsValid  = true;
    vldNome.IsValid    = true;
    vldProp.IsValid    = true;
    vldTipo.IsValid    = true;
    
    txtCodigo.Enabled = false;
    txtNome.Enabled   = false;  
    txtExNome.Enabled = false;
    txtDWT.Enabled    = false;
    txtGRT.Enabled    = false;
    txtNRT.Enabled    = false;
    txtLOA.Enabled    = false;
    txtBeam.Enabled   = false;
    txtTLX.Enabled    = false;
    txtTel.Enabled    = false;
    txtFax.Enabled    = false;
    txtEMail.Enabled  = false;
    txtProp.Enabled   = false;
    
    drpTipo.Enabled    = false;
    linRetorno.Enabled = true;

    btnGravar.Enabled   = false;
    btnCancelar.Enabled = false;
    btnNovo.Enabled     = true;
    btnAlterar.Enabled  = true;
    btnApagar.Enabled   = true;
    btnAnterior.Enabled = true;
    btnProximo.Enabled  = true;
  }

  protected void btnNovo_Click(object sender, EventArgs e)
  {
    txtCodigo.Enabled = true;
    txtNome.Enabled   = true;
    txtExNome.Enabled = true;
    txtDWT.Enabled    = true;
    txtGRT.Enabled    = true;
    txtNRT.Enabled    = true;
    txtLOA.Enabled    = true;
    txtBeam.Enabled   = true;
    txtTLX.Enabled    = true;
    txtTel.Enabled    = true;
    txtFax.Enabled    = true;
    txtEMail.Enabled  = true;
    txtProp.Enabled   = true;
    
    drpTipo.Enabled    = true;
    linRetorno.Enabled = false;

    vldCodigo.Enabled  = true;
    vldNome.Enabled    = true;
    vldProp.Enabled    = true;
    vldTipo.Enabled    = true;

    btnGravar.Enabled   = true;
    btnCancelar.Enabled = true;   
    btnNovo.Enabled     = false;
    btnProximo.Enabled  = false;
    btnAnterior.Enabled = false;
    btnApagar.Enabled   = false;
    btnAlterar.Enabled  = false;

    txtCodigo.Text = "";
    txtNome.Text   = "";
    txtExNome.Text = "";
    txtDWT.Text    = "";
    txtGRT.Text    = "";
    txtNRT.Text    = "";
    txtLOA.Text    = "";
    txtBeam.Text   = "";
    txtTLX.Text    = "";
    txtTel.Text    = "";
    txtFax.Text    = "";
    txtEMail.Text  = ""; 
    txtProp.Text   = "";

    txtCodigo.Focus();
  }

  protected void btnCancelar_Click(object sender, EventArgs e)
  {
    vldCodigo.Enabled  = false;
    vldNome.Enabled    = false;
    vldProp.Enabled    = false;
    vldTipo.Enabled    = false;

    vldCodigo.IsValid  = true;
    vldNome.IsValid    = true;
    vldProp.IsValid    = true;
    vldTipo.IsValid    = true;

    txtCodigo.Enabled = false;
    txtNome.Enabled   = false;
    txtExNome.Enabled = false;
    txtDWT.Enabled    = false;
    txtGRT.Enabled    = false;
    txtNRT.Enabled    = false;
    txtLOA.Enabled    = false;
    txtBeam.Enabled   = false;
    txtTLX.Enabled    = false;
    txtTel.Enabled    = false;
    txtFax.Enabled    = false;
    txtEMail.Enabled  = false;
    txtProp.Enabled   = false;
    
    drpTipo.Enabled    = false;
    linRetorno.Enabled = true;

    btnGravar.Enabled   = false;
    btnCancelar.Enabled = false;
    btnNovo.Enabled     = true;
    btnAlterar.Enabled  = true;
    btnApagar.Enabled   = true;
    btnAnterior.Enabled = true;
    btnProximo.Enabled  = true;
  }

  protected void btnAnterior_Click(object sender, ImageClickEventArgs e)
  {
    if ((--iPos) < 0)
      iPos = 0;
    BindDataSet();
  }

  protected void btnProximo_Click(object sender, ImageClickEventArgs e)
  {
    if ((++iPos) > (dsAqua.Tables["Vessel"].Rows.Count - 1))
      iPos = dsAqua.Tables["Vessel"].Rows.Count - 1;
    BindDataSet();
  }

  protected void btnAlterar_Click(object sender, ImageClickEventArgs e)
  {
    txtNome.Enabled   = true;
    txtExNome.Enabled = true;
    txtDWT.Enabled    = true;
    txtGRT.Enabled    = true;
    txtNRT.Enabled    = true;
    txtLOA.Enabled    = true;
    txtBeam.Enabled   = true;
    txtTLX.Enabled    = true;
    txtTel.Enabled    = true;
    txtFax.Enabled    = true;
    txtEMail.Enabled  = true;
    txtProp.Enabled   = true;
    
    drpTipo.Enabled    = true;
    linRetorno.Enabled = false;

    vldCodigo.Enabled  = true;
    vldNome.Enabled    = true;
    vldProp.Enabled    = true;
    vldTipo.Enabled    = true;

    btnGravar.Enabled   = true;
    btnCancelar.Enabled = true;
    btnNovo.Enabled     = false;
    btnProximo.Enabled  = false;
    btnAnterior.Enabled = false;
    btnApagar.Enabled   = false;
    btnAlterar.Enabled  = false;
    
    lAlt = true;
    txtNome.Focus();
  }

  protected void btnApagar_Click(object sender, ImageClickEventArgs e)
  {
    SqlConnection cnx = new SqlConnection(strCnx);
    string sChave = txtCodigo.Text;
    string strSQLUsers = "DELETE FROM Vessel WHERE VesselID = " + sChave;
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
