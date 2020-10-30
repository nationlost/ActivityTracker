using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net.Mail;

namespace ActivityTracker
{
    public partial class Admin : System.Web.UI.Page
    {
        DataLayer dl = new DataLayer();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSendWeeklyEmails_Click(object sender, EventArgs e)
        {

            DataTable dtUsers = dl.dtUsers();

            for (int iUser = 0; iUser < dtUsers.Rows.Count; iUser++)
            {

                
                DataTable dtResults = dl.dtWeeklyResultsByUser(int.Parse(dtUsers.Rows[iUser]["UserId"].ToString()));
                
                string textBody = " <table border=" + 1 + " cellpadding=" + 0 + " cellspacing=" + 0 + " width = " + 800 + "><tr bgcolor='#4da6ff'><td><b>Week Start</b></td> <td> <b> Week End</b> </td> <td> <b> Name</b> </td> <td> <b> Total Minutes</b> </td></tr>";
                for (int loopCount = 0; loopCount < dtResults.Rows.Count; loopCount++)
                {
                    textBody += "<tr><td>" + dtResults.Rows[loopCount]["Week_Start"].ToString().Substring(0, 10) + "</td><td> " + dtResults.Rows[loopCount]["Week_End"].ToString().Substring(0, 10) + "</td><td>" + dtResults.Rows[loopCount]["UserFullName"] + "</td><td> " + dtResults.Rows[loopCount]["TotalMinutes"] + "</td> </tr>";
                }
                textBody += "</table>";
                MailMessage message = new MailMessage();
                message.From = new MailAddress("bob.mccreedy@gmail.com");

                message.To.Add(new MailAddress(dtResults.Rows[0]["UserEmail"].ToString()));

                message.Subject = "Workoutmc.club Weekly Results for " + dtResults.Rows[0]["UserFullName"].ToString();
                message.Body = textBody;
                message.IsBodyHtml = true;

                SmtpClient client = new SmtpClient();
                client.Send(message);
                

                lblEmailResult.Text = lblEmailResult.Text + dtResults.Rows[0]["UserFullName"].ToString() + ", ";

            }
        }
    }
}