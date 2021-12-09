//////////////////////////////////////////////////////////////////////////
// Criacao...........: 04/2006
// Sistema...........: Site da Aquarius Maritime
// Analistas.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Desenvolvedores...: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Copyright.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.ComponentModel;
using System.Data.SqlClient;
using System.Drawing;
using System.Web;
using System.Web.Security;
using System.Web.SessionState;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

public partial class Portos : System.Web.UI.Page
{
  static string strCnx = "Data Source=200.234.197.30;Initial Catalog=aquariusmaritime;Persist Security Info=True;User ID=aquariusmaritime;Password=aquaweb2812";
  static int iPortoID;
  static string PortoID;
  static bool lAlt = false;
  DataSet dsAqua;
  SqlDataAdapter sdaPorto;
  SqlDataAdapter sdaTerminal;
  DataView dvTerminal;

  protected void Page_Load(object sender, EventArgs e)
  {
    string sName;
    string sType;
    string sLib;
    int iHour = DateTime.Now.Hour;
    PortoID = Request.Params["PortoID"];
    SubscrGrid.Attributes["PortoID"] = PortoID;

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

    if (!Page.IsPostBack)
    {
      Session["Page"] = "Portos.aspx";
      BuildDataSet();
      if (PortoID != null)
      {
        foreach (ListItem item in drpPorto.Items)
          if (item.Value == PortoID)
            drpPorto.SelectedIndex = drpPorto.Items.IndexOf(item);
      }
      BindGrid();
    }
  }

  void BuildDataSet()
  {
    string strSQLPor = "SELECT Name, ID FROM Harbour ORDER BY Name";
    SqlConnection cnx = new SqlConnection(strCnx);
    sdaPorto = new SqlDataAdapter(strSQLPor, cnx);
    dsAqua = new DataSet();
    sdaPorto.Fill(dsAqua, "Harbour");
    
    int iReg = 0;
    for (iReg = 0; iReg < dsAqua.Tables["Harbour"].Rows.Count; iReg++)
      drpPorto.Items.Add(new ListItem((string)dsAqua.Tables["Harbour"].Rows[iReg]["Name"], System.Convert.ToString(dsAqua.Tables["Harbour"].Rows[iReg]["ID"])));
    
    drpTipo.Items.Add(new ListItem("Comercial"));
    drpTipo.Items.Add(new ListItem("Passageiro"));
    drpTipo.Items.Add(new ListItem("Petrobr�s"));
    
    cnx.Close();
  }

  protected void BindGrid()
  {
    if (SubscrGrid.Attributes["PortoID"] != null)
      iPortoID = int.Parse(SubscrGrid.Attributes["PortoID"]);
    else if(drpPorto.Items.Count != 0)
      iPortoID = int.Parse(drpPorto.SelectedItem.Value);
    else
      iPortoID = 0;

    string strSQLTerm = "SELECT ID, Name, Type FROM Terminal WHERE Harbour = " + iPortoID;
        
    SqlConnection cnx = new SqlConnection(strCnx);
    sdaTerminal = new SqlDataAdapter(strSQLTerm, cnx);
    dsAqua = new DataSet();
    sdaTerminal.Fill(dsAqua, "Terminal");
    dvTerminal = new DataView();
    dvTerminal = dsAqua.Tables["Terminal"].DefaultView;

    if (SubscrGrid.Attributes["SortExpression"] != "")
      dvTerminal.Sort = SubscrGrid.Attributes["SortExpression"];
    SubscrGrid.DataSource = dvTerminal;
    SubscrGrid.DataBind();
  }

  protected void drpPorto_IndexChanged(object sender, EventArgs e)
  {
    Response.Redirect("Portos.aspx?PortoID=" + drpPorto.SelectedItem.Value);
  }

