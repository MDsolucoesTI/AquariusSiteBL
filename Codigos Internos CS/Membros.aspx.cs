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

public partial class Membros : System.Web.UI.Page
{
  static string strCnx = "Data Source=200.234.197.30;Initial Catalog=aquariusmaritime;Persist Security Info=True;User ID=aquariusmaritime;Password=aquaweb2812";
  static int iListID;
  static string ListID;
  DataSet dsMembro;
  SqlDataAdapter sdaGrupo;
  SqlDataAdapter sdaCliente;
  SqlDataAdapter sdaMembro;
  DataView dvMembro;

  protected void Page_Load(object sender, EventArgs e)
  {
    string sName;
    string sType;
    string sLib;
    string sRetorno;
    int iHour = DateTime.Now.Hour;
    ListID = Request.Params["ListID"];
    SubscrGrid.Attributes["ListID"] = ListID;

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

    if (! Page.IsPostBack)
    {
      sRetorno = (string)Session["Page"];
      if (sRetorno != "Membros.aspx")
        linRetorno.NavigateUrl = sRetorno;
      Session["Page"] = "Membros.aspx";
      BuildDataSet();
      if (ListID != null)
      {
        foreach (ListItem item in drpGrupo.Items)
          if (item.Value == ListID)
            drpGrupo.SelectedIndex = drpGrupo.Items.IndexOf(item);
      }
      BindGrid();
    }
  }

  void BuildDataSet()
  {
    string strSQLClient = "SELECT CodClient, Company FROM Client ORDER BY Company";
    string strSQLGrupo = "SELECT ID, Name FROM Lists ORDER BY Name";
    SqlConnection cnx = new SqlConnection(strCnx);
    sdaGrupo = new SqlDataAdapter(strSQLGrupo, cnx);
    sdaCliente = new SqlDataAdapter(strSQLClient, cnx);
    dsMembro = new DataSet();
    sdaGrupo.Fill(dsMembro, "Lists");
    sdaCliente.Fill(dsMembro, "Client");
    int iReg;
    iReg = 0;
    for (iReg = 0; iReg < dsMembro.Tables["Lists"].Rows.Count; iReg++)
      drpGrupo.Items.Add(new ListItem((string)dsMembro.Tables["Lists"].Rows[iReg]["Name"], System.Convert.ToString(dsMembro.Tables["Lists"].Rows[iReg]["ID"])));

    cnx.Close();
  }

  protected void BindGrid()
  {
    if (SubscrGrid.Attributes["ListID"] != null)
      iListID = int.Parse(SubscrGrid.Attributes["ListID"]);
    else
      iListID = int.Parse(drpGrupo.SelectedItem.Value);

    string strSQLMem = "SELECT EMail, Nome, ListID, CreatedDate, ID FROM Subscribes WHERE ListID = " + iListID;

    SqlConnection cnx = new SqlConnection(strCnx);
    sdaMembro = new SqlDataAdapter(strSQLMem, cnx);
    dsMembro = new DataSet();
    sdaMembro.Fill(dsMembro, "Subscribes");
    dvMembro = new DataView();
    dvMembro = dsMembro.Tables["Subscribes"].DefaultView;

    if (SubscrGrid.Attributes["SortExpression"] != null)
      dvMembro.Sort = SubscrGrid.Attributes["SortExpression"];
    SubscrGrid.DataSource = dvMembro;
    SubscrGrid.DataBind();
  }

  protected void drpGrupo_IndexChanged(object sender, EventArgs e)
  {
    Response.Redirect("Membros.aspx?ListID=" + drpGrupo.SelectedItem.Value);
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
    DeleteSub( (int)(SubscrGrid.DataKeys[e.Item.ItemIndex]));
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
    AddSub(int.Parse(drpGrupo.SelectedItem.Value), NewName.Text, NewEmail.Text);
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
  
  public void AddSub(int iIDList, string sClient, string sMail)
	{
    string sqlCmd = "INSERT INTO Subscribes (ListID, Nome, EMail, CreatedDate) "+
		                "VALUES (@ListID, @UserID, @EMail, @CreatedDate)";
	  SqlConnection Cnx = new SqlConnection(strCnx);
	 	SqlCommand Cmd = new SqlCommand(sqlCmd, Cnx);
      
    Cmd.Parameters.Add(new SqlParameter("@ListID", SqlDbType.Int, 4));
		Cmd.Parameters["@ListID"].Value = iIDList;
		Cmd.Parameters.Add(new SqlParameter("@UserID", SqlDbType.VarChar, 50));
		Cmd.Parameters["@UserID"].Value = sClient;
    Cmd.Parameters.Add(new SqlParameter("@EMail", SqlDbType.VarChar, 50));
    Cmd.Parameters["@EMail"].Value = sMail;		
		Cmd.Parameters.Add(new SqlParameter("@CreatedDate", SqlDbType.DateTime));
		Cmd.Parameters["@CreatedDate"].Value = DateTime.Now;
    
    Cnx.Open();
    try
		{
			Cmd.ExecuteScalar();	
		}
		catch (SqlException)
		{
			Response.Redirect("ErroDados.aspx");
		}
    finally
		{ 
			Cnx.Close();
		}
	}

  public void DeleteSub(int SubscrID)
	{
	  string sqlCmd = "DELETE FROM Subscribers WHERE ID = " + SubscrID.ToString();
		SqlConnection Cnx = new SqlConnection(strCnx);
		SqlCommand Cmd = new SqlCommand(sqlCmd, Cnx);

    Cnx.Open();
    try
		{
			Cmd.ExecuteScalar();	
		}
		catch (SqlException)
		{
      Response.Redirect("ErroDados.aspx");
		}
    finally
		{ 
		 Cnx.Close();
		}	
	}

  protected void SendEmail_Click(object sender, EventArgs e)
  {
   	Response.Redirect("EnviarEmail.aspx?ListID=" + SubscrGrid.Attributes["ListID"]);
  }

  protected void  btnASPnet_Click(object sender, ImageClickEventArgs e)
  {
    Response.Redirect("http://www.asp.net/");
  }

  protected void  btnMD_Click(object sender, ImageClickEventArgs e)
  {
    Response.Redirect("https://md.dev.br");
  }
}