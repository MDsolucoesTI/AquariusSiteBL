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
using System.Data.SqlClient;
using System.Data.OleDb;


namespace NewsMailer
{
    /// <summary>
    ///    Summary description for Utilities.
    /// </summary>
    public class Utilities
    {
        public Utilities()
        {

        }

		
		// read and return the content of the specified text file
		public static string ReadTextFile(string FilePath)
		{
			string Content = "";
			try
			{
				StreamReader sr = new StreamReader (File.Open(FilePath, FileMode.Open) );
				Content = sr.ReadToEnd();
				sr.Close();
				
			}
			catch { /* exception handling here */ }
			return Content;
		}


		// save the specified string to the specified text file
		// (the file is created ex-novo even if it already exists)
		public static bool SaveTextFile(string FilePath, string FileText)
		{
			try
			{
				StreamWriter sw = File.CreateText(FilePath);
				sw.Write(FileText);
				sw.Close();
				return true;
				
			}
			catch { /* exception handling here */ }
			
			return false;
		}
		
		public static string ProcessListTags(string Message, string ConnString, int ListID)
		{
			// get the details of the specified list from the settings file
			NewsMailer.ListsDB lists = new NewsMailer.ListsDB(ConnString);
			DataRow dr = lists.GetDetails(ListID);
			
			Message = Message.Replace("#ListID#", ListID.ToString());
			Message = Message.Replace("#ListName#", (string)dr["Name"]);
			Message = Message.Replace("#ListDescription#", (string)dr["Description"]);
			
			return Message;
		}
		
		public static string ProcessSubscriberTags(string Message, string ConnString, int SubscrID)
		{
			// if the subscriber does not exist, replace with empty strings
			if (SubscrID==-1)
			{
				Message = Message.Replace("#SubscriberID#", "");	
				Message = Message.Replace("#SubscriberFirstName#", "");	
				Message = Message.Replace("#SubscriberLastName#", "");
				Message = Message.Replace("#SubscriberEmail#", "");
			}
			else
			{
				// otherwise get the details of this subscriber
				NewsMailer.SubscribersDB subscribers = new NewsMailer.SubscribersDB(ConnString);
				DataRow dr = subscribers.GetDetails(SubscrID);
			
				// and replace the tags
				Message = Message.Replace("#SubscriberID#", SubscrID.ToString());	
				Message = Message.Replace("#SubscriberFirstName#", (string)dr["FirstName"]);	
				Message = Message.Replace("#SubscriberLastName#", (string)dr["LastName"]);
				Message = Message.Replace("#SubscriberEmail#", (string)dr["Email"]);
			}
			
			return Message;
		}
		
		
		// replace the settings tag with thir values
		public static string ProcessSettingsTags(string Message, string SettingsFilePath)
		{
			// get the settings
			NewsMailer.AppSettings settings = NewsMailer.AppConfig.GetSettings(SettingsFilePath);
			
			// replace the tags
			Message = Message.Replace("#SenderName#", settings.SenderName);	
			Message = Message.Replace("#SenderEmail#", settings.SenderEmail);	
			Message = Message.Replace("#SubscribeURL#", settings.SubscribeURL);	
					
			return Message;
		}
		
		
    }
}