  protected void SubscrGrid_PageChanged(object sender, DataGridPageChangedEventArgs e)
  {
    AddNewError.Visible = false;
    ShowAddNewControls(false);
    SubscrGrid.CurrentPageIndex = e.NewPageIndex;
    BindGrid();
  }

  protected void SubscrGrid_Sort(object sender, DataGridSortCommandEventArgs e)
  {
    AddNewError.Visible = false;
    ShowAddNewControls(false);
    SubscrGrid.EditItemIndex = -1;
    SubscrGrid.Attributes["SortExpression"] = e.SortExpression.ToString();
    BindGrid();
  }

  protected void SubscrGrid_Delete(object sender, DataGridCommandEventArgs e)
  {
    AddNewError.Visible = false;
    ShowAddNewControls(false);
    SubscrGrid.EditItemIndex = -1;
    DeleteSub((int)(SubscrGrid.DataKeys[e.Item.ItemIndex]));
    BindGrid();
  }

  protected void ShowAddNewControls(Boolean ShowControls)
  {
    CreateNewRow.Visible = !ShowControls;
    AddNewResultCell.Visible = !ShowControls;
    AddNewControlsRow.Visible = ShowControls;
  }
  
  protected void AddNew_Click(object sender, EventArgs e)
  {
    AddSub(txtTerminal.Text, drpTipo.SelectedItem.Text, int.Parse(drpPorto.SelectedItem.Value));
    ShowAddNewControls(false);
    BindGrid();
  }

  protected void CancelAddNew_Click(object sender, EventArgs e)
  {
    ShowAddNewControls(false);
  }

  protected void Create_Click(object sender, EventArgs e)
  {
    AddNewError.Visible = false;
    ShowAddNewControls(true);
    SubscrGrid.EditItemIndex = -1;
    BindGrid();
  }

  public void AddSub(string sNTerm, string sTipo, int iPorto)
  {
    string sqlCmd = "INSERT INTO Terminal (Name, Type, Harbour) " +
                    "VALUES (@NoTerm, @Type, @Porto)";
    SqlConnection Cnx = new SqlConnection(strCnx);
    SqlCommand Cmd = new SqlCommand(sqlCmd, Cnx);

    Cmd.Parameters.Add(new SqlParameter("@NoTerm", SqlDbType.VarChar, 20));
    Cmd.Parameters["@NoTerm"].Value = sNTerm;
    Cmd.Parameters.Add(new SqlParameter("@Type", SqlDbType.VarChar, 20));
    Cmd.Parameters["@Type"].Value = sTipo;
    Cmd.Parameters.Add(new SqlParameter("@Porto", SqlDbType.Int, 4));
    Cmd.Parameters["@Porto"].Value = iPorto;

    Cmd.Connection.Open();
    try
    {
      Cmd.ExecuteNonQuery();
    }
    catch (SqlException)
    {
      Response.Redirect("ErroDados.aspx");
    }
    finally
    {
      Cmd.Connection.Close();
    }
  }

  public void DeleteSub(int SubscrID)
  {
    string sqlCmd = "DELETE FROM Terminal WHERE ID = " + SubscrID.ToString();
    SqlConnection Cnx = new SqlConnection(strCnx);
    SqlCommand Cmd = new SqlCommand(sqlCmd, Cnx);

    Cmd.Connection.Open();
    try
    {
      Cmd.ExecuteNonQuery();
    }
    catch (SqlException)
    {
      Response.Redirect("ErroDados.aspx");
    }
    finally
    {
      Cmd.Connection.Close();
    }
  }

  protected void btnNovPor_Click(object sender, EventArgs e)
  {
    ShowNewPorto(true);
    txtPorto.Text = "";
    txtNPier.Text = "";
    txtCidade.Text = "";
    SubscrGrid.EditItemIndex = -1;
    BindGrid();
  }

