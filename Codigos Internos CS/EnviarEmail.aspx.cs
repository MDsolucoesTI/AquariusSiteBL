//////////////////////////////////////////////////////////////////////////
// Criacao...........: 04/2006
// Sistema...........: Site da Aquarius Maritime
// Analistas.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Desenvolvedores...: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Copyright.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

using System;
using System.IO;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.ComponentModel;
using System.Data.SqlClient;
using System.Drawing;
using System.Web.SessionState;
using System.Web.Mail;

public partial class EnviarEmail : System.Web.UI.Page
{
  public string Signature_Value;
  public string Subject_Value;
  static string strCnx = "Data Source=200.234.197.30;Initial Catalog=aquariusmaritime;Persist Security Info=True;User ID=aquariusmaritime;Password=aquaweb2812";
  static int iListID;
  static string ListID;
  DataSet dsAqua;
  SqlDataAdapter sdaGrupo;
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
      sRetorno = (string)Session["Page"];
      linRetorno.NavigateUrl = sRetorno;
      Session["Page"] = "EnviarEmail.aspx";

      Signature_Value = "Fabio Cruz \n Aquarius Agencia Maritima Ltda \n Tel.: +55 12 3892 2935 \n Fax.: +55 12 3892 4486 \n " +
                        "Mob.: +55 12 8121 7227 or +55 13 7803 1404 \n NEXTEL ID .: 55*129*17805 \n " +
                        "e-mail: fabio.cruz@aquariusmaritime.com.br \n Rua Fabio Cassio, 160 - Porto Grande \n " +
                        "Sao Sebastiao- SP - 11.600-000 - Brazil";
			Subject_Value = "Not�cias";
			Page.DataBind();
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

  protected void BindGrid()
  {
    if (ListID != null)
      iListID = int.Parse(ListID);
    else
      iListID = int.Parse(drpGrupo.SelectedItem.Value);

    string strSQLMem = "SELECT EMail, Nome, ListID, CreatedDate, ID FROM Subscribes WHERE ListID = " + iListID;

    SqlConnection cnx = new SqlConnection(strCnx);
    sdaMembro = new SqlDataAdapter(strSQLMem, cnx);
    dsAqua = new DataSet();
    sdaMembro.Fill(dsAqua, "Subscribes");
   }

  void BuildDataSet()
  {
    string strSQLGrupo = "SELECT ID, Name FROM Lists ORDER BY Name";
    SqlConnection cnx = new SqlConnection(strCnx);
    sdaGrupo = new SqlDataAdapter(strSQLGrupo, cnx);
    dsAqua = new DataSet();
    sdaGrupo.Fill(dsAqua, "Lists");

    int iReg = 0;
    for (iReg = 0; iReg < dsAqua.Tables["Lists"].Rows.Count; iReg++)
      drpGrupo.Items.Add(new ListItem((string)dsAqua.Tables["Lists"].Rows[iReg]["Name"], System.Convert.ToString(dsAqua.Tables["Lists"].Rows[iReg]["ID"])));

    cnx.Close();
  }

  protected void Send_Click(object sender, EventArgs e)
  {
    string MsgBody = Body.Text;
    string MsgSubject = Subject.Text;
    iListID = int.Parse(drpGrupo.SelectedItem.Value);

    NewsAdd(iListID, MsgSubject, MsgBody, (FormatDropDown.SelectedIndex == 1));

    MailMessage MailMsg = new MailMessage();
    MailMsg.From = "Fabio Cruz - Aquarius <fabio.cruz@aquariusmaritime.com.br>";
    MailMsg.Cc = CC.Text;
    MailMsg.Priority = (MailPriority)PriorityDropDown.SelectedIndex;
    MailMsg.BodyFormat = (MailFormat)FormatDropDown.SelectedIndex;
    MailMsg.Subject = MsgSubject;
    BindGrid();
    DataTable dt = dsAqua.Tables["Subscribes"];
    foreach (DataRow dr in dt.Rows)
    {
      MailMsg.To = (string)dr["Email"];
      MailMsg.Body = MsgBody;
      SmtpMail.Send(MailMsg);
    }

    MsgPreview.Text = string.Format("<center><b>{0} Emails foram enviados</b></center>", dt.Rows.Count.ToString());
    MsgPreview.Visible = true;
  }

  public void NewsAdd(int ListID, string Subject, string Body, bool IsHTML)
  {
    string sqlCmd = "INSERT INTO NewsHistory (ListID, Subject, Body, IsHTML, SentDate) "+
                    "VALUES (@ListID, @Subject, @Body, @IsHTML, @SentDate)";
    SqlConnection myConn = new SqlConnection(strCnx);

    SqlCommand myCmd = new SqlCommand(sqlCmd, myConn);
    myCmd.Parameters.Add(new SqlParameter("@ListID", SqlDbType.Int, 4));
    myCmd.Parameters["@ListID"].Value = ListID;
    myCmd.Parameters.Add(new SqlParameter("@Subject", SqlDbType.VarChar, 200));
    myCmd.Parameters["@Subject"].Value = Subject;
    myCmd.Parameters.Add(new SqlParameter("@Body", SqlDbType.VarChar));
    myCmd.Parameters["@Body"].Value = Body;
    myCmd.Parameters.Add(new SqlParameter("@IsHTML", SqlDbType.Char, 1));
    myCmd.Parameters["@IsHTML"].Value = IsHTML;
    myCmd.Parameters.Add(new SqlParameter("@SentDate", SqlDbType.DateTime));
    myCmd.Parameters["@SentDate"].Value = DateTime.Now;

    myCmd.Connection.Open();
    try
    {
      myCmd.ExecuteNonQuery();
    }
    catch (Exception)
    {
      Response.Redirect("ErroDados.aspx");
    }
    finally
    {
      myCmd.Connection.Close();
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
