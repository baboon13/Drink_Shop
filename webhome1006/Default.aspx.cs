using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace webhome1006
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            ClientDetailview.DataBind();
        }

        protected void LoginBT_click(object sender, EventArgs e)
        {
            ClientDetailview.Visible = false;
            Shop.Visible = false;
            if(1 == ClientDetailview.DataItemCount)
            {
                Session["name"] = ClientDetailview.Rows[0].Cells[1].Text;
                Session["money"] = ClientDetailview.Rows[1].Cells[1].Text;
                Session["phone"] = ClientDetailview.Rows[2].Cells[1].Text;
                Shop.Visible = true;
            }
            else
            {
                Session["name"] = null;
                Session["money"] = null;
                Session["phone"] = null;
                ClientDetailview.Visible = true;
            }
        }
    }
}