//////////////////////////////////////////////////////////////////////////
// Criacao...........: 04/2006
// Sistema...........: Site da Aquarius Maritime
// Analistas.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Desenvolvedores...: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Copyright.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

using System;
using System.Data;
using System.Data.OleDb;


namespace NewsMailer
{
    /// <summary>
    ///    Support functions for the DB NewsHistory table
    /// </summary>
    public class NewsHistoryDB
    {
        private string connString;

		// constructor method
		public NewsHistoryDB(string ConnString)
        {
			connString = ConnString;
        }

		
		// return all the news of the specified list
		public DataSet GetNews(int ListID)
		{
			string sqlCmd = "SELECT ID, Subject, IsHTML, SentDate FROM NewsHistory WHERE ListID = " + ListID;

			DataSet news = new DataSet();
			OleDbConnection myConn = new OleDbConnection(connString);
			OleDbDataAdapter myDAdp = new OleDbDataAdapter(sqlCmd, myConn);
			
			myDAdp.Fill(news, "NewsHistory");
			return news;

		}
		
		
		// return the row that identifies the specified News record
		public DataRow GetDetails(int NewsID)
		{
			string sqlCmd = "SELECT * FROM NewsHistory WHERE ID = " + NewsID;

			DataSet news = new DataSet();
			OleDbConnection myConn = new OleDbConnection(connString);
			OleDbDataAdapter myDAdp = new OleDbDataAdapter(sqlCmd, myConn);
			
			myDAdp.Fill(news, "NewsHistory");
			// return the first row, which is the only one
			return news.Tables[0].Rows[0];
		}

		
		// delete the specified news record
		public bool Delete(int NewsID)
		{
			bool ret = true;

			string sqlCmd = "DELETE FROM NewsHistory WHERE ID = " + NewsID.ToString();
			OleDbConnection myConn = new OleDbConnection(connString);
			OleDbCommand myCmd = new OleDbCommand(sqlCmd, myConn);
			
			myConn.Open();
			try
			{
				myCmd.ExecuteNonQuery();	
			}
			catch (OleDbException)
			{
				ret = false;
			}
			finally
			{ 
				myCmd.Connection.Close();
			}

			return ret;
		}
		
		
		// add a news record with the specified Subject, Body and format, for the
		// specified list
		public bool Add(int ListID, string Subject, string Body, bool IsHTML)
		{
			bool ret = true;

			string sqlCmd = "INSERT INTO NewsHistory (ListID, Subject, Body, IsHTML, SentDate) ";
			sqlCmd += "VALUES (@ListID, @Subject, @Body, @IsHTML, @SentDate)";
			OleDbConnection myConn = new OleDbConnection(connString);

			// create a command and set the required parameters
			OleDbCommand myCmd = new OleDbCommand(sqlCmd, myConn);
			myCmd.Parameters.Add(new OleDbParameter("@ListID", OleDbType.Integer, 4));
			myCmd.Parameters["@ListID"].Value = ListID;
			myCmd.Parameters.Add(new OleDbParameter("@Subject", OleDbType.VarChar, 200));
			myCmd.Parameters["@Subject"].Value = Subject;
			myCmd.Parameters.Add(new OleDbParameter("@Body", OleDbType.VarChar));
			myCmd.Parameters["@Body"].Value = Body;
			myCmd.Parameters.Add(new OleDbParameter("@IsHTML", OleDbType.Boolean));
			myCmd.Parameters["@IsHTML"].Value = IsHTML;
			myCmd.Parameters.Add(new OleDbParameter("@SentDate", OleDbType.DBDate));
			myCmd.Parameters["@SentDate"].Value = DateTime.Now;

			myCmd.Connection.Open();
			try
			{
				myCmd.ExecuteNonQuery();	
			}
			catch (OleDbException)
			{
				ret = false;
			}
			finally
			{ 
				myCmd.Connection.Close();
			}

			return ret;
		}

    }
}
