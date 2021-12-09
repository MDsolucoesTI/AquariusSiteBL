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
using System.Web;


namespace NewsMailer
{
    /// <summary>
    ///    Support functions for the DB Subscribers and UsersData tables
    /// </summary>
    public class SubscribersDB
    {
        private string connString;

		// constructor method
		public SubscribersDB(string ConnString)
        {
			connString = ConnString;
        }
		
		// return all the subscribers of the specified list
		public DataSet GetSubscribers(int ListID)
		{
			string sqlCmd = "SELECT FirstName, LastName, Email, ";
			sqlCmd += "ListID, UserID, CreatedDate, Subscribers.ID FROM UsersData ";
			sqlCmd += "INNER JOIN Subscribers ON UsersData.ID = Subscribers.UserID ";
			sqlCmd += "WHERE Subscribers.ListID = " + ListID;

			DataSet subscribers = new DataSet();
			OleDbConnection myConn = new OleDbConnection(connString);
			OleDbDataAdapter myDAdp = new OleDbDataAdapter(sqlCmd, myConn);
			
			myDAdp.Fill(subscribers, "Subscribers");
			return subscribers;

		}
		
		
		// return the row with all the details of the specified subscriber
		public DataRow GetDetails(int SubscrID)
		{
			string sqlCmd = "SELECT FirstName, LastName, Email, ";
			sqlCmd += "ListID, UserID, CreatedDate, Subscribers.ID FROM UsersData ";
			sqlCmd += "INNER JOIN Subscribers ON UsersData.ID = Subscribers.UserID ";
			sqlCmd += "WHERE Subscribers.ID = " + SubscrID;

			DataSet subscribers = new DataSet();
			OleDbConnection myConn = new OleDbConnection(connString);
			OleDbDataAdapter myDAdp = new OleDbDataAdapter(sqlCmd, myConn);
			
			myDAdp.Fill(subscribers, "Subscribers");
			// return the first row, which is the only row returned by the query
			return subscribers.Tables[0].Rows[0];
		}


		// delete the subscriber identified by the specified ID
		// the user is deleted only if this is the last list he is subscribed to
		public bool Delete(int SubscrID)
		{
			bool ret = true;

			int UserID= GetUserID(SubscrID);
			
			// delete this subscriber
			string sqlCmd = "DELETE FROM Subscribers WHERE ID = " + SubscrID.ToString();
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
			
			// count the number of other subscription for this user
			sqlCmd = "SELECT COUNT(*) AS NumSubscriptions FROM Subscribers WHERE UserID=" + UserID;
			DataSet users = new DataSet();
			OleDbDataAdapter myDAdp = new OleDbDataAdapter(sqlCmd, myConn);
			myDAdp.Fill(users, "UsersData");
			
			// if this was the only subscription for this user, delete the user too
			if ((int)users.Tables[0].Rows[0]["NumSubscriptions"]<1)
			{
				sqlCmd = "DELETE FROM UsersData WHERE ID = " + UserID.ToString();
				myCmd = new OleDbCommand(sqlCmd, myConn);
			
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
			}
			return ret;			
		}


