using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ActivityTracker
{
    public partial class Home : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            DataLayer dl = new DataLayer();

            lblWeeklyTopPerformer.Text = lblWeeklyTopPerformer.Text + dl.sTopPerformer("Week");
            lblMonthlyTopPerformer.Text = lblMonthlyTopPerformer.Text + dl.sTopPerformer("Month");
            lblQuote.Text = dl.sRandomQuote();

            gvWeekRanking.DataSource = dl.dtRanking("Week");
            gvWeekRanking.DataBind();

            gvMonthRanking.DataSource = dl.dtRanking("Month");
            gvMonthRanking.DataBind();
        }
    }
}