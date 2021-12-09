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

public partial class Grupo: System.Web.UI.Page
{
  DataSet dsGrupo; 
  SqlDataAdapter sdaGrupo;
  DataView dvGrupo;
  static string strCnx = "Data Source=200.234.197.30;Initial Catalog=aquariusmaritime;Persist Security Info=True;User ID=aquariusmaritime;Password=aquaweb2812";

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

    if (! Page.IsPostBack)
    {
      Session["Page"] = "Grupo.aspx";
      BindGrid();
    }
  }

  protected void BindGrid()
  {
    string strSQLLists = "SELECT * FROM Lists";
    SqlConnection cnx = new SqlConnection(strCnx);
    sdaGrupo = new SqlDataAdapter(strSQLLists, cnx);
    dsGrupo = new DataSet();
   
    cnx.Open();
    sdaGrupo.Fill(dsGrupo, "Lists");
    dvGrupo = new DataView();
    dvGrupo = dsGrupo.Tables["Lists"].DefaultView;
    
    if (GridGrupo.Attributes["SortExpression"] != null) 
      dvGrupo.Sort = GridGrupo.Attributes["SortExpression"];
    
    GridGrupo.DataSource = dvGrupo;
    GridGrupo.DataBind();
  }

  protected void ListsGrid_Sort(object sender, DataGridSortCommandEventArgs e)
  {
    ShowAddNewControls(false);
    GridGrupo.EditItemIndex = -1;
    GridGrupo.Attributes["SortExpression"] = e.SortExpression.ToString();
    BindGrid();
  }

  protected void ListsGrid_Edit(object sender, DataGridCommandEventArgs e)
  {
    ShowAddNewControls(false);
    GridGrupo.EditItemIndex = e.Item.ItemIndex;
    BindGrid();
  }

  protected void ListsGrid_CancelEdit(object sender, DataGridCommandEventArgs e)
  {
    GridGrupo.EditItemIndex = -1;
    BindGrid();
  }

  protected void ListsGrid_Update(object sender, DataGridCommandEventArgs e)
  {
    string ListName = ((TextBox)e.Item.FindControl("EditListName")).Text;
    string ListDescr = ((TextBox)e.Item.FindControl("EditListDescr")).Text;
    int ListID = (int)GridGrupo.DataKeys[e.Item.ItemIndex];

    Update(ListID, ListName, ListDescr);

    GridGrupo.EditItemIndex = -1;
    BindGrid();
  }
  
  protected void ListsGrid_Delete(object sender, DataGridCommandEventArgs e)
  {
    ShowAddNewControls(false);
    GridGrupo.EditItemIndex = -1;
    Delete((int)GridGrupo.DataKeys[e.Item.ItemIndex]);
    BindGrid();
  }

  protected void AddNew_Click(object sender, EventArgs e)
  {
    Add(NewListName.Text, NewListDescr.Text);
    ShowAddNewControls(false);
    BindGrid();
  }

  protected void CancelAddNew_Click(object sender, EventArgs e)
  {
    ShowAddNewControls(false);
  }

  protected void Create_Click(object sender, EventArgs e)
  {
    ShowAddNewControls(true);
    GridGrupo.EditItemIndex = -1;
    BindGrid();
  }

  protected void ShowAddNewControls(bool ShowControls)
  {
    NewListName.Text = "";
    NewListDescr.Text = "";
    AddNewControlsRow.Visible = ShowControls;
    CreateNewRow.Visible = !ShowControls;
  }

  public void Delete(int ListID)
  {
    string strCmd = "DELETE FROM Lists WHERE ID = " + ListID.ToString();
    SqlConnection cnx = new SqlConnection(strCnx);
    SqlCommand Cmd = new SqlCommand(strCmd, cnx);

    cnx.Open();
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
  }

  public void Update(int ListID, string ListName, string ListDescr)
  {
    string strCmd = "UPDATE Lists SET Name = @ListName, Description = @ListDescr WHERE ID = @ListID";
    SqlConnection cnx = new SqlConnection(strCnx);
    SqlCommand Cmd = new SqlCommand(strCmd, cnx);

    Cmd.Parameters.Add(new SqlParameter("@ListName", SqlDbType.VarChar, 50));
    Cmd.Parameters["@ListName"].Value = ListName;
    Cmd.Parameters.Add(new SqlParameter("@ListDescr", SqlDbType.VarChar, 250));
    Cmd.Parameters["@ListDescr"].Value = ListDescr;
    Cmd.Parameters.Add(new SqlParameter("@ListID", SqlDbType.Int, 4));
    Cmd.Parameters["@ListID"].Value = ListID;

    cnx.Open();
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
  }
  
  public void Add(string ListName, string ListDescr)
  {
    string strCmd = "INSERT INTO Lists (Name, Description) VALUES (@ListName, @ListDescr)";
    SqlConnection cnx = new SqlConnection(strCnx);
    SqlCommand Cmd = new SqlCommand(strCmd, cnx);

    Cmd.Parameters.Add(new SqlParameter("@ListName", SqlDbType.VarChar, 50));
    Cmd.Parameters["@ListName"].Value = ListName;
    Cmd.Parameters.Add(new SqlParameter("@ListDescr", SqlDbType.VarChar, 250));
    Cmd.Parameters["@ListDescr"].Value = ListDescr;
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
      Cmd.Connection.Close();
    }
  }

  protected void btnMD_Click(object sender, ImageClickEventArgs e)
  {
    Response.Redirect("https://md.dev.br");
  }

  protected void btnASPnet_Click(object sender, ImageClickEventArgs e)
  {
    Response.Redirect("http://www.asp.net/");
  }
}