		// update FirstName, LastName and Email of the user identified by the subscription ID
		public bool Update(int SubscrID, string FirstName, string LastName, string Email)
		{
			bool ret = true;

			string sqlCmd = "UPDATE UsersData SET FirstName = @FirstName, LastName = @LastName, ";
			sqlCmd += "Email = @Email WHERE ID = @UserIDID";
			OleDbConnection myConn = new OleDbConnection(connString);
			
			// create a new command and set all its required parameters
			OleDbCommand myCmd = new OleDbCommand(sqlCmd, myConn);
			myCmd.Parameters.Add(new OleDbParameter("@FirstName", OleDbType.VarChar, 50));
			myCmd.Parameters["@FirstName"].Value = FirstName.Trim();
			myCmd.Parameters.Add(new OleDbParameter("@LastName", OleDbType.VarChar, 50));
			myCmd.Parameters["@LastName"].Value = LastName.Trim();
			myCmd.Parameters.Add(new OleDbParameter("@Email", OleDbType.VarChar, 50));
			myCmd.Parameters["@Email"].Value = Email.Trim();
			myCmd.Parameters.Add(new OleDbParameter("@UserID", OleDbType.Integer, 4));
			myCmd.Parameters["@UserID"].Value = GetUserID(SubscrID);

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


		// add a new subscription
		public bool Add(int ListID, string FirstName, string LastName, string Email)
		{
			bool ret = true;

			string sqlCmd = "INSERT INTO UsersData (FirstName, LastName, Email) VALUES (@FirstName, @LastName, @Email)";
			OleDbCommand myCmd;
			OleDbConnection myConn = new OleDbConnection(connString);

			// try to get the user who has the specified Email
			int UserID = GetUserID(Email);
			// if the user does not exist, create it in the UsersData table
			if (UserID == -1)
			{				
				myCmd = new OleDbCommand(sqlCmd, myConn);
				myCmd.Parameters.Add(new OleDbParameter("@FirstName", OleDbType.VarChar, 50));
				myCmd.Parameters["@FirstName"].Value = FirstName.Trim();
				myCmd.Parameters.Add(new OleDbParameter("@LastName", OleDbType.VarChar, 50));
				myCmd.Parameters["@LastName"].Value = LastName.Trim();
				myCmd.Parameters.Add(new OleDbParameter("@Email", OleDbType.VarChar, 50));
				myCmd.Parameters["@Email"].Value = Email.Trim();
	
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
				
				// get the ID of the user just created
				UserID = GetUserID(Email);
			}
			
			// if the user is not already subscribed to this list, add him
			if (GetSubscrID(ListID, Email)==-1)
			{
				sqlCmd = "INSERT INTO Subscribers (ListID, UserID, CreatedDate) ";
				sqlCmd += "VALUES (@ListID, @UserID, @CreatedDate)";
				myCmd = new OleDbCommand(sqlCmd, myConn);
				
				myCmd.Parameters.Add(new OleDbParameter("@ListID", OleDbType.Integer, 4));
				myCmd.Parameters["@ListID"].Value = ListID;
				myCmd.Parameters.Add(new OleDbParameter("@UserID", OleDbType.Integer, 4));
				myCmd.Parameters["@UserID"].Value = UserID;
				myCmd.Parameters.Add(new OleDbParameter("@CreatedDate", OleDbType.DBDate));
				myCmd.Parameters["@CreatedDate"].Value = DateTime.Now;
		
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
			else
				// return false if the user was already subscribed to this list
				// and has not been added a second time
				return false;
		}
		
		
		// return the ID of the user with the specified Email
		public int GetUserID(string Email)
		{
			string sqlCmd = "SELECT ID FROM UsersData WHERE Email='" + Email.Trim() + "'";
			DataSet users = new DataSet();
			OleDbConnection myConn = new OleDbConnection(connString);
			OleDbDataAdapter myDAdp = new OleDbDataAdapter(sqlCmd, myConn);
			myDAdp.Fill(users, "UsersData");
			
			// if the table has more than 0 rows, the user has been found
			if (users.Tables[0].Rows.Count > 0)
				// return its ID
				return (int)users.Tables[0].Rows[0]["ID"];
			else
				return -1;
		}
		
		
		// return the ID of the user of a specified subscription
		public int GetUserID(int SubscrID)
		{
			string sqlCmd = "SELECT UserID FROM Subscribers WHERE ID=" + SubscrID;
			DataSet subscribers = new DataSet();
			OleDbConnection myConn = new OleDbConnection(connString);
			OleDbDataAdapter myDAdp = new OleDbDataAdapter(sqlCmd, myConn);
			myDAdp.Fill(subscribers, "Subscribers");
			
			// if the table has more than 0 rows, the user has been found
			if (subscribers.Tables[0].Rows.Count > 0)
				// return its ID
				return (int)subscribers.Tables[0].Rows[0]["UserID"];
			else
				return -1;
		}
		
		
		// return the ID of the subscription to the specified list, and whose user's Email
		// is the specified Email
		public int GetSubscrID(int ListID, string Email)
		{
			DataTable dt = GetSubscribers(ListID).Tables[0];
			DataRow[] foundRows = dt.Select("Email='" + Email.Trim() + "'");
					
			if (foundRows.Length > 0)
				return (int)foundRows[0]["ID"];
			else
				return -1;
		}
		
    }
}
