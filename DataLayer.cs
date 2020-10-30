using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Runtime.CompilerServices;

namespace ActivityTracker
{
    public class DataLayer
    {
        string conn = ConfigurationManager.ConnectionStrings["ActivitySQL"].ConnectionString;


        public DataTable dtUsers()
        {
            SqlConnection dtConn = new SqlConnection();
            dtConn.ConnectionString = conn;

            SqlCommand cmdUsers = new SqlCommand("select UserId, FirstName + ' ' + LastName [UserName] from dbo.Users where Active = 1 order by LastName, FirstName", dtConn);
            SqlDataAdapter daUsers = new SqlDataAdapter(cmdUsers);
            DataTable dtReturn = new DataTable();
            daUsers.Fill(dtReturn);

            return dtReturn;

        }


        public int iInsertActivity(int iUserId, string strActivity, string strActivityDate, int iActivityMinutes)
        {
            //SqlConnection connInsertActivity = new SqlConnection(conn);

            using (SqlConnection connInsertActivity = new SqlConnection(conn))
            {
                connInsertActivity.Open();
                SqlCommand cmdInsertActivity = new SqlCommand("dbo.InsertActivity", connInsertActivity);
                cmdInsertActivity.CommandType = CommandType.StoredProcedure;
                cmdInsertActivity.Parameters.AddWithValue("@UserId", SqlDbType.Int).Value = iUserId;
                cmdInsertActivity.Parameters.AddWithValue("@Activity", SqlDbType.NVarChar).Value = strActivity;
                cmdInsertActivity.Parameters.AddWithValue("@ActivityDate", SqlDbType.Date).Value = DateTime.Parse(strActivityDate);
                cmdInsertActivity.Parameters.AddWithValue("@ActivityMinutes", SqlDbType.Int).Value = iActivityMinutes;
                int iRows = cmdInsertActivity.ExecuteNonQuery();
                connInsertActivity.Close();

                return iRows;
            }
        }


        public DataTable dtLastTenEntries(int iUserId)
        {
            //SqlConnection connLastTen = new SqlConnection(conn);

            using (SqlConnection connLastTen = new SqlConnection(conn))
            {
                connLastTen.Open();
                SqlCommand cmdLastTen = new SqlCommand("dbo.GetLastTenEntries", connLastTen);
                cmdLastTen.CommandType = CommandType.StoredProcedure;
                cmdLastTen.Parameters.AddWithValue("@UserId", SqlDbType.Int).Value = iUserId;

                SqlDataAdapter daLastTen = new SqlDataAdapter(cmdLastTen);
                DataTable dtReturn = new DataTable();
                daLastTen.Fill(dtReturn);

                return dtReturn;
            }
        }


        public string sTopPerformer(string sTopType)
        {
            using (SqlConnection connTopPerformer = new SqlConnection(conn))
            {
                connTopPerformer.Open();
                SqlCommand cmdTopPerformer = new SqlCommand("dbo.GetTopPerformer", connTopPerformer);
                cmdTopPerformer.CommandType = CommandType.StoredProcedure;
                cmdTopPerformer.Parameters.AddWithValue("@TopType", SqlDbType.VarChar).Value = sTopType;

                string sReturn = cmdTopPerformer.ExecuteScalar().ToString();

                return sReturn;
            }
        }


        public DataTable dtRanking(string sRankType)
        {
            using (SqlConnection connRanking = new SqlConnection(conn))
            {
                connRanking.Open();
                SqlCommand cmdRanking = new SqlCommand("dbo.GetStackRanking", connRanking);
                cmdRanking.CommandType = CommandType.StoredProcedure;
                cmdRanking.Parameters.AddWithValue("@RankType", SqlDbType.VarChar).Value = sRankType;

                SqlDataAdapter daRanking = new SqlDataAdapter(cmdRanking);
                DataTable dtReturn = new DataTable();
                daRanking.Fill(dtReturn);

                return dtReturn;
            }
        }



        public DataTable dtActivityMonths()
        {
            using (SqlConnection connActMonths = new SqlConnection(conn))
            {
                connActMonths.Open();
                SqlCommand cmdActMonths = new SqlCommand("dbo.GetActivityMonths", connActMonths);
                cmdActMonths.CommandType = CommandType.StoredProcedure;

                SqlDataAdapter daActMonths = new SqlDataAdapter(cmdActMonths);
                DataTable dtReturn = new DataTable();
                daActMonths.Fill(dtReturn);

                return dtReturn;
            }
        }



        public DataTable dtActivityByUser(int iUserId, string sMonthYear)
        {
            using (SqlConnection connActivityByUser = new SqlConnection(conn))
            {
                connActivityByUser.Open();
                SqlCommand cmdActivityByUser = new SqlCommand("dbo.GetUserActivity_By_UserId", connActivityByUser);
                cmdActivityByUser.CommandType = CommandType.StoredProcedure;
                cmdActivityByUser.Parameters.AddWithValue("@UserId", SqlDbType.Int).Value = iUserId;
                cmdActivityByUser.Parameters.AddWithValue("@MonthYear", SqlDbType.VarChar).Value = sMonthYear;

                SqlDataAdapter daActivityByUser = new SqlDataAdapter(cmdActivityByUser);
                DataTable dtReturn = new DataTable();
                daActivityByUser.Fill(dtReturn);

                return dtReturn;
            }
        }


        public string sRandomQuote()
        {
            using (SqlConnection connQuote = new SqlConnection(conn))
            {
                connQuote.Open();
                SqlCommand cmdQuote = new SqlCommand("dbo.GetRandomQuote", connQuote);
                cmdQuote.CommandType = CommandType.StoredProcedure;

                string sReturn = cmdQuote.ExecuteScalar().ToString();

                return sReturn;
            }
        }


        public void vUpdateWeeklyResults()
        {
            using (SqlConnection connUpdateWeeklyResults = new SqlConnection(conn))
            {
                connUpdateWeeklyResults.Open();
                SqlCommand cmdUpdateWeeklyResults = new SqlCommand("dbo.UpdateWeeklyResults", connUpdateWeeklyResults);
                cmdUpdateWeeklyResults.CommandType = CommandType.StoredProcedure;

                cmdUpdateWeeklyResults.ExecuteNonQuery();
            }
        }



        public DataTable dtWeeklyResultsByUser(int iUserId)
        {
            using (SqlConnection connWeeklyResultsByUser = new SqlConnection(conn))
            {
                connWeeklyResultsByUser.Open();
                SqlCommand cmdWeeklyResultsByUser = new SqlCommand("dbo.GetWeeklyResults_By_UserId", connWeeklyResultsByUser);
                cmdWeeklyResultsByUser.CommandType = CommandType.StoredProcedure;
                cmdWeeklyResultsByUser.Parameters.AddWithValue("@UserId", SqlDbType.Int).Value = iUserId;

                SqlDataAdapter daWeeklyResultsByUser = new SqlDataAdapter(cmdWeeklyResultsByUser);
                DataTable dtReturn = new DataTable();
                daWeeklyResultsByUser.Fill(dtReturn);

                return dtReturn;
            }
        }
    }
}