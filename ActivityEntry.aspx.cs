using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ActivityTracker
{
    public partial class ActivityEntry : System.Web.UI.Page
    {
        DataLayer dl = new DataLayer();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ddlUsers.DataSource = dl.dtUsers();
                ddlUsers.DataValueField = "UserId";
                ddlUsers.DataTextField = "UserName";
                ddlUsers.DataBind();

                lblLastTenEntries.Visible = false;
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                int i = dl.iInsertActivity(int.Parse(ddlUsers.SelectedValue.ToString()), txtActivity.Text.ToString(), txtActivityDate.Text.ToString(), int.Parse(txtActivityMinutes.Text.ToString()));

                lblLastTenEntries.Text = string.Empty;
                lblLastTenEntries.Text = "Here are the last ten entries for " + ddlUsers.Items[ddlUsers.SelectedIndex].Text.ToString();
                lblLastTenEntries.Visible = true;

                gvLastTenEntries.DataSource = dl.dtLastTenEntries(int.Parse(ddlUsers.SelectedValue.ToString()));
                gvLastTenEntries.DataBind();

                ddlUsers.SelectedValue = "-99";
                txtActivity.Text = string.Empty;
                txtActivityDate.Text = string.Empty;
                txtActivityMinutes.Text = string.Empty;

                dl.vUpdateWeeklyResults();
            }
        }
    }
}