  protected void btnAltPor_Click(object sender, EventArgs e)
  {
    int iPorto = int.Parse(drpPorto.SelectedItem.Value);
    string strSQLPor = "SELECT Name, ID, City, NumPier FROM Harbour WHERE ID = "+iPorto;
    SqlConnection cnx = new SqlConnection(strCnx);
    sdaPorto = new SqlDataAdapter(strSQLPor, cnx);
    dsAqua = new DataSet();
    sdaPorto.Fill(dsAqua, "Harbour");
    
    lAlt = true;
    txtPorto.Text  = (string)dsAqua.Tables["Harbour"].Rows[0]["Name"];
    txtNPier.Text  = System.Convert.ToString(dsAqua.Tables["Harbour"].Rows[0]["NumPier"]);
    txtCidade.Text = (string)dsAqua.Tables["Harbour"].Rows[0]["City"];
    
    ShowNewPorto(true);
    SubscrGrid.EditItemIndex = -1;
    BindGrid();
  }

  protected void btnDelPor_Click(object sender, EventArgs e)
  {
    SqlConnection cnx = new SqlConnection(strCnx);
    int iPorto = int.Parse(drpPorto.SelectedItem.Value);
    ListItem sPos = drpPorto.SelectedItem;
    string strSQLCmd = "DELETE FROM Harbour WHERE ID = " + iPorto;
    SqlCommand cmd = new SqlCommand(strSQLCmd, cnx);
    cmd.Connection.Open();
    try
    {
      cmd.ExecuteNonQuery();
      drpPorto.Items.Remove(sPos);
    }
    catch (Exception)
    {
      Response.Redirect("ErroDados.aspx");
    }
    finally
    {
      cmd.Connection.Close();
    }
    BindGrid();
  } 
  
  protected void ShowNewPorto(Boolean ShowControls)
  {
    tbCadPorto.Visible = ShowControls;
    if(ShowControls)
      txtPorto.Focus();
  }
  
  protected void NewPorto_Click(object sender, EventArgs e)
  {
    AddPorto(txtPorto.Text, int.Parse(txtNPier.Text), txtCidade.Text, int.Parse(drpPorto.SelectedItem.Value));
    ShowNewPorto(false);
    BindGrid();
  }

  public void AddPorto(string sNoPorto, int iQPier, string sCidade, int iPorto)
  {
    string sqlCmd;
    
    if (!lAlt)
    {
      sqlCmd = "INSERT INTO Harbour (Name, NumPier, City) VALUES (@Nome, @NPier, @Cidade)";
    }
    else
    {
      sqlCmd = "UPDATE Harbour SET Name = @Nome, NumPier = @NPier, City = @Cidade WHERE ID = @Porto";
    }

    lAlt = false;
    
    SqlConnection Cnx = new SqlConnection(strCnx);
    SqlCommand Cmd = new SqlCommand(sqlCmd, Cnx);

    Cmd.Parameters.Add(new SqlParameter("@Nome", SqlDbType.VarChar, 50));
    Cmd.Parameters["@Nome"].Value = sNoPorto;
    Cmd.Parameters.Add(new SqlParameter("@NPier", SqlDbType.Int, 4));
    Cmd.Parameters["@NPier"].Value = iQPier;
    Cmd.Parameters.Add(new SqlParameter("@Cidade", SqlDbType.VarChar, 30));
    Cmd.Parameters["@Cidade"].Value = sCidade;
    Cmd.Parameters.Add(new SqlParameter("@Porto", SqlDbType.Int, 4));
    Cmd.Parameters["@Porto"].Value = iPorto;

    Cmd.Connection.Open();
    try
    {
      Cmd.ExecuteNonQuery();
      drpPorto.Items.Clear();
      drpTipo.Items.Clear();
      BuildDataSet();
    }
    catch (SqlException)
    {
      Response.Redirect("ErroDados.aspx");
    }
    finally
    {
      Cmd.Connection.Close();
    }
  }

  protected void CanNewPorto_Click(object sender, EventArgs e)
  {
    lAlt = false;
    ShowNewPorto(false);
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
