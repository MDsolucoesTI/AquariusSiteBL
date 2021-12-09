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
    ///    Support functions for the DB Lists table
    /// </summary>
    public class ListsDB
    {
        private string connString;

		// constructor method
		public ListsDB(string ConnString)
        {
			connString = ConnString;
        }

		// return all the Lists
		public DataSet GetLists()
		{
			DataSet lists = new DataSet();
			OleDbConnection myConn = new OleDbConnection(connString);
			OleDbDataAdapter myDAdp = new OleDbDataAdapter("SELECT * FROM Lists", myConn);
			
			myDAdp.Fill(lists, "Lists");
			return lists;

		}


		// return only the record with the specified ID
		public DataRow GetDetails(int ListID)
		{
			string sqlCmd = "SELECT * FROM Lists WHERE ID = " + ListID;

			DataSet lists = new DataSet();
			OleDbConnection myConn = new OleDbConnection(connString);
			OleDbDataAdapter myDAdp = new OleDbDataAdapter(sqlCmd, myConn);
			
			myDAdp.Fill(lists, "Lists");
			// return the first row, which is the only one
			return lists.Tables[0].Rows[0];
		}


		// delete the record identified by the specified ID
		public bool Delete(int ListID)
		{
			bool ret = true;
		
			string sqlCmd = "DELETE FROM Lists WHERE ID = " + ListID.ToString();
			OleDbConnection myConn = new OleDbConnection(connString);
			OleDbCommand myCmd = new OleDbCommand(sqlCmd, myConn);
			
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


		// update Name and Description of the record identified by the specified ID
		public bool Update(int ListID, string ListName, string ListDescr)
		{
			bool ret = true;			

			string sqlCmd = "UPDATE Lists SET Name = @ListName, Description = @ListDescr WHERE ID = @ListID";
			OleDbConnection myConn = new OleDbConnection(connString);
			
			// create a command and set the values for the required parameters
			OleDbCommand myCmd = new OleDbCommand(sqlCmd, myConn);
			myCmd.Parameters.Add(new OleDbParameter("@ListName", OleDbType.VarChar, 50));
			myCmd.Parameters["@ListName"].Value = ListName.Trim();;
			myCmd.Parameters.Add(new OleDbParameter("@ListDescr", OleDbType.VarChar, 250));
			myCmd.Parameters["@ListDescr"].Value = ListDescr.Trim();
			myCmd.Parameters.Add(new OleDbParameter("@ListID", OleDbType.Integer, 4));
			myCmd.Parameters["@ListID"].Value = ListID;

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

		
		// add a new record with the specified Name and Description
		public bool Add(string ListName, string ListDescr)
		{
			bool ret = true;			
	
			string sqlCmd = "INSERT INTO Lists (Name, Description) VALUES (@ListName, @ListDescr)";
			OleDbConnection myConn = new OleDbConnection(connString);
			
			// create a command and set the values for the required parameters			
			OleDbCommand myCmd = new OleDbCommand(sqlCmd, myConn);
			myCmd.Parameters.Add(new OleDbParameter("@ListName", OleDbType.VarChar, 50));
			myCmd.Parameters["@ListName"].Value = ListName.Trim();
			myCmd.Parameters.Add(new OleDbParameter("@ListDescr", OleDbType.VarChar, 250));
			myCmd.Parameters["@ListDescr"].Value = ListDescr.Trim();;

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
