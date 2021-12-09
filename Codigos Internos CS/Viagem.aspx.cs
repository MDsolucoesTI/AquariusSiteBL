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

public partial class Viagem : System.Web.UI.Page
{
  static string strCnx = "Data Source=200.234.197.30;Initial Catalog=aquariusmaritime;Persist Security Info=True;User ID=aquariusmaritime;Password=aquaweb2812";
  static int iListID;
  static string ListID;
  static bool lNovo;
  static int iPosicao;
  DataSet dsAqua;
  SqlDataAdapter sdaCliente;
  SqlDataAdapter sdaViagem;
  DataView dvViagem;

  protected void Page_Load(object sender, EventArgs e)
  {
    string sName;
    string sType;
    string sLib;
    string sRetorno;
    int iHour = DateTime.Now.Hour;
    ListID = Request.Params["ListID"];
    ViaGrid.Attributes["ListID"] = ListID;

    sName = "Anonimo";
    sType = "vis";
    sLib = "loc";
    lNovo = false;

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

    if (sType != "adm")
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
      sRetorno = (string)Session["Page"];
      if (sRetorno != "Viagem.aspx")
        linRetorno.NavigateUrl = sRetorno;
      Session["Page"] = "Viagem.aspx";
      BuildDataSet();
      if (ListID != null)
      {
        foreach (ListItem item in drpCliente.Items)
          if (item.Value == ListID)
            drpCliente.SelectedIndex = drpCliente.Items.IndexOf(item);      
      
      }
      BindGrid();
    }
  }

  void BuildDataSet()
  {
    string strSQLClient = "SELECT CodClient, Company FROM Client ORDER BY Company";
    SqlConnection cnx = new SqlConnection(strCnx);
    sdaCliente = new SqlDataAdapter(strSQLClient, cnx);
    dsAqua = new DataSet();
    sdaCliente.Fill(dsAqua, "Client");

    int iReg = 0;
    for (iReg = 0; iReg < dsAqua.Tables["Client"].Rows.Count; iReg++)
      drpCliente.Items.Add(new ListItem((string)dsAqua.Tables["Client"].Rows[iReg]["Company"], System.Convert.ToString(dsAqua.Tables["Client"].Rows[iReg]["CodClient"])));

    cnx.Close();
  }

  protected void BindGrid()
  {
    if (ViaGrid.Attributes["ListID"] != null)
      iListID = int.Parse(ViaGrid.Attributes["ListID"]);
    else
      iListID = int.Parse(drpCliente.SelectedItem.Value);

    string strSQLMem = "SELECT * FROM Viagem WHERE CodCliente = " + iListID;

    SqlConnection cnx = new SqlConnection(strCnx);
    sdaViagem = new SqlDataAdapter(strSQLMem, cnx);
    dsAqua = new DataSet();
    sdaViagem.Fill(dsAqua, "Viagem");
    dvViagem = new DataView();
    dvViagem = dsAqua.Tables["Viagem"].DefaultView;

    if (ViaGrid.Attributes["SortExpression"] != "")
      dvViagem.Sort = ViaGrid.Attributes["SortExpression"];
    ViaGrid.DataSource = dvViagem;
    ViaGrid.DataBind();
  }

  protected void drpCliente_IndexChanged(object sender, EventArgs e)
  {
    Response.Redirect("Viagem.aspx?ListID=" + drpCliente.SelectedItem.Value);
  }
  
  protected void ViaGrid_PageChanged(object sender, DataGridPageChangedEventArgs e)
  {
    AddNewError.Visible = false;
    ShowAddNewControls(false);
    ViaGrid.CurrentPageIndex = e.NewPageIndex;
    BindGrid();
  }

  protected void ViaGrid_Sort(object sender, DataGridSortCommandEventArgs e)
  {
    AddNewError.Visible = false;
    ShowAddNewControls(false);
    ViaGrid.EditItemIndex = -1;
    ViaGrid.Attributes["SortExpression"] = e.SortExpression.ToString();
    BindGrid();
  }

  protected void ViaGrid_Edit(object sender, DataGridCommandEventArgs e)
  {
    iPosicao = e.Item.ItemIndex;
    int iCodVia = int.Parse(ViaGrid.DataKeys[iPosicao].ToString());
    string sqlCmd = "SELECT * FROM Viagem WHERE CodVia = " + iCodVia;

    lNovo = false;

    DataSet news = new DataSet();
    SqlConnection myConn = new SqlConnection(strCnx);
    SqlDataAdapter myDAdp = new SqlDataAdapter(sqlCmd, myConn);

    myDAdp.Fill(news, "Viagem");
    txtAta.Text = news.Tables["Viagem"].Rows[0]["Ata"].ToString();
    txtTitulo.Text = news.Tables["Viagem"].Rows[0]["Titulo"].ToString();
    AddNewError.Visible = false;
    ShowAddNewControls(true);
    BindGrid();
  }

  protected void ViaGrid_Update(object sender, DataGridCommandEventArgs e)
  {
    lNovo = false;
    AddSub(int.Parse(ViaGrid.DataKeys[e.Item.ItemIndex].ToString()), txtTitulo.Text, txtAta.Text);
    ShowAddNewControls(false);
    BindGrid();
  }
  
  protected void ViaGrid_Cancel(object sender, DataGridCommandEventArgs e)
  {
    ViaGrid.EditItemIndex = -1;
    BindGrid();
  }
  
  protected void ViaGrid_Delete(object sender, DataGridCommandEventArgs e)
  {
    AddNewError.Visible = false;
    ShowAddNewControls(false);
    ViaGrid.EditItemIndex = -1;
    DeleteSub((int)(ViaGrid.DataKeys[e.Item.ItemIndex]));
    BindGrid();
  }

  protected void ViaGrid_Selection(object sender, EventArgs e)
  {
    int iCodVia = int.Parse(ViaGrid.DataKeys[ViaGrid.SelectedIndex].ToString());
    string sqlCmd = "SELECT * FROM Viagem WHERE CodVia = " + iCodVia;

    DataSet news = new DataSet();
    SqlConnection myConn = new SqlConnection(strCnx);
    SqlDataAdapter myDAdp = new SqlDataAdapter(sqlCmd, myConn);

    myDAdp.Fill(news, "Viagem");
    txtAta.Text = news.Tables["Viagem"].Rows[0]["Ata"].ToString();
    txtTitulo.Text = news.Tables["Viagem"].Rows[0]["Titulo"].ToString();

    AddNew.Enabled = false;
    txtAta.ReadOnly = true;
    txtTitulo.ReadOnly = true;
    ShowAddNewControls(true);
  }

  protected void ShowAddNewControls(Boolean ShowControls)
  {
    CreateNewRow.Visible = !ShowControls;
    AddNewResultCell.Visible = !ShowControls;
    AddNewControlsRow.Visible = ShowControls;
    AddNewCon.Visible = ShowControls;
  }

  protected void AddNew_Click(object sender, EventArgs e)
  {
    if (lNovo)
      AddSub(int.Parse(drpCliente.SelectedItem.Value), txtTitulo.Text, txtAta.Text );
    else
      AddSub(int.Parse(ViaGrid.DataKeys[iPosicao].ToString()), txtTitulo.Text, txtAta.Text);
    ShowAddNewControls(false);
    BindGrid();
  }

  protected void CancelAddNew_Click(object sender, EventArgs e)
  {
    AddNew.Enabled = true;
    txtAta.ReadOnly = false;
    txtTitulo.ReadOnly = false;
    ShowAddNewControls(false);
  }

  protected void Create_Click(object sender, EventArgs e)
  {
    lNovo = true;    
    AddNewError.Visible = false;
    ShowAddNewControls(true);
    ViaGrid.EditItemIndex = -1;
    BindGrid();
  }

  public void AddSub(int iCod, string sTitulo, string sAta)
  {
    string sqlCmd;
    if (lNovo)
    {
      sqlCmd = "INSERT INTO Viagem (CodCliente, Data, Titulo, Ata) " +
                      "VALUES (@UserID, @Date, @Titu, @Ata)";
    }
    else
    {
      sqlCmd = "UPDATE Viagem SET Titulo = @Titu, Ata = @Ata WHERE CodVia = @Cod";
    }
    SqlConnection Cnx = new SqlConnection(strCnx);
    SqlCommand Cmd = new SqlCommand(sqlCmd, Cnx);

    Cmd.Parameters.Add(new SqlParameter("@Titu", SqlDbType.VarChar, 50));
    Cmd.Parameters["@Titu"].Value = sTitulo;
    Cmd.Parameters.Add(new SqlParameter("@Ata", SqlDbType.VarChar, 5000));
    Cmd.Parameters["@Ata"].Value = sAta;
    if (lNovo)
    {
      Cmd.Parameters.Add(new SqlParameter("@UserID", SqlDbType.Int, 4));
      Cmd.Parameters["@UserID"].Value = iCod;
      Cmd.Parameters.Add(new SqlParameter("@Date", SqlDbType.DateTime));
      Cmd.Parameters["@Date"].Value = DateTime.Now;
    }
    else
    {
      Cmd.Parameters.Add(new SqlParameter("@Cod",SqlDbType.Int));
      Cmd.Parameters["@Cod"].Value = iCod;
    }
    Cmd.Connection.Open();
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
      Cmd.Connection.Close();
    }
  }

  public void DeleteSub(int SubscrID)
  {
    string sqlCmd = "DELETE FROM Viagem WHERE CodVia = " + SubscrID.ToString();
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

  protected void btnASPnet_Click(object sender, ImageClickEventArgs e)
  {
    Response.Redirect("http://www.asp.net/");
  }

  protected void btnMD_Click(object sender, ImageClickEventArgs e)
  {
    Response.Redirect("https://md.dev.br");
  }

  protected void UpdateProgress1_Init(object sender, EventArgs e)
  {
    System.Threading.Thread.Sleep(2000);
  }
  
}
