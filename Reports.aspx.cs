using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ActivityTracker
{
    public partial class Reports : System.Web.UI.Page
    {
        DataLayer dl = new DataLayer();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                PopulateDropdowns();
            }
        }

        protected void PopulateDropdowns()
        {
            ddlActivityReportUsers.DataSource = dl.dtUsers();
            ddlActivityReportUsers.DataTextField = "UserName";
            ddlActivityReportUsers.DataValueField = "UserId";
            ddlActivityReportUsers.DataBind();

            ddlActivityReportMonths.DataSource = dl.dtActivityMonths();
            ddlActivityReportMonths.DataTextField = "Month";
            ddlActivityReportMonths.DataValueField = "MonthYear";
            ddlActivityReportMonths.DataBind();
        }

        protected void btnActivityReportSubmit_Click(object sender, EventArgs e)
        {
            gvActivityReport.DataSource = dl.dtActivityByUser(int.Parse(ddlActivityReportUsers.SelectedValue.ToString()), ddlActivityReportMonths.SelectedValue.ToString());
            gvActivityReport.DataBind();
            gvActivityReport.Visible = true;
        }

        protected void ddlActivityReportUsers_SelectedIndexChanged(object sender, EventArgs e)
        {
            gvActivityReport.Visible = false;
        }
    }
}